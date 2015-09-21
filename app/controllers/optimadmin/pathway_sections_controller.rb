module Optimadmin
  class PathwaySectionsController < Optimadmin::ApplicationController
    before_action :set_pathway_section, only: [:show, :edit, :update, :destroy]

    def index
      @pathway_sections = Optimadmin::BaseCollectionPresenter.new(collection: PathwaySection.where('title ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::PathwaySectionPresenter)
    end

    def show
    end

    def new
      @pathway_section = PathwaySection.new
    end

    def edit
    end

    def create
      @pathway_section = PathwaySection.new(pathway_section_params)
      if @pathway_section.save
        redirect_to pathway_sections_url, notice: 'Pathway section was successfully created.'
      else
        render :new
      end
    end

    def update
      if @pathway_section.update(pathway_section_params)
        redirect_to pathway_sections_url, notice: 'Pathway section was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @pathway_section.destroy
      redirect_to pathway_sections_url, notice: 'Pathway section was successfully destroyed.'
    end

  private


    def set_pathway_section
      @pathway_section = PathwaySection.find(params[:id])
    end

    def pathway_section_params
      params.require(:pathway_section).permit(:name, :position, :pathway_rows_count, :pathway_jigsaw_pieces_count, :display)
    end
  end
end
