module Optimadmin
  class LocationsController < Optimadmin::ApplicationController
    before_action :set_location, only: [:show, :edit, :update, :destroy]

    def index
      @locations = Optimadmin::BaseCollectionPresenter.new(collection: Location.service_filter(params[:service_id]).where('name ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::LocationPresenter)
    end

    def show
    end

    def new
      @location = Location.new
    end

    def edit
    end

    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to locations_url, notice: 'Location was successfully created.'
      else
        render :new
      end
    end

    def update
      if @location.update(location_params)
        redirect_to locations_url, notice: 'Location was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @location.destroy
      redirect_to locations_url, notice: 'Location was successfully destroyed.'
    end

  private


    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :content, :opening_times, :display, service_ids: [])
    end
  end
end
