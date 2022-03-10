module ClassSearch
  class CSE
    def self.CSE_Courses()
      Faraday.get 'https://content.osu.edu/v2/classes/search?q=&subject=cse'
    end
  end
end
