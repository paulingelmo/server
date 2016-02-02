require 'httparty'
require 'nokogiri'

def ticker(stock)
response = HTTParty.get("http://finance.yahoo.com/q?s=#{stock}")
dom = Nokogiri::HTML(response.body)
share_price = dom.xpath("//span[@id='yfs_l84_#{stock.downcase}']").first.content
return "The current share price for #{stock} is $#{share_price}."
end

ticker(GOOG)
