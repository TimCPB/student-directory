def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #creating an ampty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name input isn't empty, do this code
  while !name.empty? do
    #make a hash that includes the name input and push it to the students array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get the next name
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
def print(students)
  students.each_with_index do |student, index|
      puts "#{(index + 1)}.  #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end
#so here we use the methods to print everything out
students = input_students
#remember, the input_students method will return an array of hashes,
print_header
print(students)
print_footer(students)