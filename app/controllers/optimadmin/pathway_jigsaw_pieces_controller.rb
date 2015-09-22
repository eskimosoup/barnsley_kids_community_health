module Optimadmin
  class PathwayJigsawPiecesController < Optimadmin::ApplicationController

    before_action :set_pathway_section
    before_action :set_pathway_jigsaw_piece, only: [:show, :edit, :update, :destroy]

    def index
      @pathway_jigsaw_pieces = Optimadmin::BaseCollectionPresenter.new(collection: @pathway_section.pathway_jigsaw_pieces.ordered,
                                       view_template: view_context, presenter: Optimadmin::PathwayJigsawPiecePresenter)
    end

    def show
    end

    def new
      @pathway_jigsaw_piece = @pathway_section.pathway_jigsaw_pieces.new
    end

    def edit
    end

    def create
      @pathway_jigsaw_piece = @pathway_section.pathway_jigsaw_pieces.new(pathway_jigsaw_piece_params)
      if @pathway_jigsaw_piece.save
        redirect_to pathway_section_pathway_jigsaw_pieces_url(@pathway_section), notice: 'Pathway jigsaw piece was successfully created.'
      else
        render :new
      end
    end

    def update
      if @pathway_jigsaw_piece.update(pathway_jigsaw_piece_params)
        redirect_to pathway_section_pathway_jigsaw_pieces_url(@pathway_section), notice: 'Pathway jigsaw piece was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @pathway_jigsaw_piece.destroy
      redirect_to pathway_section_pathway_jigsaw_pieces_url(@pathway_section), notice: 'Pathway jigsaw piece was successfully destroyed.'
    end

  private

    def set_pathway_section
      @pathway_section = PathwaySection.find(params[:pathway_section_id])
    end

    def set_pathway_jigsaw_piece
      @pathway_jigsaw_piece = @pathway_section.pathway_jigsaw_pieces.find(params[:id])
    end

    def pathway_jigsaw_piece_params
      params.require(:pathway_jigsaw_piece).permit(:pathway_section_id, :name, :position, :colour, :display)
    end
  end
end
