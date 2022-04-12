# Inputs students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = [
    {name: "Nurse Jakie", cohort: :november, hobbies: "crochet"},
    {name: "Hannibal Lecter", cohort: :may, hobbies: "painting"},
    {name: "Donald Trump", cohort: :november, hobbies: "twitter"},
    {name: "Mickey Mouse", cohort: :june, hobbies: "killing cats"}
    ]
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get the cohort
    puts "Please enter the cohort (november or may)"
    while true do
      cohort = gets.chomp
      if cohort == "november" || cohort == "may"
        cohort
        break
      elsif cohort.empty?
        cohort = "november"
        break
      end
    end
    # get the hobbies
    puts "Please enter hobbies of #{name}"
    hobbies = gets.chomp
    # add the student to the array
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter another name or hit return twice to finish"
    name = gets.chomp
  end
  # return the array of students
  students
end

# Prints the header
def print_header(students)
  if !students.empty?
    puts "The students of Villains Academy"
    puts "-------------------"
  end
end

# Prints students with hobbies
def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{(students[i][:name]).center(15)} (#{students[i][:cohort]} cohort, hobbies include : #{students[i][:hobbies]})"
    i += 1
  end
end

# Prints students divided by cohorts
def alt_print(students)
  # create a cohorts hash
  cohorts = {}
  
  # add cohort keys to the hash
  students.map { |student| 
    cohorts[(student[:cohort])] = [] if !cohorts.include?(student[:cohort])
  }
  
  # add students to each cohort key
  students.map { |student|
    cohorts[(student[:cohort])] << {name: student[:name], hobbies: student[:hobbies] }
  }
  
  # print the value of each cohort key
  cohorts.each { |key, value|
    puts "Students in #{key} cohort:"
    value.each { |person|
      puts "Name: #{person[:name]}, hobbies: #{person[:hobbies]}"
    }
  }
end

# Prints the footer
def print_footer(students)
  puts students.count > 1 ? "Overall, we have #{students.count} great students" : "Overall, we have 1 great student."
end

students = input_students
print_header(students)
print(students)
print_footer(students)
alt_print(students)