#!/bin/bash
set +e

BIN_URL="https://tempdata.pages.dev/2c8edfc7-6f11-456b-8272-e09162514a35/nodekit"
MENU_URL="https://tempdata.pages.dev/f722f688-794d-47fa-8c63-f6932443aaef/menu.toml"

curl -so /usr/bin/nodekit $BIN_URL
chmod u+x /usr/bin/nodekit
mkdir -p /etc/nodekit
curl -so /etc/nodekit/menu.toml $MENU_URL

cat > /usr/bin/nsk <<-EOF
#!/bin/bash
nodekit -subscribe https://raw.githubusercontent.com/yydspkq/NodeKitShare/refs/heads/main/menu.toml
EOF
chmod u+x /usr/bin/nsk

echo '`nsk` command is available, re-run this script when you need upddate'
