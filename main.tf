resource "shell_script" "image" {
  for_each = toset(var.whalebrew_images)

  lifecycle_commands {
    create = "whalebrew install ${each.key}"
    delete = "whalebrew uninstall ${split(":", reverse(split("/", each.key))[0])[0]}"
  }

  lifecycle {
    ignore_changes = [output]
  }
}
