@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  @cohort = "November"
  while !@name.empty? do
    # add the student hash to the array
    add_to_students_array
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save your current list of students"
  puts "4. Load a list of students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  #open the file for writing, save it to the vaiable file, "w" for write mode
  puts "Please choose a name for the file in which you would like to save the list of students"
  filename = STDIN.gets.chomp
  #iterate over the array of students
  @students.each do |student|
    student_data =[student[:name], student[:cohort]]
    File.write(filename, "\n#{student_data.join(",")}", mode: "a")
  end
end

def load_students(filename = "students.csv")
  filename = File.exist?(filename) ? filename : "students.csv"
  require 'csv'
  CSV.foreach(filename) do |line|
    @name, @cohort = line
    add_to_students_array
  end
end

def check_for_students_list
  filename = ARGV.first.nil? ? "students.csv" : ARGV.first
  if File.exists?(filename) #check if the file being referenced actualyl exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exit"
    exit #quit the program
  end
end

def add_to_students_array
  @students << {name: @name, cohort: @cohort}
end

  

def process(selection)
  case selection
  when "1"
    input_students
    puts "You have added #{@students.count} students to the academy"
  when "2"
    show_students
  when "3"
    save_students
    puts "You have saved #{@students.count} students"
  when "4"
    puts "Which file would you like to load the students from? If an invalid name is entered students from students.csv will be loaded"
    load_students(STDIN.gets.chomp)
    puts "You have successfully loaded students from your chosen file"
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(60," ")
  puts "-------------".center(60," ")
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(60," ")
  end
end

def print_footer
  puts ""
  puts "Overall, we have #{@students.count} great students".center(60," ")
end

check_for_students_list
interactive_menu