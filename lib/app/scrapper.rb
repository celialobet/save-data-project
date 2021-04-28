require 'nokogiri'
require 'open-uri'


def get_townhall_urls 

  annuaire = []
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html")) #ouvre la page url

  page.xpath('//a[@class="lientxt"]/@href').each do |url| 
    annuaire << "https://www.annuaire-des-mairies.com/#{url.text}"
  end # va chercher chaque url des mairies, complète le nom de l'url pour qu'il soit complet, et rentre le tout dans un array


  def get_townhall_email(townhall_url)

    page = Nokogiri::HTML(URI.open("#{townhall_url}"))
    puts page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #indique le chemin pour aller chercher les adresses emails sur la page même de la mairie
    
  end

  i = 0
  while annuaire[i] != nil do
    get_townhall_email("#{annuaire[i]}")
    i+=1
  end #va chercher toutes les adresses emails sur la page même de la mairie

end

print get_townhall_urls