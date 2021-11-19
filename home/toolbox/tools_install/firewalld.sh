#!/usr/bin/env bash

echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
sysctl -p
firewall-cmd --permanent --add-masquerade
# 8080可以改成其他端口
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --permanent --add-port=8080/tcp
# 8080和上面保持一致，国外ip改成你国外vps的ip，443改成国外ss/ssr/v2ray等软件的端口
firewall-cmd --permanent --add-forward-port=port=8080:proto=tcp:toaddr=198.211.9.229:toport=7777
firewall-cmd --permanent --add-forward-port=port=8080:proto=udp:toaddr=198.211.9.229:toport=7777
firewall-cmd --reload
