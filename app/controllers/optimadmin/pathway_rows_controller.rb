module Optimadmin
  class PathwayRowsController < Optimadmin::ApplicationController
    before_action :set_pathway_row, only: [:show, :edit, :update, :destroy]

    def index
      @pathway_rows = Optimadmin::BaseCollectionPresenter.new(collection: PathwayRow.where('title ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::PathwayRowPresenter)
    end

    def show
    end

    def new
      @pathway_row = PathwayRow.new
    end

    def edit
    end

    def create
      @pathway_row = PathwayRow.new(pathway_row_params)
      if @pathway_row.save
        redirect_to pathway_rows_url, notice: 'Pathway row was successfully created.'
      else
        render :new
      end
    end

    def update
      if @pathway_row.update(pathway_row_params)
        redirect_to pathway_rows_url, notice: 'Pathway row was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @pathway_row.destroy
      redirect_to pathway_rows_url, notice: 'Pathway row was successfully destroyed.'
    end

  private


    def set_pathway_row
      @pathway_row = PathwayRow.find(params[:id])
    end

    def pathway_row_params
      params.require(:pathway_row).permit(:pathway_section_id, :position, :colour, :position, :display)
    end
  end
end
