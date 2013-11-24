require './som/test/test_helpers.rb'

class TestStat < MiniTest::Unit::TestCase
  def test_mean
    assert_equal Stat.mean([1, 2, 3, 4, 5]), 3
  end

  def test_variance
    assert_equal Stat.variance([2, 3, 4, 7, 9]), 6.8
  end

  def test_correlate
    assert_equal(
      Stat.correlate([1, 3, 4, 5, 5], [2, 3, 4, 4, 5]),
      2.8303690591491795
    )
  end

  def test_distance
    assert_equal(
      Stat.distance([1, 3, 5], [2, 5, 4]),
      0.9112309264184789
    )
  end

  def test_eucl_distance
    assert_equal(
      Stat.eucl_distance([1, 3, 5], [2, 5, 4]),
      2.0
    )
  end

  def test_round_at
    assert_equal(1.23456.round_at(3), "1.235")
  end
end
