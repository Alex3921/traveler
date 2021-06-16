class API

  def self.get_data(query, page = "1", orientation = "landscape")
      response = RestClient.get("https://api.unsplash.com/search/photos?page=#{page}&orientation=#{orientation}&query=#{query}&client_id=#{ENV['UNSPLASH_CLIENT_ID']}")
      JSON.parse(response) 
  end

end