require 'pry'


def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
	:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
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

def num_points_scored(name)
  game_hash.each do |k, team_info|
    #first level [home/away, colors/teamname/players ]
    if team_info[:players].has_key?(name)
      return team_info[:players][name][:points]
    end
  end
end

def shoe_size(name)
  game_hash.each do |k, team_info|
    #first level [home/away, colors/teamname/players ]
    if team_info[:players].has_key?(name)
     return team_info[:players][name][:shoe]
    end
  end
end


def team_colors(team_name)
  game_hash.each do |k, team_info|
    #first level [home/away, colors/teamname/players ]
		if team_info[:team_name] == team_name
			return team_info[:colors]
		end
	end
end

def team_names
  team_names = []
  	team_names << game_hash[:home][:team_name]
  	team_names << game_hash[:away][:team_name]
  	team_names
end

def player_numbers(team_name)
  jersey_numbers = []
 game_hash.each do |k, team_info|
    #first level [home/away, colors/teamname/players ]
    if team_info[:team_name] == team_name
      team_info.each do |k, names|
        #second level [colors/teamname/players, players actual names]
        if k == :players
          names.each do |player_names , stats|
            #third level [players actual names, stats]
          jersey_numbers << stats[:number]
        end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  game_hash.each do |k, team_info|
    #first level [home/away, colors/teamname/players ]
    team_info.each do |k ,names|
      #second level [colors/teamname/players, players actual names]
      if k == :players
        names.each do |player_names, stats|
          #third level [players actual names, stats]
          if player_names == name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  all_shoe_sizes = []
    game_hash.each do |k, team_info|
      #first level [home/away, colors/teamname/players ]
      team_info[:players].each do |k, names|
      #second level [colors/teamname/players, players actual names]
      #trying to gather all shoe sizes to compare
        all_shoe_sizes << names[:shoe]
      biggest_shoe = all_shoe_sizes.max
      team_info[:players].each do |k, names|
        #still in second level 
        #now comparing and returning rebounds for biggest shoe size
       if names[:shoe] == biggest_shoe
          return names[:rebounds]
        end
      end
    end
  end
end
