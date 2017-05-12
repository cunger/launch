module ScreenUtils
  def clear_screen
    system 'clear' or system 'cls'
  end

  def get_input
    print "> "
    gets.chomp.strip.downcase
  end
end
