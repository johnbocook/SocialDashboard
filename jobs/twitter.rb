require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'wmoqAC2LQdqtFDnhI5h8XN4aD'
  config.consumer_secret = 'V3FTP7GD9GpkPDYFeofZj7XCsqG1UsLAkX7BiuU0SghdvvqW9S'
  config.oauth_token = '52135513-DVPRKv06SKDXl9RveOtLZeE7VxynbIzl9W0GJZFjf'
  config.oauth_token_secret = '2kKLcmTfaUBOFWNN2oMpO5IIXrz7wHL6V7U29mjiJeX5r'
end

search_term = URI::encode('#OhioChristian')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end