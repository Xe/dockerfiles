package main

import (
	"os"

	"github.com/Xe/x/version"
)

func main() {
	version.Run("go" + os.Getenv("GO_VERSION"))
}
