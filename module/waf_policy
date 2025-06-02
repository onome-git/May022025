resource "azurerm_web_application_firewall_policy" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "custom_rules" {
    for_each = var.custom_rules
    content {
      name      = custom_rules.value.name
      priority  = custom_rules.value.priority
      rule_type = custom_rules.value.rule_type

      dynamic "match_conditions" {
        for_each = custom_rules.value.match_conditions
        content {
          match_variables {
            variable_name = match_conditions.value.match_variable
            selector      = lookup(match_conditions.value, "selector", null)
          }

          operator           = match_conditions.value.operator
          negation_condition = match_conditions.value.negation_condition
          match_values       = match_conditions.value.match_values
        }
      }

      action = custom_rules.value.action
    }
  }

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    dynamic "exclusion" {
      for_each = var.exclusions
      content {
        match_variable          = exclusion.value.match_variable
        selector                = exclusion.value.selector
        selector_match_operator = exclusion.value.selector_match_operator
      }
    }

    managed_rule_set {
      type    = var.managed_rule_set.type
      version = var.managed_rule_set.version

      dynamic "rule_group_override" {
        for_each = var.managed_rule_set.rule_group_overrides
        content {
          rule_group_name = rule_group_override.value.rule_group_name

          dynamic "rule" {
            for_each = rule_group_override.value.rules
            content {
              id      = rule.value.id
              enabled = rule.value.enabled
              action  = rule.value.action
            }
          }
        }
      }
    }
  }
}
