module Optimadmin
  class ServicesController < Optimadmin::ApplicationController
    before_action :set_service, only: [:show, :edit, :update, :destroy]

    edit_images_for Service, [[:image, { show: ['fit', 756, 200], homepage: ['fill', 183, 150] }]]

    def index
      @services = Optimadmin::BaseCollectionPresenter.new(collection: Service.where('name ILIKE ?', "#{params[:search]}%").order(position: :asc).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ServicePresenter)
    end

    def show
    end

    def new
      @service = Service.new
    end

    def edit
    end

    def create
      @service = Service.new(service_params)
      if @service.save
        redirect_to services_url, notice: 'Service was successfully created.'
      else
        render :new
      end
    end

    def update
      if @service.update(service_params)
        redirect_to services_url, notice: 'Service was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @service.destroy
      redirect_to services_url, notice: 'Service was successfully destroyed.'
    end

  private


    def set_service
      @service = Service.friendly.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :icon, :icon_cache, :remote_icon_url, :image, :image_cache, :remote_image_url,
                                      :suggested_url, :colour, :overview, :display, :menu_name, :subdomain,
                                      testimonial_ids: [], frequently_asked_question_ids: [], location_ids: [])
    end
  end
end
