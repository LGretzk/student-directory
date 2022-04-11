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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
      puts "You have entered the students"
    when "2"
      show_students
      puts "These are all the students"
    when "3"
      save_students
      puts "The students have been saved"
    when "4"
      try_load_students
      puts "The students have been loaded"
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

# Save the students in a csv file
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
end

# Load the saved list of students from the csv file
def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
end

# Load the list of students when the programme starts
def try_load_students
  filename = ARGV.first || "students.csv"
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
end

# Interactive menut
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
