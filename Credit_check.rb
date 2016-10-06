class Credit

  def initialize(card_number)
    card_s_to_i(card_number)
  end

  def card_s_to_i(card_number)
    card_split = card_number.chars.map {|num| num.to_i}
    double_every_other_digit(card_split)
  end

  def double_every_other_digit(card_split)
    card_split.map!.with_index do |value, index|
      index.even? ? value * 2 : value
    end
    add(card_split)
  end

  def add(card_split)
    card_split.map!{|num| num > 9 ? split_num_and_sum(num) : num}
    card_split = card_split.reduce(:+) % 10
    valid(card_split)
  end

  def split_num_and_sum(num)
    add = num.to_s.chars.map { |digit| digit.to_i }
    add.reduce(:+)
  end

  def valid(card_split)
    if card_split.eql?(0)
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

Credit.new('4929735477250543')
