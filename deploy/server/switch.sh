#!/bin/bash

# 현재 구동중인 PORT 확인
CURRENT_PROFILE=$(curl -s http://localhost/api/profile)

echo "$CURRENT_PROFILE"

if [ $CURRENT_PROFILE == "set1" ]; then
  CURRENT_PORT=8081
  IDLE_PORT=8082
elif [ $CURRENT_PROFILE == "set2" ]; then
  CURRENT_PORT=8082
  IDLE_PORT=8081
else
  CURRENT_PORT=8080
  IDLE_PORT=8081
fi

echo "> 현재 구동중인 포트: $CURRENT_PORT"

# 포트 스위칭
sudo sed -i "s/${CURRENT_PORT}/${IDLE_PORT}/g" /etc/nginx/sites-available/default

# NGINX 새로고침
echo "> Nginx를 새로고침합니다."
sudo service nginx reload