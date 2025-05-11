locals{
  servicename="abracadabra"
  forum="abracadabramcit"
  lengthsa=length(local.servicename)
  winterlistOfSports=["icehockey","snowboarding","iceskating"]
  characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 20000056894]
  character_enemy_map =   {for character in local.characters: # Convert character list to a set
  character => local.enemies_destroyed
  }
  
  restaurants_food_map = {for idx, restaurant in local.top5_restaurants: # Convert restaurants list to a set
  restaurant => idx
  }
  top5_restaurants = ["macdonald","timhorton","kingburger","subway","kfc"] 
  top5_food = ["fish","fries","tea","salad","pizza"]
 restaurants_food_map_zip = zipmap(local.top5_restaurants, local.top5_food)

  }
  string_numbers - ["42","77", "13", "98", "3","64","55","27","89","6"]
  # convert strings to numbers and sum
  number_sum = sum([for n i local.string_numbers : tonumber(n)])
  original_text = "I AM A STUDENT AT MCIT"
  lower_text = lower(local.original_text)
  }
 



