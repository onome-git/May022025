locals {
  servicename           = "abracadabra"
  forum                 = "abracadabramcit"
  lengthsa              = length(local.servicename)
  winterlistOfSports    = ["icehockey", "snowboarding", "iceskating"]
  characters            = ["luke", "yoda", "darth"]
  enemies_destroyed     = [4252, 900, 20000056894]

  character_enemy_map = {
    for i, character in local.characters :
    character => local.enemies_destroyed[i]
  }

  top5_restaurants      = ["macdonald", "timhorton", "kingburger", "subway", "kfc"]
  top5_food             = ["fish", "fries", "tea", "salad", "pizza"]

  restaurants_food_map_zip = zipmap(local.top5_restaurants, local.top5_food)

  string_numbers        = ["42", "77", "13", "98", "3", "64", "55", "27", "89", "6"]

  number_sum = sum([
    for n in local.string_numbers : tonumber(n)])

  original_text = "I AM A STUDENT AT MCIT"
  lower_text    = lower(local.original_text)
}

  locals {
  quote           = "Montreal: Where potholes have their own zip code."
  upper_quote     = upper(local.quote)
  lower_quote     = lower(local.quote)
  short_quote     = substr(local.quote, 0, 10)
  reversed        = join("", reverse(split("", local.quote)))
  replaced        = replace(local.quote, "potholes", "craters")
  has_zip         = can(index(local.quote, "zip"))
  joined_quotes   = join(" | ", [local.quote, "Stay safe!"])
  words           = split(" ", local.quote)
  quote_length    = length(local.quote)
  branded_quote   = "${local.quote} - City of Surprises"
}

locals {
  sentence_1 = "Montreal bagels taste better at 3am."
  reversed_sentence = join(" ", reverse(split(" ", local.sentence_1)))
}

locals {
  sentence_2 = "Poutine should be a food group."
  last_word = element(split(" ", local.sentence_2), length(split(" ", local.sentence_2)) - 1)
}
locals {
  vowels = regexall("[aeiouAEIOU]", var.sentence)
  vowel_count = length(local.vowels)
}
locals {
  sentence_4          = "Why does St-Laurent never sleep?"
  modified_sentence_4 = replace(local.sentence_4, " ", "_")
}
locals {
  sentence_5      = "Bagels in Montreal are boiled, not baked."
  words           = split(" ", local.sentence_5)
  third_word      = local.words[2]  # Indexing starts at 0
}
