
module "resource_group1" {
  for_each = var.resource_groups

  source   = "./modules/resource_group"
  name     = each.key
  location = each.value.location
}
