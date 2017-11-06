require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    away: {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          stats[:points] if player == name
        end
      end
    end
  end.flatten.compact.first
end

def shoe_size(name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          stats[:shoe] if player == name
        end
      end
    end
  end.flatten.compact.first
end

def team_colors(team)
  game_hash.map do |location, team_data|
    if team_data[:team_name] == team
      team_data[:colors]
    end
  end.flatten.compact
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  game_hash.map do |location, team_data|
    if team_data[:team_name] == team
      team_data.map do |attribute, data|
        if attribute == :players
            data.map do |player, stats|
              stats[:number]
            end
        end
      end
    end
  end.flatten.compact
end

def player_stats(name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          if player == name
            stats
          end
        end
      end
    end
  end.flatten.compact.first
end

def big_shoe_rebounds
  big_guy = ""
  big_shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          if shoe_size(player) > big_shoe
            big_guy = player
            big_shoe = shoe_size(player)
          end
        end
      end
    end
  end
  num_rebounds(big_guy)
end

def num_rebounds(name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          stats[:rebounds] if player == name
        end
      end
    end
  end.flatten.compact.first
end

def most_points_scored
  scorer = ""
  scored = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          if num_points_scored(player) > scored
            scorer = player
            scored = num_points_scored(player)
          end
        end
      end
    end
  end
  scorer
end

def winning_team
  home = 0
  away = 0
  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, data|
        if attribute == :players
          data.map do |player, stats|
              home += num_points_scored(player)
          end
        end
      end
    end
    if location == :away
      team_data.each do |attribute, data|
        if attribute == :players
          data.map do |player, stats|
              away += num_points_scored(player)
          end
        end
      end
    end
  end
  return "#{game_hash[:home][:team_name]} win with #{home} points." if home > away
  return "#{game_hash[:away][:team_name]} win with #{away} points." if away > home
end

def player_with_longest_name
  long_name = ""
  name_length = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          if player.length > name_length
            long_name = player
            name_length = player.length
          end
        end
      end
    end
  end
  long_name
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end

def most_steals
  stealer = ""
  stolen = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          if num_steals(player) > stolen
            stealer = player
            stolen = num_steals(player)
          end
        end
      end
    end
  end
  stealer
end

def num_steals(name)
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, stats|
          stats[:steals] if player == name
        end
      end
    end
  end.flatten.compact.first
end
