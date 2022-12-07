all:
	docker build -t greetd-deb:latest .
	docker rm -f sfdasdwegdfvcbncki
	docker run --name sfdasdwegdfvcbncki greetd-deb:latest
	docker cp sfdasdwegdfvcbncki:/root/greetd-gtk greetd-gtk
	cp -r DEBIAN greetd-gtk
	dpkg-deb --build --root-owner-group greetd-gtk
clean:
	rm -rf greetd-gtk.deb greetd-gtk
	docker rm -f sfdasdwegdfvcbncki
	docker rmi -f greetd-deb:latest
