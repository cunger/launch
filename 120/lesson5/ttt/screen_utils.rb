module ScreenUtils
  def clear_screen
    system 'clear' || system 'cls'
  end

  def get_input
    print "> "
    gets.chomp.strip.downcase
  end
end
