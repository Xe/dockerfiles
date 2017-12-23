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

func shouldWork(ctx context.Context, env []string, dir string, cmdName string, args ...string) {
	loc, err := exec.LookPath(cmdName)
	qod.ANE(err)

	cmd := exec.CommandContext(ctx, loc, args...)
	cmd.Dir = dir
	cmd.Env = env

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	log.Printf("starting process, env: %v, pwd: %s, cmd: %s, args: %v", env, dir, loc, args)
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
	shouldWork(ctx, nil, dir, "docker", "pull", "alpine:edge")

	// build and push
	shouldWork(ctx, nil, dir, "box", "box.rb")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/alpine:latest")
}

// Go builds the 'thick' go image xena/go.
// https://golang.org
func Go() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/go")

	for _, ver := range []string{"1.8.5", "1.9.2"} {
		e := []string{"GO_VERSION=" + ver, "BOX_INCLUDE_ENV=GO_VERSION"}
		shouldWork(ctx, e, dir, "box", "box.rb")
		shouldWork(ctx, nil, dir, "docker", "push", "xena/go:"+ver)
	}
}

// GoMini builds the 'mini' version of the compiler using golang.org/x/build/version.
// https://golang.org
func GoMini() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/go-mini")

	// build and push
	shouldWork(ctx, nil, dir, "box", "box.rb")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/go-mini:1.9.2")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/go:1.9.2")
}

// Nim builds the image for xena/nim
// https://nim-lang.org
func Nim() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/nim")

	// build and push
	shouldWork(ctx, nil, dir, "box", "box.rb")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/nim:0.17.2")
}
