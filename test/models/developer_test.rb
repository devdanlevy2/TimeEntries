require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "email uniqueness" do
    developer_a = Developer.create!(name: "DevDanLevy", email: "danlevy@danlevy.com", password: "monkey")
    developer_b = Developer.create!(name: "JohnnyT", email: "danlevy@danlevy.com", password: "password")
    assert refute "danlevy@danlevy.com", developer_b.email
  end

end
