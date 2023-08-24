# decrypt fastlane env file
gpg -d -o "$DECRYPTED_FASTLANE_ENV_SECRET_FILE_PATH" --pinentry-mode=loopback --passphrase "$FASTLANE_ENV_SECRET_KEY" "$ENCRYPTED_FASTLANE_ENV_SECRET_FILE_PATH"

# decrypt provisioning file
gpg -d -o "$DECRYPTED_PROVISION_FILE_PATH" --pinentry-mode=loopback --passphrase "$PROVISION_KEY" "$ENCRYPTED_PROVISION_FILE_PATH"

# decrypt app store api key
gpg -d -o "$DECRYPTED_APPSTORE_API_KEY_FILE_PATH" --pinentry-mode=loopback --passphrase "$APPSTORE_API_KEY_KEY" "$ENCRYPTED_APPSTORE_API_KEY_FILE_PATH"

# decrypt xcconfig
gpg -d -o "$DECRYPTED_XCCONFIG_PATH" --pinentry-mode=loopback --passphrase "$XCCONFIG_KEY" "$ENCRYPTED_XCCONFIG_PATH"
unzip "$DECRYPTED_XCCONFIG_PATH"
rm -rf "$DECRYPTED_XCCONFIG_PATH"

# decrypt tuist master key
gpg -d -o "$DECRYPTED_MASTER_KEY_FILE_PATH" --pinentry-mode=loopback --passphrase "$MASTER_KEY_KEY" "$ENCRYPTED_MASTER_KEY_FILE_PATH"
tuist signing decrypt