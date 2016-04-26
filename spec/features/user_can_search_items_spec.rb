require 'rails_helper'

RSpec.feature "user can search items" do
  it "can see searched items" do
    VCR.use_cassette "/best_buy/products" do
      visit '/'

      fill_in "Search Box", with: "sennheiser"
      click_on "search"

      expect(current_path).to eq("/search")

      expect(page).to have_content "15 items"
      expect(page).to have_content "SKU: 4763330"
      expect(page).to have_content "Name: Galaxy Audio - Headset Microphone - Beige"
      expect(page).to have_content "Customer average review: null"
      expect(page).to have_content "Short description: GALAXY AUDIO Headset Microphone: Crafted for most wireless transmitters; can be used with a JIB/PB; works with most PC sound cards; flexible fit design"
      expect(page).to have_content "Sale price: 199.99"
    end
  end

  it "can see advanced search items" do
    VCR.use_cassette "/best_buy/advance_products" do
      visit '/'

      fill_in "Search Box", with: "sennheiser headphones white"
      click_on "search"

      expect(current_path).to eq("/search")

      expect(page).to have_content "3 items"
      # expect(page).to have_content "SKU: 4763330"
      # expect(page).to have_content "Name: Galaxy Audio - Headset Microphone - Beige"
      # expect(page).to have_content "Customer average review: null"
      # expect(page).to have_content "Short description: GALAXY AUDIO Headset Microphone: Crafted for most wireless transmitters; can be used with a JIB/PB; works with most PC sound cards; flexible fit design"
      # expect(page).to have_content "Sale price: 199.99"
    end
  end
end
