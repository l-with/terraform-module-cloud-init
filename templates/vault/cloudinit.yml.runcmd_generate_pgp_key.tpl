  - gpg --batch --generate-key ${vault_gpg_key_conf_file}
  - gpg --armor --output ${vault_pgp_pub_key} --export ${vault_gpg_key_name}
  - gpg --armor --export-options backup --output ${vault_pgp_priv_key} --export-secret-keys ${vault_gpg_key_name}
