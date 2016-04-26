require "rails_helper"

describe "item api" do
  it "returns all of the items" do
    Item.create(name: "bacon", description: "best kind of bacon", image_url: "www.whocares.com")
    Item.create(name: "not bacon", description: "why eat it", image_url: "www.whocares.com")

    get "/api/v1/items.json"


    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.length).to eq(2)
    expect(items.first["name"]).to eq("bacon")
    # expect(items.first["created_at"]).to eq(nil)
    # expect(items.first["updated_at"]).to eq(nil)
  end

  it "returns a specific item" do

  end
end
