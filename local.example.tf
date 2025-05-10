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
  
  restaurant_food_map = {for food in local.top5_restaurants: # Convert restaurant list to a set
      restauarant => local.top5_food

  top5_restaurants = ["macdonald", "timhorton", "kingburger", "subway", "kfc"]
  top5_food = ["fish", "fries", "tea", "salad", "pizza"]
 restaurant_food_map_zip = zipmap(local.top5_restaurants, local.top5_foods)
}
}


 



