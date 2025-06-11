#/usr/bin/env bash
ver=$1
if [[ -z $ver ]]; then
  echo "usage: $0 [version]"
  exit
fi

# MacOS
wget https://downloads.1password.com/mac/1Password-${ver}-x86_64.zip -O 1Password-${ver}-x86_64.zip
wget https://downloads.1password.com/mac/1Password-${ver}-aarch64.zip -O 1Password-${ver}-aarch64.zip

# windows
wget https://downloads.1password.com/win/1PasswordSetup-${ver}.exe -O 1PasswordSetup-${ver}.exe
wget https://c.1password.com/dist/1P/win8/arm64/1PasswordSetup-arm64-latest.exe -O 1PasswordSetup-arm64-latest.exe

# debian linux
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -O 1password-latest.deb

mv -v 1PasswordSetup-arm64-latest.exe 1PasswordSetup-arm64-${ver}.exe
mv -v 1password-latest.deb 1password-${ver}.deb

exit