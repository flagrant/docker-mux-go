package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"net/http"
)

func ArticleHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Article URI")
	fmt.Fprintf(w, "Article URI")
}

func main() {
	// Create a new Router instance
	router := mux.NewRouter()

	// Add the URI /article to be handled by the ArticleHandler method
	router.HandleFunc("/article", ArticleHandler)

	// Add the URI / to be handled by a closure
	router.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("Root URI")
		fmt.Fprintf(w, "Root URI")
	})

	// Pass our router to net/http
	http.Handle("/", router)

	// Listen and serve on localhost:8080
	http.ListenAndServe(":8080", nil)
}
