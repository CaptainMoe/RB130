
require 'minitest/autorun'

class Ex03_test < Minitest::Test

  def missing(arr)
    (arr.min..arr.max).to_a - arr
  end

  def test_missing1
    assert_equal(missing([-3, -2, 1, 5]), [-1, 0, 2, 3, 4])
  end

  def test_missing2
    assert_equal(missing([1, 2, 3, 4]), [])
  end

  def test_missing3
    assert_equal(missing([1, 5]), [2, 3, 4])
  end

  def test_missing4
    assert_equal(missing([6]), [])
  end
end
