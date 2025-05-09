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
top5restaurants= zipmap(["macdonald","timhorton","kingburger","subway","kfc"])
food = ["fish","fries","tea","salad","pizza"]
character_food_map =   { for character in local.top5restaurants: # Convert character list to a set
      character => local.food
}
variable "sum_numbers" {
  type    = list(string)
  default = ["42", "77", "13", "98", "3", "64", "55", "27", "89", "6"]

}

output "total_sum" {
  value = sum([for n in var.sum_numbers : tonumber(n)])

}

}
 



