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
