require 'minitest/autorun'
require 'pry'

class NoExperienceError < StandardError; end

class Employee

  def hire
    raise NoExperienceError
  end
end


class Test < Minitest::Test

  def setup
    @employee = Employee.new
  end

  def test_hire
    assert_raises(NoExperienceError) do
      @employee.hire
    end
  end
end
