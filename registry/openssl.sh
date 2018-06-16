#!/bin/sh

#openssl genrsa -out ca.key 2048
  #openssl req -newkey rsa:2048 -nodes -keyout server.key -x509 -days 365 -out cert.crt -subj "/C=CN/ST=SH/L=XA/O=gdyang/OU=dev/CN=gdyang.cn/emailAddress=gd.shunhua@qq.com"
  #openssl req -new -key server.key -passin pass:123456 -out server.csr -subj "/C=CN/ST=SH/L=XA/O=gdyang/OU=dev/CN=gdyang.cn/emailAddress=gd.shunhua@qq.com"

  #openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey server.key -CAcreateserial -out server.crt

# Generate CA private key 生成ca.key私钥
openssl genrsa -aes256  -passout pass:123456 -out ca.key 2048

# 生成公钥
openssl rsa -in ca.key -passin pass:123456 -pubout -out rsa_public.key
# Generate CSR
openssl req -new -key ca.key -passin pass:123456 -out ca.csr -subj "/C=CN/ST=SH/L=XA/O=gdyang/OU=dev/CN=gdyang.cn/emailAddress=gd.shunhua@qq.com"

openssl x509 -req -days 3650  -passin pass:123456 -in ca.csr -signkey ca.key -out ca.crt


openssl genrsa -aes256 -passout pass:123456 -out registry.key 2048

openssl rsa -in registry.key -out registry.key

openssl req -new -key registry.key  -out registry.csr -subj "/C=CN/ST=SH/L=XA/O=gdyang/OU=dev/CN=docker.gdyang.cn/emailAddress=gd.shunhua@qq.com"



openssl x509 -req -days 3650 -in registry.csr -CA ca.crt -CAkey ca.key  -CAcreateserial -out registry.crt

openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey server.key -CAcreateserial -out server.crt



curl -k --cert /etc/nginx/conf.d/registry.crt --key /etc/nginx/conf.d/registry.key https://docker.gdyang.cn/v2/_catalog


curl -k --cert /etc/nginx/conf.d/registry.crt --key /etc/nginx/conf.d/registry.key https://docker.gdyang.cn/v2/_catalog







"schoolId":669353