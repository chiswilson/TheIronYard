#this is a test

my_questions = [
  {
  	question: "Which is the fastest?",
  	answer: 5,
  	choices: ["plane", "car", "boat", "skateboard", "rocketship"]
  },
  {
  	question: "Which is the wettest?",
  	answer: 3,
  	choices: ["plane", "car", "boat", "skateboard", "rocketship"]
  },
  {
  	question: "How many feet in a mile?",
  	answer: 4,
  	choices: [5350, 5180, 4950, 5280, 5320]
  },
  {
  	question: "How many miles in the bridge run?",
  	answer: 2,
  	choices: ["6.0", "6.2", "6.15", "6.28", "6.3"]
  },
  {
  	question: "Whos gonna run the bridge run faster?",
  	answer: 2,
  	choices: ["Nick", "Chisolm"]
  },
  {
  	question: "Where is the Malaysian plane?",
  	answer: 5,
  	choices: ["bottom of ocean", "Mars", "another country", "obliterated into tiny pieces", "No one knows"]
  },
  {
  	question: "What is the remainder of 650 divided by 4?",
  	answer: 2,
  	choices: ["1", "2", "3", "0"]
  },
  {
  	question: "Is today the first day of the rest of your life?",
  	answer: 1,
  	choices: ["Yes", "No"]
  },
  {
  	question: "Is Tiger playing in this years Masters tourney?",
  	answer: 2,
  	choices: ["Yes", "No"]
  },
  {
  	question: "Is Chisolm going to the Masters this year?",
  	answer: 1,
  	choices: ["Yes", "No"]
  },

]

right_answers = 0
wrong_answers = 0

my_questions.each do |question_hash|
	puts question_hash[:question]
	choiceNum = 1
	#list all my choices
	question_hash[:choices].each do |choice|
		puts " #{choiceNum}: " + choice.to_s  #choice could be an integer or number...
		choiceNum += 1
	end
    answ = gets.chomp.to_i
    if answ == question_hash[:answer] then #correct answer
    	right_answers += 1
    else
    	wrong_answers += 1
    end

end # end for each question

percentRight = (right_answers*100) / (right_answers + wrong_answers)
puts "You scored a: " + percentRight.to_s + "% !"