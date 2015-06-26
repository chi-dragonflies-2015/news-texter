def message_users
  twilio_client = Twilio::REST::Client.new TWILIOSID_KEY, TWILIOAUTH_TOKEN

  User.all.each do |user|
    if user.phone
      twilio_client.messages.create(
        from: TWILIO_NUMBER,
        to: '3109679110',
        body: digest_message
      )
    end
  end
end

def digest_message
  top3_articles = CachedArticle.last(3)
  "Top headlines in the past day: \n| " + top3_articles.map do |article|
    article.title
  end.join("\n| ")
end
