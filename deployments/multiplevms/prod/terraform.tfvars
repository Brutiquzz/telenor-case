breakglass_public_key = "PLACEHOLDER — replace with output of: ssh-keygen -t rsa -b 4096 -f breakglass-prod"

servicename           = "platform"
environment           = "prod"
location_abbreviation = "eu"

vms = {
  web = {
    servicename = "web"
    subnet_cidr = "10.0.1.0/24"
    ssh_admin_object_ids = [
      "00000000-0000-0000-0000-000000000001",
    ]
    ssh_user_object_ids = [
      "00000000-0000-0000-0000-000000000003",
    ]
  }

  api = {
    servicename = "api"
    subnet_cidr = "10.0.2.0/24"
    ssh_admin_object_ids = [
      "00000000-0000-0000-0000-000000000001",
    ]
    ssh_user_object_ids = [
      "00000000-0000-0000-0000-000000000003",
    ]
  }

  db = {
    servicename = "db"
    subnet_cidr = "10.0.3.0/24"
    ssh_admin_object_ids = [
      "00000000-0000-0000-0000-000000000001",
    ]
    ssh_user_object_ids = [
      "00000000-0000-0000-0000-000000000003",
    ]
  }
}
