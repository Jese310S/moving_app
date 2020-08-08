class ListingsController < ApplicationController
   
    def create
        @listing = current_user.listings.build(listing_params)
        if @listing.save
            flash[:success] = "Listing created!"
            redirect_to root_url
            else
            render 'static_pages/home'
            end
    end

    def destroy
   
    end

    private

#strong params that permits only listing's content
    def listing_params
        params.require(:listing).permit(:content)
    end
end
