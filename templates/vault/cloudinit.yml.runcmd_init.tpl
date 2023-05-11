  - >
    wait_until --verbose --delay 10 --retries 42 --check 'grep "Active: active (running)" | wc -l | grep 1' 'systemctl status vault --no-pager'
  - export VAULT_ADDR=${vault_init_addr}
  - vault status -format=json | tee /root/vault_status.json
  - export VAULT_INITIALIZED=$(cat /root/vault_status.json | jq .initialized)
  - |
    if [ "$VAULT_INITIALIZED" = "false" ]; then
      vault operator init -key-shares ${vault_key_shares} -key-threshold ${vault_key_threshold} -format=json >/root/vault_init.json
    fi
