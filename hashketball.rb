require 'pry'

def game_hash
  #set home and away teams
  game_hash = {}
  game_hash[:home] = {}
  game_hash[:away] = {}
  #team names and colors
  game_hash[:home][:team_name] = 'Brooklyn Nets'
  game_hash[:away][:team_name] = 'Charlotte Hornets'
  game_hash[:home][:colors] = ['Black', 'White']
  game_hash[:away][:colors] = ['Turquoise', 'Purple']

  game_hash[:home][:players] = {}
  game_hash[:away][:players] = {}
  home_team_names = ['Alan Anderson', 'Reggie Evans', 'Brook Lopez', 'Mason Plumlee', 'Jason Terry']
  away_team_names = ['Jeff Adrien', 'Bismak Biyombo', 'DeSagna Diop', 'Ben Gordon', 'Brendan Haywood']
  #stock the names
  home_team_names.each do |name|
    game_hash[:home][:players]["#{name}"] = {}
  end
  away_team_names.each do |name|
    game_hash[:away][:players]["#{name}"] = {}
  end

  #fill in game stats
  home_stats=[[0,16,22,12,12,3,1,1],
              [30,14,12,12,12,12,12,7],
              [11,17,17,19,10,3,1,15],
              [1,19,26,12,6,3,8,5],
              [31,15,19,2,2,4,11,1]]
  away_stats = [[4,18,10,1,1,2,7,2],
                [0,16,12,4,7,7,15,10],
                [2,14,24,12,12,4,5,5],
                [8,15,33,3,2,1,1,0],
                [33,15,6,12,12,22,5,12]]
  i = 0
  j = 0
  home_team_names.each do |name|
    game_hash[:home][:players]["#{name}"][:number] = home_stats[i][j]
    game_hash[:home][:players]["#{name}"][:shoe] = home_stats[i][j+1]
    game_hash[:home][:players]["#{name}"][:points] = home_stats[i][j+2]
    game_hash[:home][:players]["#{name}"][:rebounds] = home_stats[i][j+3]
    game_hash[:home][:players]["#{name}"][:assists] = home_stats[i][j+4]
    game_hash[:home][:players]["#{name}"][:steals] = home_stats[i][j+5]
    game_hash[:home][:players]["#{name}"][:blocks] = home_stats[i][j+6]
    game_hash[:home][:players]["#{name}"][:slam_dunks] = home_stats[i][j+7]
    i +=1
  end
  i = 0
  away_team_names.each do |name|
    game_hash[:away][:players]["#{name}"][:number] = away_stats[i][j]
    game_hash[:away][:players]["#{name}"][:shoe] = away_stats[i][j+1]
    game_hash[:away][:players]["#{name}"][:points] = away_stats[i][j+2]
    game_hash[:away][:players]["#{name}"][:rebounds] = away_stats[i][j+3]
    game_hash[:away][:players]["#{name}"][:assists] = away_stats[i][j+4]
    game_hash[:away][:players]["#{name}"][:steals] = away_stats[i][j+5]
    game_hash[:away][:players]["#{name}"][:blocks] = away_stats[i][j+6]
    game_hash[:away][:players]["#{name}"][:slam_dunks] = away_stats[i][j+7]
    i = i+1
  end
  #create stats
  game_hash
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        #binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            #binding.pry
      end
    end
  end
end


def home_team_name
  game_hash[:home][:team_name]
end

def num_points_scored(name)
  if game_hash[:home][:players]["#{name}"]
    game_hash[:home][:players]["#{name}"][:points]
  elsif game_hash[:away][:players]["#{name}"]
    game_hash[:away][:players]["#{name}"][:points]
  else
    nil
  end
end

def shoe_size(name)
  if game_hash[:home][:players]["#{name}"]
    game_hash[:home][:players]["#{name}"][:shoe]
  elsif game_hash[:away][:players]["#{name}"]
    game_hash[:away][:players]["#{name}"][:shoe]
  else
    nil
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name]==team_name
    game_hash[:away][:colors]
  else
    nil
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  #find team location
  team_location = ''
  game_hash.each do |location, team_data|
    if game_hash[:"#{location}"][:team_name] == team_name
      team_location = location
    end
  end

  #iterate through the players and collect the player numbers & return
  game_hash[:"#{team_location}"][:players].collect do |key, value|
    value[:number]
  end
end

def player_stats(player_name)
  #get location
    player_location = ''
    game_hash.each do |location, team_data|
      if game_hash[:"#{location}"][:players][player_name]
        player_location = location
      end
    end

    game_hash[:"#{player_location}"][:players][player_name]

end

def big_shoe_rebounds
  #already have player_stats method
  #run through player stats and collect one with biggest shoe size
  highest_shoe_size = 0
  rebound = 0
  game_hash.each do |location, team_data|
    team_data.each do |item,player_stat_data|
      if item == :players
        player_stat_data.each do |player_key, stat_data_value|
        if stat_data_value[:shoe] > highest_shoe_size
          rebound = stat_data_value[:rebounds]
        end
      end
      end
    end
  end

  rebound
end
