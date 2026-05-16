package main

import "fmt"

//go:noinline
func addSlices(a, b, res []float64) {
	for i := range a {
		res[i] = a[i] + b[i]
	}
}

func main() {
	a := []float64{1.0, 2.0, 3.0, 4.0}
	b := []float64{10.0, 20.0, 30.0, 40.0}
	res := make([]float64, 4)

	addSlices(a, b, res)
	fmt.Println(res)
}
