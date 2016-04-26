require "rails_helper"

RSpec.feature "user can see item index" do
  it "sees items" do
    Item.create(name: "bacon", description: "best kind of bacon", image_url: "www.whocares.com")
    Item.create(name: "not bacon", description: "why eat it", image_url: "www.whocares.com")

    visit "/"

    expect(page).to have_content "2 Items"
  end
end
