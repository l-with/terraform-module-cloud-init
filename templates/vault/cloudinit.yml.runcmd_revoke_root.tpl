  # revoke root
  - export VAULT_ADDR=${vault_local_addr}
  - export VAULT_TOKEN=$(cat ${vault_init_json_full_path} | jq .root_token --raw-output)
  - vault token revoke $VAULT_TOKEN
