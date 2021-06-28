class Item

    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_str)
        date_str_split = date_str.split("-")
            if date_str_split[1].to_i < 1 || date_str_split[1].to_i > 12
                return false
            elsif date_str_split[2].to_i < 1 || date_str_split[2].to_i > 31
                return false
            end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        if !Item.valid_date?(deadline)
            raise "invalid date"
        end
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid date"
        end
    end


end

# p my_item = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
# my_item.deadline = "2019-10-23"
# p my_item



