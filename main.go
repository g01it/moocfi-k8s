package main

import (
	"fmt"
	"os"
	"time"

	"github.com/google/uuid"
)

func main() {
	now := time.Now().UTC().Format("2006-01-01T15:04:05.999Z")

	id, err := uuid.NewUUID()
	if err != nil {
		fmt.Println("error generating UUID!", err)
		os.Exit(0)
	}

	for {
		fmt.Printf("%s: %s\n", now, id)
		time.Sleep(5 * time.Second)
	}
}
