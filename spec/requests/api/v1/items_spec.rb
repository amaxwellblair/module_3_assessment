require "rails_helper"

describe "item api" do
  it "returns all of the items" do
    get "/api/v1/items"

    Item.create(name: "bacon", description: "best kind of bacon", image_url: "www.whocares.com")
    Item.create(name: "not bacon", description: "why eat it", image_url: "www.whocares.com")

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.length).to eq(2)
    expect(items.first.name).to eq("bacon")
    expect(items.first.respond_to?("created_at")).to eq(false)
    expect(items.first.respond_to?("updated_at")).to eq(false)
  end
end
