class AddServiceHomeToFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    add_column :frequently_asked_questions, :service_home, :boolean, default: true
  end
end
