#!/bin/sh
cd /app
mkdir wwwroot
git clone https://github.com/byxiaopeng/now-proxy
mv now-proxy/* /app/wwwroot
rm -rf /app/now-proxy
cd /app
mkdir caddy
wget -P /app/caddy https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz
tar -zxvf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz -C /app/htdocs
rm -rf /app/htdocs/init
rm -rf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz
wget -P /app/caddy https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /app/caddy/v2ray-linux-64.zip -d /app/caddy/ngweb
mv /app/caddy/ngweb/v2ray /app/wwwroot/ngweb
mv /app/caddy/ngweb/v2ctl /app/wwwroot/v2ctl
rm -rf /app/caddy/ngweb
rm -rf /app/caddy/v2ray-linux-64.zip
nohup /app/wwwroot/ngweb -config /app/wwwroot/peizhi.json >/app/htdocs/ws.txt 2>&1 &
/app/htdocs/caddy -conf="/app/wwwroot/Caddyfile"
