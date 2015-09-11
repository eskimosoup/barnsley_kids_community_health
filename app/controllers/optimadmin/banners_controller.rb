module Optimadmin
  class BannersController < Optimadmin::ApplicationController
    before_action :set_banner, only: [:show, :edit, :update, :destroy]

    edit_images_for Banner, [[:image, { homepage: ['fit', 560, 276] }]]

    def index
      @banners = Optimadmin::BaseCollectionPresenter.new(collection: Banner.order(position: :asc), view_template: view_context, presenter: Optimadmin::BannerPresenter)
    end

    def show
    end

    def new
      @banner = Banner.new
    end

    def edit
    end

    def create
      @banner = Banner.new(banner_params)
      if @banner.save
        redirect_to banners_url, notice: 'Banner was successfully created.'
      else
        render :new
      end
    end

    def update
      if @banner.update(banner_params)
        redirect_to banners_url, notice: 'Banner was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @banner.destroy
      redirect_to banners_url, notice: 'Banner was successfully destroyed.'
    end

  private


    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params.require(:banner).permit(:name, :image, :image_cache, :remote_image_url, :content, :position, :display, :link)
    end
  end
end
