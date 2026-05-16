package main

import "fmt"

func main() {
    a := make([]int, 10)
    for i := range a {
        a[i] = i * i
    }
    fmt.Println(a)
}
