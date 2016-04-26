module Api
  module V1
    class ItemsController < ApiController
      respond_to :json
      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find_by(id: params[:id])
      end

      def destroy
        Item.destroy(id: params[:id])
      end
    end
  end
end
