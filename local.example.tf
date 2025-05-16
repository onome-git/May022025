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
  cleaned_sentence = replace(var.sentence_2, ".", "")
  words_v2 = split(" ", local.cleaned_sentence)
  last_word_v2 = local.words_v2[length(local.words_v2) - 1]
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
  sentence_5           = "Bagels in Montreal are boiled, not baked."
  sentence5_words      = split(" ", local.sentence_5)
  third_word_sentence5 = local.sentence5_words[2]
}
locals {
  sentence_6              = "Is this the best food city in Canada?"
  sentence_6_no_punct     = replace(local.sentence_6, "?", "")
}

locals {
  sentence_7       = "Montreal's food scene is elite!"
  chars_list       = split("", local.sentence_7)
  even_chars       = [for i in range(length(local.chars_list)) : local.chars_list[i] if i % 2 == 0]
  even_positioned  = join("", local.even_chars)
}
locals {
  sentence_8            = "Late-night diners are a blessing."
  words_8               = split(" ", local.sentence_8)
  reversed_words_8      = reverse(local.words_8)
  sentence_8_reversed   = join(" ", local.reversed_words_8)
}

locals {
  sentence_9         = "every foodie should visit once."
  words_9            = split(" ", local.sentence_9)
  capitalized_words  = [
    for word in local.words_9 : format("%s%s", upper(substr(word, 0, 1)), substr(word, 1, length(word) - 1))
  ]
  sentence_9_capitalized = join(" ", local.capitalized_words)
}
locals {
  sentence_10 = "tastes of montreal at every corner"

  short_words = ["in", "of", "at"]

  words_10 = split(" ", local.sentence_10)

  capitalized_words_10 = [
    for i, word in local.words_10 : (
      i == 0 || !(contains(local.short_words, word)) ?
      format("%s%s", upper(substr(word, 0, 1)), substr(word, 1, length(word) - 1)) :
      word
    )
  ]

  sentence_10_title_case = join(" ", local.capitalized_words_10)
}
locals {
  sentence   = "antione sean negar ovadia."
  words_v2.1      = split(" ", trim(local.sentence, "."))
  last_word-v2.1  = local.words_v2.1[length(local.words_v2.1) - 1]
}
