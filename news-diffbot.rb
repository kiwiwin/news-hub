require 'uri'
require 'open-uri'
require 'json'


diffbot_token = File.read("diffbot.token").chomp

config_file = File.read('diffbot.config')
config = JSON.parse(config_file)


`mkdir -p #{config["dest_dir"]}`


index = 1

while link = gets do
    begin
        puts "handling #{index}th link: #{link}"

        enc_uri = "http://api.diffbot.com/v3/article?token=#{diffbot_token}&url=" + link

        response = open(URI.escape(enc_uri)).read

        response_file = File.new("#{config["dest_dir"]}/#{index}.json", "w")

        response_file.puts response
        response_file.flush
        response_file.close
    rescue
        puts "failed to handle #{index}th link: #{link}"
    ensure
        index += 1
    end
end