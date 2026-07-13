breakglass_public_key = "PLACEHOLDER — replace with output of: ssh-keygen -t rsa -b 4096 -f breakglass-prod"

servicename           = "someservice"
environment           = "prod"
location_abbreviation = "eu"

ssh_admin_object_ids = [
  "00000000-0000-0000-0000-000000000001",
  "00000000-0000-0000-0000-000000000002",
]

ssh_user_object_ids = [
  "00000000-0000-0000-0000-000000000003",
  "00000000-0000-0000-0000-000000000004",
]
