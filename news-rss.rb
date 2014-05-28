require 'open-uri'
require 'json'
require 'rexml/document'

config_file = File.read('rss.config')
config = JSON.parse(config_file)

config["rss"].each do |rss|
    begin
        doc = REXML::Document.new(open(rss["link"]))

        doc.elements.each('rss/channel/item/link') do |link|
            puts link.get_text
        end
    rescue
        $stderr.puts "failed to capture #{rss}"
    end
end