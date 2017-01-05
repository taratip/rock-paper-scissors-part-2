selection_list = {
  "r" => "rock",
  "p" => "paper",
  "s" => "scissors"
}
score = {
  player_score: 0,
  computer_score: 0
}

while true do
  puts "Player Score: #{score[:player_score]}, Computer Score: #{score[:computer_score]}"
  print "Choose rock (r), paper (p), or scissors (s): "
  user_chosen = gets.chomp
  selection_index = selection_list.has_key?(user_chosen.downcase)

  while true do
    selection_index = selection_list.has_key?(user_chosen.downcase)

    if !selection_list.has_key?(user_chosen.downcase)
      puts "Inavlid entry, try again."
      user_chosen = gets.chomp
    else
      break
    end
  end

  comp_random = rand(2)+1

  case comp_random
    when 0
      comp_chosen = "r"
    when 1
      comp_chosen = "p"
    when 2
      comp_chosen = "s"
  end

  puts "Player chose " + selection_list[user_chosen]
  puts "Computer chose " + selection_list[comp_chosen]


  if (user_chosen == "r" && comp_chosen == "r") ||
    (user_chosen == "p" && comp_chosen == "p") ||
    (user_chosen == "s" && comp_chosen == "s")
    puts "Tie!"
  elsif (user_chosen == "r" && comp_chosen == "p")
    puts "Paper beats rock, Computer wins!"
    score[:computer_score] += 1
  elsif (user_chosen == "r" && comp_chosen == "s")
    puts "Rock beats scissors, Player wins!"
    score[:player_score] += 1
  elsif (user_chosen == "p" && comp_chosen == "r")
    puts "Paper beats rock, Player wins!"
    score[:player_score] += 1
  elsif (user_chosen == "p" && comp_chosen == "s")
    puts "Scissors beats paper, Computer wins!"
    score[:computer_score] += 1
  elsif (user_chosen == "s" && comp_chosen == "p")
    puts "Scissors beats paper, Player wins!"
    score[:player_score] += 1
  elsif (user_chosen == "s" && comp_chosen == "r")
    puts "Rock beats scissors, Computer wins!"
    score[:computer_score] += 1
  end

  print "\n"

  if score[:player_score] == 2
    puts "Player wins!"
    break
  elsif score[:computer_score] == 2
    puts "Computer wins!"
    break
  end
end
