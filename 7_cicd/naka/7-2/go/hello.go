package main

import (
    "encoding/json"
    "log"
    "net/http"
)

type Msg struct {
    Name string `json:"msg"`
}

func main() {
    http.HandleFunc("/", handler)
    log.Println("Starting server on :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
    if r.Method == "GET" {
        // Handle GET request, perhaps send a default response
        json.NewEncoder(w).Encode(map[string]string{"message": "Hi, there"})
        return
    }
	var l Msg
    if err := json.NewDecoder(r.Body).Decode(&l); err != nil {
        log.Printf("Error decoding request: %v", err)
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }
    defer r.Body.Close()

    msg := struct {
        Msg string `json:"message"`
    }{}

    switch l.Name {
    case "US":
        msg.Msg = "Hello"
    case "HRU":
        msg.Msg = "Hi there, ALL!"
    default:
        msg.Msg = "Hi, there"
    }

    log.Printf("Processed message: %v", msg)
    w.Header().Set("Content-Type", "application/json")
    if err := json.NewEncoder(w).Encode(&msg); err != nil {
        log.Printf("Error encoding response: %v", err)
        http.Error(w, err.Error(), http.StatusInternalServerError)
    }
}
