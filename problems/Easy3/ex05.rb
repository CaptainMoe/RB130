require 'minitest/autorun'

class Test < Minitest::Test

  def setup
    @list = ['xyz']
  end

  def test_list
    assert_includes(@list, 'xyz')
  end
end
