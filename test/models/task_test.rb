require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:show)
    @task = @user.tasks.build(title: "yeaaaaah")
  end

  test 'should be valid' do
    assert @task.valid?
  end

  test 'user id should be present' do
    @task.user_id = nil
    assert_not @task.valid?
  end

  test 'title should be present' do 
    @task.title = " "
    assert_not @task.valid?
  end

  test 'title should be at most 100 characters' do
    @task.title = "a" * 141
    assert_not @task.valid?
  end 
end