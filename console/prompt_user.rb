require_relative './show_list'
require_relative './options'

class PromptUser
  def self.prompt_user(app)
    ShowList.new.menu

    choice = gets.chomp.to_i
    Options.option_case(choice, app)

    prompt_user(app)
  end
end
