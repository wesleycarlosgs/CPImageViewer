#!/bin/sh
security create-keychain -p travis ios-build.keychain
security import ./scripts/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/profile/$PROFILE_NAME.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
cp ./scripts/profile/6092a63b-9d26-4b31-a677-ea5bd4d812fa.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
