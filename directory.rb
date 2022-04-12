@students = []

# Add student to the aray of students
def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# Inputs students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name, "november")
    puts  @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    # get another name from the user
    name = STDIN.gets.chomp
  end
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
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
      puts "You have added a student /students"
    when "2"
      show_students
      puts "These are all the students"
    when "3"
      save_students
      puts "The students have been saved"
    when "4"
      subsequent_load_students
      puts "The students have been loaded"
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
  puts
end

# Save the students in a csv file
def save_students
  save_file = which_file  # get the file name
  open(save_file, mode = "w") { |file|   # open the file for writing
    @students.each do |student|  # iterate over the array of students
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end    
  }
  puts "File chosen: #{save_file}"
end

# Load the saved list of students from the csv file
def load_students(to_load)
  load_file = to_load
  open(load_file, mode = "r") { |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort)
    end  
  }
  puts "File chosen: #{load_file}"
end

# Default file
def filename
  ARGV.first.nil? ? "students.csv" : ARGV.first.chomp
end

# Asks which file to load/save
def which_file
  puts "Default file is #{filename}"
  puts "Enter the name of the file or press return for default"
  input = STDIN.gets.chomp
  input.empty? ? filename : input
end

# Load the list of students when the programme starts
def initial_load_students
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

# Load the list of students based on a given file
def subsequent_load_students
  # get the file name
  to_load = which_file
  load_students(to_load)
end

# Interactive menut
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

initial_load_students
interactive_menu
