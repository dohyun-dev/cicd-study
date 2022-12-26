# 도커 컨테이너 종료
docker stop backend-app

# 도커 컨테이너 삭제
docker rm backend-app

# 도커 이미지 삭제
docker rmi backend-app

# 도커 허브에서 새로운 이미지 pull
echo "새로운 이미지 pull"
docker pull tobeykwon/backend-app

# 도커 컨테이너 실행
echo "도커 컨테이너 실행"
docker run -itd -p 8080:8080 --name backend-app tobeykwon/backend-app