locals{
  servicename="abracadabra"
  forum="abracadabramcit"
  lengthsa=length(local.servicename)
winterlistOfSports=["icehockey","snowboarding","iceskating"]
characters = ["luke", "yoda", "darth"]
  enemies_destroyed = [4252, 900, 20000056894]
character_enemy_map =   { for character in local.characters: # Convert character list to a set
      character => local.enemies_destroyed
}
top5restaurants= ["macdonald","timhorton","kingburger","subway","kfc"]{
food = ["fish","fries","tea","salad","pizza"]
food_map =   { for character in local.food: # Convert character list to a set
      character => local.food
}
}

