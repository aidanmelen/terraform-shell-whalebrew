output "whalebrew_list" {
  description = "A list of packages installed with Whalebrew. Also see `whalebrew list`."
  value = [
    for image in toset(var.whalebrew_images) : split(":", reverse(split("/", image))[0])[0]
  ]
}
