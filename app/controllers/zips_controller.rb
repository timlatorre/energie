class ZipsController < ApplicationController

  def index
  end

  def create
    if Zip.blank?
      html = HTTParty.get('http://data.cityofnewyork.us/api/views/74cu-ncm4/rows.json')
      json = JSON(html.body)
      json['data'].each do |zip|
        building_type = zip[0][9]
        lat = zip[0][8][1].to_f
        long = zip[0][8][2].to_f
        zip_code = zip[0][8][0][42..46]
        kwh = zip[0][10].to_f
        Zip.create[:zip_code => zip_code, :lat => lat, :long => long, :building_type => building_type, :kwh => kwh]
      end
    end
    redirect_to root_path
  end



end
