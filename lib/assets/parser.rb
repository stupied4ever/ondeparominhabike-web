%w[benchmark pp rubygems].each { |x| require x }
gem 'hpricot', '>= 0.6'
require 'hpricot'

################################
# Parsing Twitter API Response #
################################
xml = File.read('lugares.xml')

  doc, lugares = Hpricot::XML(xml), []
  (doc/:Placemark).each do |s|
    place = {:point => {}}
    %w[name description styleUrl].each do |a|
      value = s.at(a)
      place[a.intern] = value.innerHTML if value
    end
    point = s.at('Point')
    cord = point.at("coordinates") if point
    place[:point] = cord.innerHTML if point && cord
    lugares << place
  end
  
  lugares.each do | l |
    if l[:point] != {}
      lat = l[:point].split(",")[1]
      lng = l[:point].split(",")[0]
      puts "Lugar.new(:executa_geolocalizacao_reversa => true, :tipo => 'importado', :nome => '#{l[:name].gsub("'", "\"")}', :latitude => '#{lat}', :longitude => '#{lng}').save!" 
    # else
    #   puts "// #{l[:name]}"
    end
  end
  
  # puts lugares.size
  # pp statuses