def grab_articles
  articles = open("http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1?api-key=#{NYTAPI_KEY}")
  parsed = JSON.parse(articles.read)
  update_cache(parsed['results']) if parsed['status'] == 'OK'
end

def update_cache(results)
  filtered_articles = filter_articles(results)
  3.times do |n|
    article = filtered_articles[n]
    CachedArticle.create(url: article['url'], byline: article['byline'],
      title: article['title'], abstract: article['abstract'], published_on: article['published_date'])
  end
end

def filter_articles(articles)
  articles.select{ |article| article['column'] == '' && article['type'] == 'Article' }
end
