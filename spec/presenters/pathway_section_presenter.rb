require "rails_helper"

RSpec.describe PathwaySectionPresenter, type: :presenter do
  let(:pathway_section) { create(:pathway_section) }
  subject(:pathway_section_presenter) { PathwaySectionPresenter.new(object: pathway_section, view_template: view) }
end