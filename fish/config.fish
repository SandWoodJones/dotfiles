# Set SSH to use Gnome keyring
set -gx SSH_AUTH_SOCK (gnome-keyring-daemon --start --components=pkcs11,secrets,ssh | awk -F "=" '$1 == "SSH_AUTH_SOCK" { print $2 }')
