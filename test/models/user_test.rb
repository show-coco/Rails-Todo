require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Show', email: 'showaaa@example.com', password: "password", password_confirmation: "password")
  end

  # name

  test "name should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should be shorter than 21" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  # email
  test "email should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be shorter than 256" do
    @user.email = "a" * 245 + "@example.com"
    assert_not @user.valid?
  end

  test "email should reject invalid format" do
    invalid_emails = ["show@example..com", "show.example@com", 
                      "showexample.com", "show@examplecom", "show@exmaple.com." ]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?
    end
  end

  test "email should be unique" do
    deplicate_user = @user.dup
    deplicate_user.email.upcase
    @user.save
    assert_not deplicate_user.valid?
  end

  # password

  test "password should be present" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "password should be longer than 5" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end

  test 'associated tasks should be destroyed' do
    @user.save
    @user.tasks.create!(title: "task1")
    assert_difference 'Task.count', -1 do
      @user.destroy
    end
  end 

end
