require 'minitest/autorun'

class Test < Minitest::Test

  def setup
    @list = ['xyz']
  end

  def test_list
    refute_includes(@list, 'xyz')
  end

  def listen

  end

  def play

  end
end
