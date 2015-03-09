require "wombat"

# Scrap the OpenMW *first* version
data = Wombat.crawl do
  base_url "http://bugs.openmw.org"
  path "/projects/openmw/roadmap"

  version css: "h3.version"
  percent css: "p.percent"
end

version = data["version"].split("-")[1]
percent = data["percent"].chop.to_i

# Print full text
puts "OpenMW #{ version } (#{ percent }%)"

# Print short text
puts "#{ version } @ #{ percent }%"

# Urgent?
percent > 90 and exit 33
