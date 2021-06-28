require_relative "item"

class List

    attr_accessor :label, :items

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        indices = []
        @items.each_with_index {|ele, i| indices << i}
        indices.include?(idx)
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
        false
    end

    def [](index)
        if self.valid_index?(index)
            return @items[index]
        else
            return nil 
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "---------------------------------"
        puts "         #{self.label}           "
        puts "---------------------------------"
        puts "| Index | Item       | Deadline  "
        @items.each_with_index do |item, idx|
            puts "| #{idx}     | #{item.title}    | #{item.deadline}"
        end
        puts "---------------------------------"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            item = @items[index]
            puts "------------------"
            puts item.title 
            puts item.deadline
            puts item.description
            puts "------------------"
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        if !self.valid_index?(index)
            return false
        elsif index != 0
            idx = index
            # if idx != -1 
                amount.times do 
                    @items[idx-1], @items[idx] = @items[idx], @items[idx-1]
                    idx -= 1
                    break if idx == 0
                end 
            # end
            true
        end
    end

    def down(index, amount=1)
        if !self.valid_index?(index)
            return false
        elsif @items[index] != @items[-1]
            idx = index
            # if idx != -1 
                amount.times do 
                    @items[idx], @items[idx+1] = @items[idx+1], @items[idx]
                    idx += 1
                    break if @items[idx] == @items[-1]
                end 
            # end
            true
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
end


# [eggs, cheese, butter, bacon, milk]
#   0       1       2      3      4


# l = List.new('Groceries')
# l.add_item('cheese', '2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.add_item('shampoo', '2019-10-24')
# l.add_item('candy', '2019-10-31')
# l.up(3, 10)
# l.print