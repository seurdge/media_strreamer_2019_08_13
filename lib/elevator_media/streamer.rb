require 'rest-client'

module ElevatorMedia

  class Streamer

    def get_content(type='joke')
      get_joke()
    end

    def get_joke
      joke_date = RestClient.get("http://api.icndb.com/jokes/random?firstName=John&amp;lastName=Doe")
      joke_json = JSON.parse(joke_date)
      "<div >#{joke_json['value']['joke']}</div>"
    end



  end

end