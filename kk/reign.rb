# -*- coding: utf-8 -*-
require 'date'

class Reign
  attr_accessor :span_start, :span_end, :name

  def initialize(args)
    @span_start = args[:span_start]
    @span_end = args[:span_end]
    @name = args[:name]
  end

  def datein?(date)
    date.between? @span_start, @span_end
  end
end

class Reigns
  attr_accessor :reigns

  def initialize(date = Date.new)
    @date = date
    @reigns = []
    @reigns << Reign.new(span_start: Date.new(1868, 1, 1), span_end: Date.new(1912, 9, 7), name: 'meiji')
    @reigns << Reign.new(span_start: Date.new(1912, 9, 8), span_end: Date.new(1926, 7, 29), name: 'taisho')
    @reigns << Reign.new(span_start: Date.new(1926, 7, 30), span_end: Date.new(1989, 1, 7), name: 'showa')
  end

  def datein?
    foo = nil
    reigns.each do |reign|
      if reign.datein? (@date)
        foo = reign.name
        break
      else
        foo = nil
      end
    end
    return foo
  end
end

puts Reigns.new(Date.new(1987, 1, 1)).datein?

__END__

# 明治1868～19129/8明治元年は1/1から。明治６年以降は太陽暦
# 大正1912～19267/30
# 昭和1926～198912/25昭和６４年は１月７日まで
# 平成1989～1/8

