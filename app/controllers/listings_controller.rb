class ListingsController < ApplicationController
    # before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
   
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
        @listing.destroy
        flash[:success] = "Listing deleted"
        if request.referrer.nil? || request.referrer == listings_url
            redirect_to root_url
            else
            redirect_to request.referrer
            end
    end

    private

#strong params that permits only listing's content
    def listing_params
        params.require(:listing).permit(:title)
    end

    def correct_user
        @listing = current_user.listings.find_by(id: params[:id])
        redirect_to root_url if @listing.nil?
        end
end
