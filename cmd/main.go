package main

import (
	"fmt"
	"net/http"

	"github.com/google/uuid"
)

const (
	port = "8080"
)

var (
	id = uuid.New().String()
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		you := "world"
		if who, ok := r.URL.Query()["who"]; ok && who[0] != "" {
			you = who[0]
		}
		fmt.Fprintf(w, "[%v] Hello, %s!", id, you)
	})
	http.ListenAndServe(":"+port, nil)
}
