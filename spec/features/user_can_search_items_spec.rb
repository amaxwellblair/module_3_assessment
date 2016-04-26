require 'rails_helper'

RSpec.feature "user can search items" do
  it "can see searched items" do
    VCR.use_cassette "/best_buy/products" do
      visit '/'

      fill_in "Search Box", with: "sennheiser"
      click_on "search"

      expect(current_path).to eq("/search")

      expect(page).to have_content "15 items"
      expect(page).to have_content "sku"
      expect(page).to have_content "name"
      expect(page).to have_content "customer average review"
      expect(page).to have_content "short description"
      expect(page).to have_content "sale price"
      expect(page).to have_content "image"
    end
  end
end
