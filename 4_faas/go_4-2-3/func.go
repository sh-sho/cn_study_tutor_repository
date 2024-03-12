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
	data, err := io.ReadAll(in)
	if err != nil {
		log.Printf("Error reading request: %v", err)
		return
	}

	var locates []Locate // 配列用に変更
	err = json.Unmarshal(data, &locates)
	if err != nil {
		log.Printf("Error decoding request: %v", err)
		return
	}

	msg := struct {
		Msg string `json:"message"`
	}{}
	if len(locates) > 0 && locates[0].Name == "US" {   // 配列用に変更
		msg.Msg = "Hello"
	} else {
		msg.Msg = "こんにちは"
	}

	log.Print("Inside Go Hello World function")
	log.Println("Response message:", msg.Msg)

	err = json.NewEncoder(out).Encode(&msg)
	if err != nil {
		log.Printf("Error encoding response: %v", err)
	}
}
