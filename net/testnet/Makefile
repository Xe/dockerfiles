build:
	docker build -t hub hub
	docker build -t leaf1 leaf1
	docker build -t leaf2 leaf2
	docker build -t services services

run:
	docker run --name hub -dit -p 6067:6667 hub
	docker run --name leaf1 -dit leaf1
	docker run --name leaf2 -dit leaf2
	docker run --name services -dit services

kill:
	docker rm -f hub services leaf1 leaf2
