class StoresController < InheritedResources::Base
  private

    def store_params
      params.require(:store).permit(:nama, :description, :logo, :user_id, :address)
    end
end
