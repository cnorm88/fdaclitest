class Cli

  def start
    puts "Please enter your name:"
    name = gets.strip.capitalize
    puts "Welcome to the FDA recall information application #{name}"
    # Api.get_states
    Api.get_report
    self.menu
  end

def menu
    sleep(1)
    puts "\n"
    puts "Would you like to see a list of recalls made by the FDA in 2020?"
    puts "\n"
    puts "Type C to continue or type E to exit"
    user_input = gets.strip.downcase

    if user_input == "C" || user_input == "c"
      puts "Here is the list of recalls"      
      find_by_state
      users_selection_two
      list_of_recalls
      users_selection
    else
      sleep(1)
      puts "\n"
      puts "Thanks for using the FDA recall information app"
    end
  end

  def list_of_recalls
    Reports.all.each.with_index(1) do |report, index|
        # binding.pry
      report = report.name
      puts "#{index}. #{report}"
    end
  end


def users_selection
  puts "Enter the number of the report you'd like to know more about"
    index = gets.strip.to_i - 1
  until index.between?(0, Reports.all.length - 1)
    puts "Sorry invalid input. Choose a valid number"
    index = gets.strip.to_i - 1
  end
  instance = Reports.all[index]
  recall_details(instance)
end

def recall_details(report)
  puts "\n"
  puts "What would you like to know about this #{report.name} recall? Here are your options: Location, Description, Date, Quantity or Type C for more info & E to Exit"
    choice = gets.strip.capitalize

    case choice

    when "Location"
      puts "State: #{report.state} City: #{report.city}"
        recall_details(report)
    when "Description"
      puts report.description
      puts report.recall_reason
        recall_details(report)
    when "Date"
      puts report.date
        recall_details(report)
    when "Quantity"
      puts "\n"
      puts report.quantity
        recall_details(report)
    else
      exit_or_continue
    end
  end

  def exit_or_continue
    puts "\n"
    puts "Type any character to Exit or Type 'List' to see if any recalls occured in your state"
    choice = gets.strip.capitalize

    if choice == "List"
       find_by_state
    else
      puts "Thank you"
    end
end


def find_by_state

    Reports.all.uniq.each.with_index(1) do |report|
        # binding.pry
      report = report.state
      puts "#{report}"
    end
end

def users_selection_two

  self.find_by_state.select do |user|
    user_input = gets.strip.downcase
    if user_input == user.name
    puts "here"
  end
binding.pry
  # puts "Enter the state of the report you'd like to know more about"
  #   user_input = gets.strip.downcase
  #   binding.pry
  # user_input == report.state 
  #     puts "Here is the report"
 
  instance = Reports.all[]
  recall_details_state(instance)
end

def recall_details_state(report)
  puts "\n"
  puts "What would you like to know about this #{report.name} recall? Here are your options: Location, Description, Date, Quantity or Type C for more info & E to Exit"
    choice = gets.strip.capitalize

    case choice

    when "Location"
      puts "State: #{report.state} City: #{report.city}"
        recall_details(report)
    when "Description"
      puts report.description
      puts report.recall_reason
        recall_details(report)
    else
      exit_or_continue
    end
end    

#     users_selection_two
#   end

#   def users_selection_two
#   puts "Enter the number of the report you'd like to know more about"
#     index = gets.strip.to_i - 1
#   until index.between?(0, Reports.all.length - 1)
#     puts "Sorry invalid input. Choose a valid number"
#     index = gets.strip.to_i - 1
#   end
#   instance = Reports.all[index]
#   recall_details(instance)
# end

# def find_by_state
#   puts "\n"
#   puts "Type the 2 letter abbreviation for your state:"
#     name = gets.strip.upcase
# binding.pry

#     Reports.all.collect do |state_name|
#       if state_name.state == "#{name}"
#         puts "Your state has recall reports."
#         break
#       else
#         puts "No results found or try again"
#         exit_or_continue
#         break
#     end
#   end
# end

end
