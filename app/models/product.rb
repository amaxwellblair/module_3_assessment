class Product < OpenStruct

  def self.service
    BestBuyService.new
  end

  def self.find_by(args)
    search = args[:search]
    service.get_products(search).map do |product|
      Product.new(product)
    end
  end

end
