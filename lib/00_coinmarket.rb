
require 'nokogiri'
require 'open-uri'
require 'rspec'


def cryptos_values 

	page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

	# création de mes deux arrays noms et valeurs 
	ar_name = []
	ar_value = []


	# récupératuion des données depuis l'url avec xpath 
	name = page.xpath('//td[3]')
	value = page.xpath('//td[5]')

	#//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[44]/td[2]/div/a[1]

	#insertions des valeurs extraites dans chaque array respectif
	name.each{ |name| 
   	ar_name<<name.text }

 	value.each{|price| 
 	ar_value << price.text }

	#hachage des deux tableaux 
	final_hash = Hash[ar_name.zip ar_value]  
puts final_hash
end 

def perform 
	cryptos_values
end

perform 



#table = page.xpath("//div[2]/div/div[1]").text





