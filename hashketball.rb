def game_hash
  game_hash = {
    home: {
      :team_name=>"Brooklyn Nets",
      :colors=>"Black, White",
      :players=>[
        {
        "Player Name"=>"Alan Anderson",
        "Number"=>0,
        "Shoe"=>16,
        "Points"=>22,
        "Rebounds"=>12,
        "Assists"=>12,
        "Steals"=>3,
        "Blocks"=>1,
        "Slam Dunks"=>1
        },
        {
        "Player Name"=>"Reggie Evans",
        "Number"=>30,
        "Shoe"=>14,
        "Points"=>12,
        "Rebounds"=>12,
        "Assists"=>12,
        "Steals"=>12,
        "Blocks"=>12,
        "Slam Dunks"=>7
        },
        {
        "Player Name"=>"Brook Lopez",
        "Number"=>11,
        "Shoe"=>17,
        "Points"=>17,
        "Rebounds"=>19,
        "Assists"=>10,
        "Steals"=>3,
        "Blocks"=>1,
        "Slam Dunks"=>15
        },
        {
        "Player Name"=>"Mason Plumlee",
        "Number"=>1,
        "Shoe"=>19,
        "Points"=>26,
        "Rebounds"=>12,
        "Assists"=>6,
        "Steals"=>3,
        "Blocks"=>8,
        "Slam Dunks"=>5
        },
        {
        "Player Name"=>"Jason Terry",
        "Number"=>31,
        "Shoe"=>15,
        "Points"=>19,
        "Rebounds"=>2,
        "Assists"=>2,
        "Steals"=>4,
        "Blocks"=>11,
        "Slam Dunks"=>1
        }]
    },
    away: {
      :team_name=>"Charlotte Hornets",
      :colors=>"Turquoise, Purple",
      :players=>[
        {
        "Player Name"=>"Jeff Adrien",
        "Number"=>4,
        "Shoe"=>18,
        "Points"=>10,
        "Rebounds"=>1,
        "Assists"=>1,
        "Steals"=>2,
        "Blocks"=>7,
        "Slam Dunks"=>2
        },
        {
        "Player Name"=>"Bismak Biyombo",
        "Number"=>0,
        "Shoe"=>16,
        "Points"=>12,
        "Rebounds"=>4,
        "Assists"=>7,
        "Steals"=>7,
        "Blocks"=>15,
        "Slam Dunks"=>10
        },
        {
        "Player Name"=>"DeSagna Diop",
        "Number"=>2,
        "Shoe"=>14,
        "Points"=>24,
        "Rebounds"=>12,
        "Assists"=>12,
        "Steals"=>4,
        "Blocks"=>5,
        "Slam Dunks"=>5
        },
        {
        "Player Name"=>"Ben Gordon",
        "Number"=>8,
        "Shoe"=>15,
        "Points"=>33,
        "Rebounds"=>3,
        "Assists"=>2,
        "Steals"=>1,
        "Blocks"=>1,
        "Slam Dunks"=>0
        },
        {
        "Player Name"=>"Brendan Haywood",
        "Number"=>33,
        "Shoe"=>15,
        "Points"=>6,
        "Rebounds"=>12,
        "Assists"=>12,
        "Steals"=>22,
        "Blocks"=>5,
        "Slam Dunks"=>12
      }]
    }
  }
end

def num_points_scored(player)
  game_hash.each_key do |key|
    i = 0
    while i < game_hash[key][:players].length
     if game_hash[key][:players][i]["Player Name"] == player
       return game_hash[key][:players][i]["Points"]
     end
     i += 1
    end
  end
end

def shoe_size(player)
  game_hash.each_key do |key|
    i = 0
    while i < game_hash[key][:players].length
     if game_hash[key][:players][i]["Player Name"] == player
       return game_hash[key][:players][i]["Shoe"]
     end
     i += 1
    end
  end
end

def team_colors(team)
  game_hash.each_key do |key|
    if game_hash[key][:team_name] == team
      return game_hash[key][:colors].split(", ")
    end
  end
end

def team_names
  teams = []
  game_hash.each_key do |key|
    teams << game_hash[key][:team_name]
  end
  return teams
end

def player_numbers(team)
  numbers = []
  game_hash.each_key do |key|
    if game_hash[key][:team_name] == team
      i = 0
      while i < game_hash[key][:players].length
        numbers << game_hash[key][:players][i]["Number"]
        i += 1
      end
    end
  end
  return numbers
end

def player_stats(player)
  stats = {}
  game_hash.each_key do |key|
    i = 0
    while i < game_hash[key][:players].length
     if game_hash[key][:players][i]["Player Name"] == player
       stats = {
         :number=>game_hash[key][:players][i]["Number"],
         :shoe=>game_hash[key][:players][i]["Shoe"],
         :points=>game_hash[key][:players][i]["Points"],
         :rebounds=>game_hash[key][:players][i]["Rebounds"],
         :assists=>game_hash[key][:players][i]["Assists"],
         :steals=>game_hash[key][:players][i]["Steals"],
         :blocks=>game_hash[key][:players][i]["Blocks"],
         :slam_dunks=>game_hash[key][:players][i]["Slam Dunks"]
       }
     end
     i += 1
    end
  end

  return stats
end

def big_shoe_rebounds
  biggest_shoe = 0

  game_hash.each_key do |key|
    i = 0
    while i < game_hash[key][:players].length
     if game_hash[key][:players][i]["Shoe"].to_i > biggest_shoe
       biggest_shoe = game_hash[key][:players][i]["Shoe"].to_i
     end
     i += 1
    end
  end

  game_hash.each_key do |key|
    i = 0
    while i < game_hash[key][:players].length
     if game_hash[key][:players][i]["Shoe"].to_i == biggest_shoe
       return game_hash[key][:players][i]["Rebounds"].to_i
     end
     i += 1
    end
  end
end
