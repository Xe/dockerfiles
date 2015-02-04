all:
	@echo "Please choose a make rule"

init:
	(cd init && make build)

build:
	@make init
	docker build -t xena/niinix .

clean:
	cd init && make clean
	docker rmi xena/niinix

