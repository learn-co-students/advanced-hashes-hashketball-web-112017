require "pry"

def game_hash
    game_hash = {
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
        :away => {
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
            },
        }
    }
    }
end

def num_points_scored(player)
    game_hash.map do |team, info|
        info.map do |label, value|
          if label == :players
           value.map do |name, data|
             if name == player
                 data.map do |stat, value|
                     if stat == :points
                         value
                 end
               end
            end
          end
        end
      end
    end.flatten.compact.join.to_i
end

def shoe_size(player)
    game_hash.map do |team, info|
        info.map do |label, value|
            if label == :players
                value.map do |name, data|
                    if name == player
                        data.map do |stat, value|
                            if stat == :shoe
                                value
                            end
                        end
                    end
                end
            end
        end
    end.flatten.compact.join.to_i
end

def team_colors(name)
    game_hash.map do |team, info|
        info.map do |label, value|
            if label == :team_name && value == name
        info.map do |label, value|
            if label == :colors
            value
         end
      end
      end
    end
    end.flatten.compact
end

def team_names
    game_hash.map do |team, info|
        info.map do |label, value|
            if label == :team_name
                value
                end
            end
        end.flatten.compact
end

def player_numbers(name)
    game_hash.map do |team, info|
        info.map do |label, value|
            if label == :team_name && value == name
          info.map do |label, value|
              if label == :players
               value.map do |name, data|
                data.map do |stat, value|
                    if stat == :number
                        value
                    end
                  end
                end
               end
              end
          end
      end
    end.flatten.compact.map(&:to_i)
end

def player_stats(player)
    output = {}
    game_hash.map do |team, info|
        info.map do |label, value|
            if label == :players
                value.map do |name, data|
             if name == player
                output.merge!(data)
                 end
             end
            end
          end
        end
    output
end

def big_shoe_rebounds
    max = nil
    answer = nil
   game_hash.map do |team, info|
        info.map do |label, value|
            if label == :players
                value.map do |name, data|
                    data.map do |stat, value|
                        if stat == :shoe
                            if max == nil || value > max
                            max = value
                            answer = name
                            end
                      end
                    end
                end
        end
    end
        end
   game_hash.map do |team, info|
       info.map do |label, value|
           if label == :players
               value.map do |name, data|
                   if name == answer
                    data.map do |stat, value|
                         if stat == :rebounds
                             value
                   end
               end
           end
       end
   end
end
       end.flatten.compact.join.to_i
end

def most_points_scored
    max = nil
    answer = nil
    game_hash.map do |team, info|
        info.map do |label, value|
            if label == :players
                value.map do |name, data|
                    data.map do |stat, value|
                        if stat == :points
                            if max == nil || value > max
                                max = value
                                answer = name
                            end
                        end
                    end
                end
            end
            end
        end
    answer
end

def winning_team
    home_points = 0
    away_points = 0
    game_hash.map do |team, info|
        if team == :home
        info.map do |label, value|
            if label == :players
                value.map do |name, data|
                    data.map do |stat, value|
                        if stat == :points
                            value
                        end
                    end
                   end
                end
            end
        end
        end.flatten.compact.each { |a| home_points+= a }
    home_points
    
    game_hash.map do |team, info|
        if team == :away
            info.map do |label, value|
                if label == :players
                    value.map do |name, data|
                        data.map do |stat, value|
                            if stat == :points
                                value
                            end
                        end
                    end
                end
            end
        end
    end.flatten.compact.each { |a| away_points+= a }
   away_points

 home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]

end

def player_with_longest_name
game_hash.map do |team, info|
    info.map do |label, value|
        if label == :players
            value.map do |name, data|
                     name
                    end
                end
            end
end.flatten.compact.max{ |a, b| a.length <=> b.length}
end

def long_name_steals_a_ton?
   long_name = player_with_longest_name
   
       max_steals = nil
       answer = nil
       game_hash.map do |team, info|
           info.map do |label, value|
               if label == :players
                   value.map do |name, data|
                       data.map do |stat, value|
                           if stat == :steals
                               if max_steals == nil || value > max_steals
                                   max_steals = value
                                   answer = name
                               end
                           end
                       end
                   end
               end
           end
       end
       answer == long_name ? true : false
end

