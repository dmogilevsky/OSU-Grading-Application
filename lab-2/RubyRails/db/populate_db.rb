# httparty.rb
require "httparty"
class DBPopulate
  def populate_with_cse_courses
    url = "https://content.osu.edu/v2/classes/search?q=&subject=cse"
    page_data = HTTParty.get(url)
    response = page_data.parsed_response
    puts response
  end
end
