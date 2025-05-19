locals {
  sentence   = "antione sean negar ovadia."
  wordsv2      = split(" ", trim(local.sentence, "."))
  last_wordv2  = local.words[length(local.wordsv2) - 1]
}
