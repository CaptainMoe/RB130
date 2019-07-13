require 'minitest/autorun'

class Test < Minitest::Test

  def setup
    @list
  end

  def test_process
    assert_same(@list, @list.process)
  end
end
