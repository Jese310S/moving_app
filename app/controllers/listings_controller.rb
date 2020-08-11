class ListingsController < ApplicationController
    # before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
   
    def index
        @users = User.all
        @listings = Listing.all
    end

    def show
        @listings = Listing.find(params[:id])
        @user = @listings.user
    end

    #create action for microposts
    def create
        @listing = current_user.listings.build(listing_params) #strong params
        @listing.image.attach(params[:listing][:image])
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
        params.require(:listing).permit(:title, :image, :comment, :price, :moving_time, :moving_date)
    end

    def correct_user
        @listing = current_user.listings.find_by(id: params[:id])
        redirect_to root_url if @listing.nil?
        end
end
