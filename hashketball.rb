# Write your code here!
require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }

    }
  }
}
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player)
  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player][:points]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player][:shoe]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  result = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, stats|
      stats.each do |type, data|
        if type == :number
          result << data
        end
      end
    end
  else
    game_hash[:away][:players].each do |player, stats|
      stats.each do |type, data|
        if type == :number
          result << data
        end
      end
    end
  end
  result
end

def player_stats(player)
  if game_hash[:home][:players].keys.include?(player)
    game_hash[:home][:players][player]
  elsif game_hash[:away][:players].keys.include?(player)
    game_hash[:away][:players][player]
  end
end


def big_shoe_rebounds
  biggest = "Alan Anderson"
  game_hash[:home][:players].keys.each do |player|
    if game_hash[:home][:players][biggest][:shoe] < game_hash[:home][:players][player][:shoe]
      biggest = player
    end
  end
  game_hash[:away][:players].keys.each do |player|
    if game_hash[:home][:players].keys.include?(biggest)
      if game_hash[:home][:players][biggest][:shoe] < game_hash[:away][:players][player][:shoe]
        biggest = player
      end
    else
      if game_hash[:away][:players][biggest][:shoe] < game_hash[:away][:players][player][:shoe]
        biggest = player
      end
    end
  end
  if game_hash[:home][:players].include?(biggest)
    game_hash[:home][:players][biggest][:rebounds]
  else
    game_hash[:away][:players][biggest][:rebounds]
  end
end

def most_points_scored
  most = "Alan Anderson"
  game_hash[:home][:players].keys.each do |player|
    if game_hash[:home][:players][most][:points] < game_hash[:home][:players][player][:points]
      most = player
    end
  end
  game_hash[:away][:players].keys.each do |player|
    if game_hash[:home][:players].keys.include?(most)
      if game_hash[:home][:players][most][:points] < game_hash[:away][:players][player][:points]
        most = player
      end
    else
      if game_hash[:away][:players][most][:points] < game_hash[:away][:players][player][:points]
        most = player
      end
    end
  end
  most
end

def winning_team
  home_score = 0
  away_score = 0

  game_hash[:home][:players].keys.each do |player|
    home_score += game_hash[:home][:players][player][:points]
  end

  game_hash[:away][:players].keys.each do |player|
    away_score += game_hash[:away][:players][player][:points]
  end

  if home_score > away_score
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest = "Alan Anderson"

  game_hash[:home][:players].keys.each do |player|
    if longest.length < player.length
      longest = player
    end
  end

  game_hash[:away][:players].keys.each do |player|
    if longest.length < player.length
      longest = player
    end
  end

  longest
end


def long_name_steals_a_ton?
  most = "Alan Anderson"

  game_hash[:home][:players].keys.each do |player|
    if game_hash[:home][:players][most][:steals] < game_hash[:home][:players][player][:steals]
      most = player
    end
  end
  game_hash[:away][:players].keys.each do |player|
    if game_hash[:home][:players].keys.include?(most)
      if game_hash[:home][:players][most][:steals] < game_hash[:away][:players][player][:steals]
        most = player
      end
    else
      if game_hash[:away][:players][most][:steals] < game_hash[:away][:players][player][:steals]
        most = player
      end
    end
  end

  most == player_with_longest_name
end
