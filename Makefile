all:
	docker build -t greetd-deb:latest .
	docker rm -f sfdasdwegdfvcbncki
	docker run --name sfdasdwegdfvcbncki greetd-deb:latest
	docker cp sfdasdwegdfvcbncki:/root/greetd greetd
clean:
	docker rm -f sfdasdwegdfvcbncki
	docker rmi -f greetd-deb:latest
