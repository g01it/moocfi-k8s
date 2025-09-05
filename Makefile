PROJ_NAME := uuidshower

build:
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build $(PROJ_NAME)

clean:
	@rm $(PROJ_NAME) -f
	@docker image rm -f $(PROJ_NAME):latest

prune: clean
	@docker image prune

tidy:
	@go mod tidy

docker: build
	@docker build . -t $(PROJ_NAME)

strip: build
	@strip $(PROJ_NAME)

deploy: docker strip
	@k3d image import $(PROJ_NAME):latest
	@kubectl apply -f ./k8s/deploy.yaml

test: docker
	(timeout 1 docker run --rm uuidshower:latest | grep --color=never -E "^202")
