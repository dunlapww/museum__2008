require 'minitest/autorun'
require './lib/museum'

class MuseumTest < Minitest::Test

  def setup
    @museum = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exists
    assert_instance_of Museum, @museum
  end
  
end
