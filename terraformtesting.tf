locals {
  sentence   = "antione sean negar ovadia."
  words      = split(" ", trim(local.sentence, "."))
  last_word  = local.words[length(local.words) - 1]
}
