module Api
  module V1
    class ItemsController < ApiController
      respond_to :json
      def index
        respond_with Item.all
        # , each_serializer: ItemSerializer
      end

      def show
        respond_with Item.find_by(id: params[:id])
        # , serializer: ItemSerializer
      end

      def destroy
        Item.destroy(params[:id])
        respond_with(status: 204)
      end

      def create
        @item = Item.create(item_params)
        respond_with(@item, status: 201)
        # , serializer: ItemSerializer
      end

      private
        def item_params
          params.require(:parameters).permit(:name, :description, :image_url)
        end
    end
  end
end
