locals {
  default_tags = merge(
    {
      owner       = var.project_name
      environment = var.prefix
      prefix      = var.prefix
    }
  )

  default_prefix = replace("${var.project_name}-${local.prefix}", "_", "-")

  parts               = split("_", var.prefix)
  first_part          = local.parts[0]
  first_letters_other = [for part in slice(local.parts, 1, length(local.parts)) : substr(part, 0, 1)]
  prefix              = trim(join("_", [local.first_part, join("", local.first_letters_other)]), "_")
}
