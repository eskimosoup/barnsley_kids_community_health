class CreateServiceFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :service_frequently_asked_questions do |t|
      t.belongs_to :service, index: { name: "service_id_service_faq" }, foreign_key: true
      t.belongs_to :frequently_asked_question, index: { name: "faq_id_service_faq" }, foreign_key: true

      t.timestamps null: false
    end
  end
end
