class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url


  def self.update_from_feed(feed_url)
    FeedEntry.delete_all
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed.entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
            :name => entry.title,
            :summary => entry.summary,
            :url => entry.url,
            :published_at => entry.published,
            :guid => entry.id
        )
      end
    end
  end
end
