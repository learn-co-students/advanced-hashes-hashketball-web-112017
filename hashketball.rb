# Write your code here!
require 'pry'
def game_hash
  {
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


def num_points_scored(selected_player)
  game_hash.each do |team, team_info|
    team_info.each do |info, data|
      if info == :players
        data.each do |player, stats|
          if player == selected_player
            return stats[:points]
          end
        end
      end
    end
  end
end


def shoe_size(selected_player)
  game_hash.each do |team, team_info|
    team_info.each do |info, data|
      if info == :players
        data.each do |player, stats|
          if player == selected_player
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(selected_team_name)
  game_hash.each do |team, team_info|
    if game_hash[team][:team_name] == selected_team_name
      return game_hash[team][:colors]
    end
  end
end

def team_names
  answer_arr = []
  game_hash.each do |team, team_info|
    answer_arr << game_hash[team][:team_name]
  end
  return answer_arr
end

def player_numbers(selected_team_name)
  jersey_numbers = []
  game_hash.each do |team, team_info|
    team_info.each do |info, data|
      if team_info[:team_name] == selected_team_name && info == :players
        data.each do |player, stats|
          jersey_numbers << data[player][:number]
        end
      end
    end
  end
  return jersey_numbers
end

def player_stats(selected_player)
  game_hash.each do |team, team_info|
    team_info.each do |info, data|
      if info == :players
        data.each do |player, stats|
          if player == selected_player
            return data[player]
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  team_side = nil
  largest_size_name = ""
  largest_size = 0
  game_hash.each do |team, team_info|
    team_info.each do |info, data|
      if info == :players
        data.each do |player, stats|
          if data[player][:shoe] > largest_size
            team_side = team
            largest_size_name = player
            largest_size = data[player][:shoe]
          end
        end
      end
    end
  end
  return game_hash[team_side][:players][largest_size_name][:rebounds]
end
