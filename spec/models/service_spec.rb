require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "validations", :validation do
    subject(:service) { build(:service) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(Service::COLOURS) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:subdomain) }
    it { should validate_uniqueness_of(:subdomain) }
    it { should validate_presence_of(:menu_name) }
    it { should validate_uniqueness_of(:menu_name) }
    it { should validate_inclusion_of(:menu_name).in_array(Service::MENU_NAMES) }
  end

  describe "associations", :association do
    it { should have_many(:service_testimonials).dependent(:destroy) }
    it { should have_many(:testimonials).through(:service_testimonials) }
    it { should have_many(:service_frequently_asked_questions).dependent(:destroy) }
    it { should have_many(:frequently_asked_questions).through(:service_frequently_asked_questions) }
    it { should have_many(:pages).dependent(:nullify) }
  end
end
