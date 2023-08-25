security create-keychain -p "" "$KEYCHAIN"
security list-keychains -s "$KEYCHAIN"
security default-keychain -s "$KEYCHAIN"
security unlock-keychain -p "" "$KEYCHAIN"
security set-keychain-settings -lut 3600
security list-keychains

# import cert file to keychain
security import Tuist/Signing/SMS.p12 -k "$KEYCHAIN" -P "$CERTS_EXPORT_PWD" -A
security set-key-partition-list -S apple-tool:,apple: -s -k "" "$KEYCHAIN"

mkdir -p "$HOME/Library/MobileDevice/Provisioning Profiles"
# for debugging
echo `ls Tuist/signing/*.mobileprovision`
# 모든 프로비저닝 프로파일을 rename 하고 위에서 만든 디렉토리로 복사하는 과정
for PROVISION in `ls Tuist/signing/*.mobileprovision`
do
  UUID=`/usr/libexec/PlistBuddy -c 'Print :UUID' /dev/stdin <<< $(security cms -D -i ./$PROVISION)`
  cp "./$PROVISION" "$HOME/Library/MobileDevice/Provisioning Profiles/$UUID.mobileprovision"
done