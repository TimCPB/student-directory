def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type end"
  students = []
  name = gets.chomp
  while name != "end"
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    puts "Which cohort are they in?"
    cohort = gets.chomp
    if cohort.empty? || !months.include?(cohort)
      cohort = "January"
    end
    if name.empty?
      name = "Mystery Student"
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students, please enter another name or type end to finish"
    name = gets.chomp
  end
  students
end

def print_header
    puts "The students of Villains Academy".center(50," ")
    puts "-------------".center(50," ")
end
def print(students)
  sorted_by_cohort = {}
  students.each do |student|
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
def print_footer(names)
    puts ""
    puts "Overall, we have #{names.count} great students".center(50," ")
end
students = input_students
print_header
print(students)
print_footer(students)