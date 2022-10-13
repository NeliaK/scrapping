
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))  

arr_city = []
email = []

city = page.xpath('//a[@class="lientxt"]').text 

for i in 1..61
    x = [page.xpath("//a[@class = 'lientxt']/@href")[i].text[1..-1]].join
    page_b = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{x}"))
    email  = email << page_b.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text  
end

puts city 
puts email 

