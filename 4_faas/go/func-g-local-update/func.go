package main

import (
	"context"
	"encoding/json"
	"io"
	"log"

	fdk "github.com/fnproject/fdk-go"
)

func main() {
	fdk.Handle(fdk.HandlerFunc(myHandler))
}

type Locate struct {
	Name string `json:"locate"`
}

func myHandler(ctx context.Context, in io.Reader, out io.Writer) {
	l := &Locate{}
	err := json.NewDecoder(in).Decode(l)
	log.Println(err)
	if err != nil {
		log.Printf("Error decodeing request: %v", err)
	}
	msg := struct {
		Msg string `json:"message"`
	}{}
	if l.Name == "US" {
		msg.Msg = "Hello"
	} else {
		msg.Msg = "こんにちは"
	}
	log.Print("Inside Go Hello World function")
	err = json.NewEncoder(out).Encode(&msg)
	if err != nil {
		log.Printf("Error encoding response: %v", err)
	}
}
