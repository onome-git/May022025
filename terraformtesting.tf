locals {
  sentence   = "antione sean negar ovadia."
  wordsv2      = split(" ", trim(local.sentence, "."))
  last_wordv2  = local.wordsv2[length(local.wordsv2) - 1]
}
locals{
my_sentence            = "i love my children"
  sentence_wordv3        = split(" ", local.my_sentence)
  sentence_last_index    = length(local.sentence_wordv3) - 1
  sentence_last_wordv3   = element(local.sentence_wordv3, local.sentence_last_index)
}
locals {
  names         = ["eastus", "westeurope", "centralindia"]
  upper_names   = [for name in local.names : upper(name)]
}

locals {
  region       = "eastus"
  is_primary   = local.region == "eastus" ? true : false
  environment  = local.is_primary ? "production" : "staging"
}
