module Stat
  module_function

  def mean(x)
    x.reduce(0) {|sum, v| sum + v} / x.size
  end

  def variance(x)
    m = mean(x)
    x.reduce(0.0) {|sum, v| sum + (v - m) ** 2} / x.size
  end

  def sigma(x)
    Math.sqrt(variance(x))
  end

  def correlate(x, y)
    xymean = x.size.times.reduce(0.0) {|sum, i| sum + x[i] * y[i]} / x.size
    xmean, ymean  = mean(x), mean(y)
    sx, sy = sigma(x), sigma(y)
    (xymean - xmean * ymean) / (sx * sy)
  end

  def distance(x, y)
    sx, sy = sigma(x), sigma(y)
    x.size.times.reduce(0.0) {|sum, i|
      sum + (y[i] / sy - x[i] / sx).abs
    } / x.size
  end

  def eucl_distance(x, y)
    x.size.times.reduce(0.0) {|sum, i|
      sum + (y[i] - x[i]) ** 2
    } / x.size
  end

  def sim_crits
    [:distance, :correlation]
  end
end

class Float
  def round_at(precision)
    "%.#{precision}f" % self
  end
end
