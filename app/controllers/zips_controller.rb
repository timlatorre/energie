class ZipsController < ApplicationController

  def index
  end

  def create
    if Zip.blank?
      html = HTTParty.get('http://data.cityofnewyork.us/api/views/74cu-ncm4/rows.json')
      json = JSON(html.body)
      json['data'].each do |nrg|
        building_type = nrg[0][9]
        lat = nrg[0][8][1].to_f
        long = nrg[0][8][2].to_f
          if nrg[8][0].nil?
            zip_code = nil
          else
            zip_code = JSON(nrg[8][0])['zip']
          end
        kwh = nrg[0][10].to_f
        Zip.create[:zip_code => zip_code, :lat => lat, :long => long, :building_type => building_type, :kwh => kwh]
      end
    end
    redirect_to root_path
  end



end
