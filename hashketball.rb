require 'pry'
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

def num_points_scored(player_name)
  if ( game_hash[:home][:players].include?(player_name) )
    return game_hash[:home][:players][player_name][:points]
  elsif ( game_hash[:away][:players].include?(player_name) )
    return game_hash[:away][:players][player_name][:points]
  end
end

def shoe_size(name)
  game_hash.each do |place, properties_hash|
      properties_hash.each do |properties, p_values_hash|
        if p_values_hash.class == Hash
          p_values_hash.each do |player_name, player_hashes|
            if player_name == name
              return game_hash[place][properties][name][:shoe]
            end
          end
        end
      end
    end
end

def team_colors(team)
  game_hash.each do |place, place_hash|
    place_hash.each do |property, p_values|
      if p_values == team
        return game_hash[place][:colors]
      end
    end
  end
end

def team_names
  names_array = []
  game_hash.each do |place, properties_hash|
    names_array << game_hash[place][:team_name]
  end
  names_array
end

def player_numbers(team)
  numbers_array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player_name, player_stats_hash|
      numbers_array << game_hash[:home][:players][player_name][:number]
    end
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player_name, player_stats_hash|
      numbers_array << game_hash[:away][:players][player_name][:number]
    end
  end
  numbers_array
end

def player_stats(name)
  if game_hash[:home][:players].include?(name)
    return game_hash[:home][:players][name]
  elsif game_hash[:away][:players].include?(name)
    return game_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  largest = 0
  rebound = 0

  game_hash.each do |place, place_hash|
    place_hash.each do |cata_sym, cata_name|
      if cata_name.class == Hash
        cata_name.each do |name, stats_hash|
          if stats_hash[:shoe] > largest
            largest = stats_hash[:shoe]
            rebound = stats_hash[:rebounds]
          end
        end
      end
    end
  end

  rebound
end
