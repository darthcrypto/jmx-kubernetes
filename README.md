Steps to Run JMX exporter

1) Go inside java-test-code, build image "docker-compose up --build"
	-this will build an image that exposes the /metrics on the container at localhost:8080/metrics

2) Run the image with the helm chart

3) prometheus operator should automatically pick it up :)
