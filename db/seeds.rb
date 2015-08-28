# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..3).each do |num|
  a = Article.find_or_initialize_by(title: "Article #{num}")
  a.summary = "Article summary" if num.odd?
  a.content = "Article content"
  a.remote_image_url = "http://www.fillmurray.com/500/500"
  a.date = Date.today - num.weeks
  a.save
end

Page.find_or_create_by(title: "About Us", style: "basic", layout: "application", content: "About us page")

service_data = [
  { name: "Health Visiting", colour: "pink" },
  { name: "School Nursing", colour: "light_purple" },
  { name: "Family Nurse Partnership", colour: "dark_purple" },
  { name: "Children's Epilepsy Nursing Team", colour: "light_blue" },
  { name: "Children's Speech and Language Therapy Team", colour: "dark_blue" },
  { name: "Paediatric Therapy", colour: "turquoise" },
  { name: "Paediatric Audiology", colour: "green" },
  { name: "Child and Adolescent Mental Health (CAMHS)", colour: "dark_green" }
]

service_data.each do |service_hash|
  Service.find_or_create_by(service_hash)
end