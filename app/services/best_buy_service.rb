class BestBuyService
  attr_reader :connection

  def connect
    @connection ||= Faraday.new(:url => 'https://api.bestbuy.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_products(search)
    resp = connect.get do |req|
      req.url "/v1/products(search=#{search})"
      req.params['apiKey'] = ENV['BEST_BUY_KEY']
      req.params['format'] = 'json'
      req.params['show'] = ['sku','name','salePrice', 'customerReviewAverage', 'shortDescription', 'image']
    end

    return parse(resp.body)
  end

  private

    def parse(json)
      JSON.parse(json)
    end

end
