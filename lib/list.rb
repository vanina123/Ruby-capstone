class List
  def list_options(menu)
    puts "\n========== Catalog Of My Things =========="
    puts '+--------------------------------------+'
    puts '|              DISPLAY MENU             |'
    puts '+--------------------------------------+'
    menu.each do |choice, action|
      puts "| #{choice}. #{action} |"
    end
  end
end
