locals {
  sentence   = "antione sean negar ovadia."
  wordsv2      = split(" ", trim(local.sentence, "."))
  last_wordv2  = local.wordsv2[length(local.wordsv2) - 1]
}
