class CurrenciesController < ActionController::Base
  def first_currency
    @raw_currency_data = open("https://api.exchangerate.host/symbols").read
    @parsed_currency_data = JSON.parse(@raw_currency_data)
    @symbols_hash = @parsed_currency_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render ({ :template => "currency_templates/step_one.html.erb"})
  end

  def second_currency
    @from_symbol = params.fetch("from_currency")
    @raw_currency_data = open("https://api.exchangerate.host/symbols").read
    @parsed_currency_data = JSON.parse(@raw_currency_data)
    @symbols_hash = @parsed_currency_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render ({ :template => "currency_templates/step_two.html.erb"})
  end

  def convert_currency
    @from_symbol = params.fetch("from_currency").to_s
    @to_symbol = params.fetch("to_currency").to_s
    @convert_url = "https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}"
    @raw_conversion_data = open(@convert_url).read
    @parsed_conversion_data = JSON.parse(@raw_conversion_data)
    @rate_hash = @parsed_conversion_data.fetch("info").fetch("rate")
    render ({ :template => "currency_templates/convert_currency.html.erb"})
  end
end
