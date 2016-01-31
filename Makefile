# Build the image.
.PHONY: build
build:
	docker build -t selenium-image -f Dockerfile .

# Stop and remove all containers.
.PHONY: clean
clean:
	docker stop selenium-container
	docker rm selenium-container

# Remove the image.
.PHONY: clean-image
clean-image:
	docker rm selenium-image

# List all containers.
.PHONY: ls
ls:
	docker ps -a

# List all images.
.PHONY: ls-images
ls-images:
	docker images

# Run the interactive container.
.PHONY: run
run:
	docker run -d --name selenium-container -p 4444:4444 selenium-image

# Execute the interactive bash of the container.
.PHONY: exec
exec:
	docker exec -it selenium-container bash