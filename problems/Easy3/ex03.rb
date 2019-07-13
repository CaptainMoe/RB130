require 'minitest/autorun'

class Test < Minitest::Test

  def setup
    @value = nil
  end

  def test_value
    assert_nil(@value)
  end
end
