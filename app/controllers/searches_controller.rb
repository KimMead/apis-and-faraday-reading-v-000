class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'GPDFNJFYOVXIJJNRRL3WWQUEJAY42G3ICSUWDSDJFCL55BG4'
      req.params['client_secret'] = '3RKSODGPAHM2QTEWS1F0ZQ4DLQW0HRMAO553100LYS11M0E2'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
