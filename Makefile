build:
	@GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build .

clean:
	@rm ./uuidshower

tidy:
	@go mod tidy

prod: build
	@strip ./uuidshower
