class PagesController < ApplicationController
  before_action :set_page

  def show
    @presented_page = PagePresenter.new(object: @page, view_template: view_context)
    return redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
    if @page.style == "pathway"
      pathway_sections = PathwaySection.displayed.ordered.includes(:pathway_rows, :pathway_jigsaw_pieces)
      @presented_pathway_sections = BaseCollectionPresenter.new(collection: pathway_sections, view_template: view_context, presenter: PathwaySectionPresenter)
    end
    # render layout: @page.layout I don't think this wants to be here
  end

  private

    def set_page
      @page = Page.for_service(@service).displayed.friendly.find(params[:id])
    end
end
