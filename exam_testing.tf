variable "nested_list" {
  type    = list(list(string))
  default = [["a", "b"], ["c", "d"], ["e", "f"]]
}
locals{
flattened_list = flatten(var.nested_list)
}
output "flattened_list_result" {
  value = local.flattened_list
}
