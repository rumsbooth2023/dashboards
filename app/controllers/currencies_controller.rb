class CurrenciesController < ActionController::Base
  def first_currency
    @raw_currency_data = open("https://api.exchangerate.host/symbols").read
    @parsed_currency_data = JSON.parse(@raw_currency_data)
    @symbols_hash = @parsed_currency_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys


    render ({ :template => "currency_templates/step_one.html.erb"})
  end
end
