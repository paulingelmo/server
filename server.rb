require 'sinatra'

# get '/' do
#   send_file File.join(settings.public_folder, 'hello.txt')
# end

get '/' do
  'Track stock prices! Enter \'localhost:4567/ticker?stock=****\', where ****
  is the symbol of the stock you wish to track.'
end

get '/ticker' do
  require 'httparty'
  require 'nokogiri'

  stock = params[:stock].upcase

  def ticker(stock)
  response = HTTParty.get("http://finance.yahoo.com/q?s=#{stock}")
  dom = Nokogiri::HTML(response.body)
  share_price = dom.xpath("//span[@id='yfs_l84_#{stock.downcase}']").first.content
  return "The current share price for #{stock} is $#{share_price}."
  end

  ticker(stock)
end
