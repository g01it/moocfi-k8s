PROJ_NAME := uuidshower

build:
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build $(PROJ_NAME)

clean:
	@rm $(PROJ_NAME)
	@docker image rm $(PROJ_NAME):latest

prune: clean
	@docker image prune

tidy:
	@go mod tidy

docker: build
	@docker build . -t $(PROJ_NAME)
	@k3d image import $(PROJ_NAME):latest

strip: build
	@strip $(PROJ_NAME)

deploy: docker strip
	@kubectl apply -f ./k8s/deploy.yaml
