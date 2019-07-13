require 'minitest/autorun'

class Test < Minitest::Test

  def test_odd
    value = 8
    assert(value.odd?, 'value is not odd')
  end

end
