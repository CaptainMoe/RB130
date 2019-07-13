
require 'minitest/autorun'

class Ex02_test < Minitest::Test

  def compute
    if block_given?
      yield(5)
    else
      'Does not compute.'
    end
  end

  def test_compute1
    assert_equal(compute { |n| n + 3 }, 8)
  end

  def test_compute2
    assert_equal(compute { 'a' + 'b' }, 'ab')
  end

  def test_compute3
    assert_equal(compute , 'Does not compute.')
  end
end
