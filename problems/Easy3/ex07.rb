require 'minitest/autorun'

class Test < Minitest::Test

  def setup
    @value = 8
  end

  def test_value
    assert_instance_of(Numeric, @value)
  end
end
