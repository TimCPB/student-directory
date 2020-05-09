@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type end"
  
  name = gets.gsub(/\n/,"")
  while name != "end"
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    puts "Which cohort are they in?"
    cohort = gets.gsub(/\n/,"")
    if cohort.empty? || !months.include?(cohort)
      cohort = "January"
    end
    if name.empty?
      name = "Mystery Student"
    end
    @students << {name: name, cohort: cohort.to_sym}
    if @students.count == 1
      puts "Now we have 1 student, enter another student or type end to finish"
    else
      puts "Now we have #{@students.count} students, enter another student or type end to finish"
    end
    name = gets.gsub(/\n/,"")
  end
  @students
end

def print_header
    puts "The students of Villains Academy".center(50," ")
    puts "-------------".center(50," ")
end
def print_students_list
  if !@students.empty?
    sorted_by_cohort = {}
    @students.each do |student|
      cohort = student[:cohort]
        name = student[:name]
        if sorted_by_cohort[cohort] == nil
          sorted_by_cohort[cohort] = [name]
        else
          sorted_by_cohort[cohort].push(name)
        end
  end
  sorted_by_cohort.each do |key, value_array|
    puts "#{key} cohort: #{value_array.join(", ")}".center(60," ")
  end
  end
end
def print_footer
    puts ""
    puts "Overall, we have #{@students.count} great students".center(50," ")
end
def print_menu
  puts "1. Input the sudents"
  puts "2. Show the students"
  puts "3. Save the lsit to students.csv"
  puts "9. Exit" #because we'll be adding more lines later
end
def show_students
  print_header
  print_students_list
  print_footer
end
def save_students
  #open the file for writing, save it to the vaiable file, "w" for write mode
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data =[student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def process(selection)
  case selection
   when "1"
    @students = input_students
   when "2"
    show_students
   when "3"
    save_students
   when "9"
    exit
   else
    puts "I don't know what you mean, please try again"
  end
end
  
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


    

interactive_menu

save_students
