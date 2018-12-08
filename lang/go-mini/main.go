package main

import (
	"os"

	"github.com/Xe/x/version"
)

func main() {
	version.Run(os.Getenv("GO_VERSION"))
}
