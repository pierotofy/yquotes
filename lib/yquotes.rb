require 'csv'
require 'daru'
require 'tmpdir'
require 'yquotes/version'
require 'yquotes/yahoo'

module YQuotes
  class Client
    def initialize
      @yahoo_client = Yahoo.new
    end

    # get_quote: returns Daru::DataFrame of the quote with volume and close
    def get_quote(ticker, args = {})
      if args.is_a? Hash
        start_date = args[:start_date] if args[:start_date]
        start_date ||= args[:s] if args[:s]

        end_date = args[:end_date] if args[:end_date]
        end_date ||= args[:e] if args[:e]

        period = args[:period] if args[:period]
        period ||= args[:p] if args[:p]
      end

      csv = @yahoo_client.get_csv(ticker, start_date, end_date, period, 'quote')
      create_quotes_from_csv(csv)
    end

    # get_splits: returns Daru::DataFrame of the splits with date and ratio
    def get_splits(ticker, args = {})
      if args.is_a? Hash
        start_date = args[:start_date] if args[:start_date]
        start_date ||= args[:s] if args[:s]

        end_date = args[:end_date] if args[:end_date]
        end_date ||= args[:e] if args[:e]

        period = args[:period] if args[:period]
        period ||= args[:p] if args[:p]
      end

      csv = @yahoo_client.get_csv(ticker, start_date, end_date, period, 'splits')
      create_splits_from_csv(csv)
    end
    

    alias historical_data get_quote
    alias historical_quote get_quote

    private

    def create_splits_from_csv(data)
      return if Daru::DataFrame.new(date: []) if data.length <= 1

      df = create_from_csv(data, 'splits')
      df.rename_vectors 'Date' => :date, 'Stock Splits' => :splits
      df
    end

    def create_quotes_from_csv(data)
      return if Daru::DataFrame.new(date: []) if data.length <= 1
      
      df = create_from_csv(data, 'quote')
      df.rename_vectors 'Date' => :date, 'Volume' => :volume, 'Adj Close' => :adj_close, 'Open' => :open, 'Close' => :close, 'High' => :high, 'Low' => :low
      d = df.filter(:row) { |row| row[:volume] > 0 }
    end

    def create_from_csv(data, prefix)
      file_path = Dir.tmpdir + "/#{Time.now.to_i}_#{prefix}"

      CSV.open(file_path, 'w') do |out|
        data.each do |row|
          out << row unless row.include? 'null'
        end
      end

      df = nil

      df = Daru::DataFrame.from_csv(file_path, converters: :numeric)
      File.delete(file_path) if File.exist?(file_path)

      # sort from earlier to latest
      df = df.sort ['Date'], ascending: [false]

      # strip columns and create index
      df.index = Daru::Index.new(df['Date'].to_a)
      df
    end
  end
end