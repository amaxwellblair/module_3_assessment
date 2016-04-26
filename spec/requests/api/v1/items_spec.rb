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
    item = Item.create(name: "bacon", description: "best kind of bacon", image_url: "www.whocares.com")
    Item.create(name: "not bacon", description: "why eat it", image_url: "www.whocares.com")

    get "/api/v1/items/#{item.id}.json"


    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["name"]).to eq("bacon")
    expect(item["created_at"]).to eq(nil)
    expect(item["updated_at"]).to eq(nil)
  end

  it "deletes a specific item" do
    item = Item.create(name: "bacon", description: "best kind of bacon", image_url: "www.whocares.com")
    Item.create(name: "not bacon", description: "why eat it", image_url: "www.whocares.com")

    delete "/api/v1/items/#{item.id}.json"


    expect(response.status).to eq(204)

    items = Item.all

    expect(items.length).to eq(1)
  end

  it "creates an item" do
    item = Item.create(name: "bacon", description: "best kind of bacon", image_url: "www.whocares.com")
    Item.create(name: "not bacon", description: "why eat it", image_url: "www.whocares.com")

    post "/api/v1/items.json", parameters: {name: "MeSeeks", description: "AndDestroy", image_url: "www.whocares.com"}

    expect(response.status).to eq(201)

    item = JSON.parse(response.body)

    items = Item.all

    expect(items.length).to eq(3)
    expect(item["name"]).to eq("MeSeeks")
    expect(item["created_at"]).to eq(nil)
    expect(item["updated_at"]).to eq(nil)
  end
end
