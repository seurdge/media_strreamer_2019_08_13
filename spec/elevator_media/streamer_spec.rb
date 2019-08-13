require 'rails_helper'
require './lib/elevator_media/streamer'

describe "Instantiate the streamer class" do

  before do
    @streamer = ElevatorMedia::Streamer.new
  end

  specify "should be able to create with new" do
    expect(@streamer).to be_a(ElevatorMedia::Streamer)
  end

  specify "should be able to call getContent method" do
    expect(@streamer).to respond_to(:get_content)
  end

  specify "get_content method should return valid html" do
      valid_html = @streamer.get_content()
      expect(valid_html).to include("<")
      expect(valid_html).to include(">")
  end

  specify "get_joke method should call chuck norris api" do
   #expect(RestClient).to receive(:get) {'{ "type": "success", "value": { "id": 122, "joke": "John Norris is responsible for Chinas over-population. He hosted a Karate tournament in Beijing and all women within 1,000 miles became pregnant instantly.", "categories": [] } }'}
   expect(RestClient).to receive(:get).with("http://api.icndb.com/jokes/random?firstName=John&amp;lastName=Doe") {'{ "type": "success", "value": { "id": 122, "joke": "John Norris is responsible for Chinas over-population. He hosted a Karate tournament in Beijing and all women within 1,000 miles became pregnant instantly.", "categories": [] } }'}
   @streamer.get_joke
  end


end