class Triangle
  def self.parse(str)
    Triangle.new(*str.split(',').map(&:to_i))
  end

  def initialize(*sides)
    @sides = sides.sort
  end

  def type
    a, b, c = *@sides
    return :no       if c >= a + b
    return :regular   if a == b && b == c
    return :isosceles if a == b || b == c
    :scalene
  end
end

if __FILE__ == $0
  case Triangle.parse(ARGV.join).type
  when :no
    puts '三角形じゃないです＞＜'
  when :isosceles
    puts '二等辺三角形ですね！'
  when :regular
    puts '正三角形ですね！'
  when :scalene
    puts '不等辺三角形ですね！'
  end
end
