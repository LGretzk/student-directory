@students = []

# Inputs students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts  @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  #students
end

# Prints the header
def print_header
  if !@students.empty?
    puts "The students of Villains Academy"
    puts "-------------------"
  end 
end

# Prints the list of students
def print_students_list
  @students.each { |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  }
end

# Prints the footer
def print_footer
  puts @students.count > 1 ? "Overall, we have #{@students.count} great students" : "Overall, we have 1 great student."
end

# Print menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"  
end

# Prints header, students & footer
def show_students
  print_header
  print_students_list
  print_footer
end

# Selection menu
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

# Interactive menut
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
