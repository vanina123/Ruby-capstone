class Choice
  def handle_menu_choice(menu, choice, app)
    action = menu[choice]
    if action
      puts "\n========== #{action} =========="
      app.send(action)
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end
