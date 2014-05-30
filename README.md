# News-Hub
Collect news through rss


## Collect RSS Links

execute ```ruby news-hub.rb``` will get the list of links in std output, the rss is configured in ```rss.config```

## Extract Main Content

Use diffbot api to extract main content information, put your diffbot token under this directory in the file ```diffbot.token```. Config the result destination directory in ```diffbot.config```

to extract main content from news-hub result, you can execute the following command:

```ruby news-hub.rb | ruby news-diffbot.rb```