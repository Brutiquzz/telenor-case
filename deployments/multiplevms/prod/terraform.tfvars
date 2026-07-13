environment           = "prod"
location_abbreviation = "eu"

vms = {
  web = {
    servicename = "web"
    ssh_admin_object_ids = [
      "00000000-0000-0000-0000-000000000001",
    ]
    ssh_user_object_ids = [
      "00000000-0000-0000-0000-000000000003",
    ]
  }

  api = {
    servicename = "api"
    ssh_admin_object_ids = [
      "00000000-0000-0000-0000-000000000001",
    ]
    ssh_user_object_ids = [
      "00000000-0000-0000-0000-000000000003",
    ]
  }

  db = {
    servicename = "db"
    ssh_admin_object_ids = [
      "00000000-0000-0000-0000-000000000001",
    ]
    ssh_user_object_ids = [
      "00000000-0000-0000-0000-000000000003",
    ]
  }
}
