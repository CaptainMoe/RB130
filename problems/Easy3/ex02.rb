require 'minitest/autorun'

class Test < Minitest::Test

  def test_downcase
    value = 'XYZc'
    assert_equal('xyz', value.downcase)
  end
end
