require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_response_body
    get "/"
    assert last_response.ok?
    assert_equal "Hello from Ruby on Rulers!!", last_response.body
  end
end