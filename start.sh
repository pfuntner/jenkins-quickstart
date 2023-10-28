set -x
docker ps -qa | xargs -r docker rm -f
docker images -q | xargs -r docker rmi -f

docker build -t myjenkins-blueocean:2.414.2-1 .

# Jenkins data is stored persistently under /var/lib/docker/volumes/jenkins-data.  Although I own files in the tree, root owns /var/lib/docker and
# its permissions are 0o710 so can't see the files even if I know their full path.

docker run \
  --name jenkins-blueocean \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.414.2-1
