class CreateCachedArticles < ActiveRecord::Migration
  def change
    create_table cached_articles do |t|
      t.string :title
      t.string :abstract
      t.string :url
      t.date :published_on
      t.string :byline
      t.timestamps
  end
end
