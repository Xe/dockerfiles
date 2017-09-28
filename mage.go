// +build mage

// for use with https://github.com/magefile/mage

package main

import (
	"context"
	"log"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/jtolds/qod"
	"github.com/magefile/mage/mg"
)

var wd string

func init() {
	lwd, err := os.Getwd()
	qod.ANE(err)

	wd = lwd
}

func shouldWork(ctx context.Context, dir string, cmdName string, args ...string) {
	loc, err := exec.LookPath(cmdName)
	qod.ANE(err)

	cmd := exec.CommandContext(ctx, loc, args...)
	cmd.Dir = dir

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	log.Printf("starting process, pwd: %s, cmd: %s, args: %v", dir, loc, args)
	err = cmd.Run()
	qod.ANE(err)
}

// All builds every image in order.
func All() {
	// Base image
	mg.Deps(Base)

	// Programming language specific images
	mg.Deps(Go, GoMini, Nim)

	qod.Printlnf("all images built :)")
}

// Base builds the base image xena/alpine.
func Base() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./base/alpine")

	// pull base alpine edge image for rebuilds
	shouldWork(ctx, dir, "docker", "pull", "alpine:edge")

	// build and push
	shouldWork(ctx, dir, "box", "box.rb")
	shouldWork(ctx, dir, "docker", "push", "xena/alpine:latest")
}

// Go builds the 'thick' go image xena/go.
// https://golang.org
func Go() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/go")

	// build and push
	shouldWork(ctx, dir, "box", "box.rb")
	shouldWork(ctx, dir, "docker", "push", "xena/go:1.9")
	// XXX when go 1.9.1, etc comes out
	//shouldWork(ctx, dir, "docker", "push", "xena/go:1.9.1")
}

// GoMini builds the 'mini' version of the compiler using golang.org/x/build/version.
// https://golang.org
func GoMini() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/go-mini")

	// build and push
	shouldWork(ctx, dir, "box", "box.rb")
	shouldWork(ctx, dir, "docker", "push", "xena/go-mini:1.9")
	// XXX when go 1.9.1, etc comes out
	//shouldWork(ctx, dir, "docker", "push", "xena/go:1.9.1")
}

// Nim builds the image for xena/nim
// https://nim-lang.org
func Nim() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/nim")

	// build and push
	shouldWork(ctx, dir, "box", "box.rb")
	shouldWork(ctx, dir, "docker", "push", "xena/nim:0.17.2")
}
