module Optimadmin
  class PathwayRowsController < Optimadmin::ApplicationController

    before_action :set_pathway_section
    before_action :set_pathway_row, only: [:show, :edit, :update, :destroy]

    def index
      @pathway_rows = Optimadmin::BaseCollectionPresenter.new(collection: @pathway_section.pathway_rows.ordered,
                                                view_template: view_context, presenter: Optimadmin::PathwayRowPresenter)
    end

    def show
    end

    def new
      @pathway_row = @pathway_section.pathway_rows.new
    end

    def edit
    end

    def create
      @pathway_row = @pathway_section.pathway_rows.new(pathway_row_params)
      if @pathway_row.save
        redirect_to pathway_section_pathway_rows_url(@pathway_section), notice: 'Pathway row was successfully created.'
      else
        render :new
      end
    end

    def update
      if @pathway_row.update(pathway_row_params)
        redirect_to pathway_section_pathway_rows_url(@pathway_section), notice: 'Pathway row was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @pathway_row.destroy
      redirect_to pathway_section_pathway_rows_url(@pathway_section), notice: 'Pathway row was successfully destroyed.'
    end

  private

    def set_pathway_section
      @pathway_section = PathwaySection.find(params[:pathway_section_id])
    end

    def set_pathway_row
      @pathway_row = @pathway_section.pathway_rows.find(params[:id])
    end

    def pathway_row_params
      params.require(:pathway_row).permit(:pathway_section_id, :name, :content, :colour, :display)
    end
  end
end
