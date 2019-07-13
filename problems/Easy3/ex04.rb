require 'minitest/autorun'

class Test < Minitest::Test

  def setup
    @list = []
  end

  def test_list
    assert_empty(@list)
  end
end
