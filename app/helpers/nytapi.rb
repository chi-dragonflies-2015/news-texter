def grab_articles
  articles = open("http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1?api-key=#{NYTAPI_KEY}")
  parsed = JSON.parse(articles.read)
  update_cache(parsed['results']) if parsed['status'] == 'OK'

  # parsed is a hassh, key 'results' is an array of results, we want [0..2]. we want to filter for type => articles
  # and column => ''
end

def update_cache(results)
  filtered_articles = filter_articles(results)

end

def filter_articles(articles)
  articles.select{ |article| article['column'] == '' && article['type'] == 'Article' }
end
