require_relative "list"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts "Enter a command: "
        cmd, *args = gets.chomp.split(" ")

        case cmd
        when "mktodo"
            @list.add_item(*args)
        when "up"
            @list.up(args)
        when "down"
            @list.down(args)
        when "swap"
            @list.swap(*args)
        when "sort"
            @list.sort_by_date!
        when "priority"
            @list.print_priority
        when "print"
            if args.length == 1
                @list.print_full_item(args)
            else
                @list.print
            end
        when "quit"
            return false
        else 
            puts "Sorry, that command is not recognized"
        end
        true
    end

    def run 
        while get_command == true 
            get_command
        end
    end
end

# TodoBoard.new('groceries')
# mktodo cheese 2019-10-25 foooooood
# mktodo toothpaste 2019-10-23
# mktodo candy 2019-10-31 sugar-free
# mktodo shampoo 2019-10-25
# swap 0 3