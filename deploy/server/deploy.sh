#!/bin/bash

# 현재 구동중인 profile 확인
CURRENT_PROFILE=$(curl -s http://localhost/api/profile)

echo "> 현재 구동중인 profile: $CURRENT_PROFILE"
if [ $CURRENT_PROFILE == "set1" ]; then
  IDLE_PROFILE="set2"
  IDLE_PORT=8082
elif [ $CURRENT_PROFILE == "set2" ]; then
  IDLE_PROFILE="set1"
  IDLE_PORT=8081
else
  echo "> 현재 구동중인 profile을 확인할 수 없습니다. set1 할당"
  IDLE_PROFILE="set1"
  IDLE_PORT=8081
fi


# 도커 허브에서 새로운 이미지 pull
echo "새로운 이미지 pull"
docker pull tobeykwon/backend-app

# 도커 컨테이너 실행
echo "도커 컨테이너 실행"
docker run -itd -p $IDLE_PORT:8080 -e IDLE_PROFILE=$IDLE_PROFILE --name backend-app-$IDLE_PROFILE tobeykwon/backend-app

# NGINX 포트 스위칭
sudo sh /home/ubuntu/switch.sh

# 도커 컨테이너 종료 및 삭제
docker stop backend-app-$CURRENT_PROFILE
docker rm backend-app-$CURRENT_PROFILE