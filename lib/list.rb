class List
    def list_options(menu)
      puts "\n========== Libary App =========="
      puts '+--------------------------------------+'
      puts '|              DISPLAY MENU             |'
      puts '+--------------------------------------+'
      menu.each do |choice, action|
        puts "| #{choice}. #{action} |"
      end
  
      # print 'Enter option: '
    end
end
  