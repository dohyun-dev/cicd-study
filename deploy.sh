#!/bin/bash

# 변수 선언
PROJECT_NAME=cicd-study
PROJECT_HOME=$JENKINS_HOME/workspace/$PROJECT_NAME
DOCKER_IMAGE_NAME=backend-app

# jar 파일 생성
echo "> 빌드 시작"
$PROJECT_HOME/gradlew clean build
echo "> 빌드 완료"

# 도커 허브 로그인
echo "> Docker Hub 로그인"
echo $DOCKER_HUB_PWD | docker login --username $DOCKER_HUB_ID --password-stdin docker.io

# 도커 이미지 생성
echo "> Docker 이미지 파일 생성"
docker rm $DOCKER_HUB_ID/$DOCKER_IMAGE_NAME
echo "> Docker 이미지 파일 생성 완료"

# 도커 허브 푸시
echo "> Docker 허브 PUSH"
docker build -t $DOCKER_HUB_ID/$DOCKER_IMAGE_NAME $PROJECT_HOME && docker push $DOCKER_HUB_ID/$DOCKER_IMAGE_NAME