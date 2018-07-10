class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'NJELLRU0BS5KQOQGTYN5FL2NSHGVYM135TLBIWQT51VYYUVU'
      req.params['client_secret'] = 'N4XIAYZRBXJ2M145YDXHGGPX0BGC0L5EG5VIVPMLQ2KPXRMQ'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end

end
