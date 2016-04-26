class Product < OpenStruct

  def self.service
    BestBuyService.new
  end

  def self.find_by(args)
    search = args[:search]
    return service.get_products(search)
  end

end
