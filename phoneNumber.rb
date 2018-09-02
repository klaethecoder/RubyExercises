class Phone
attr_accessor :kind, :number

def to_s
    "#{kind}: #{number} "
end

def what(first, middle)
    puts !first.nil?
    puts middle.nil?
end
end

