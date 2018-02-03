// +build mage

// for use with https://github.com/magefile/mage

package main

import (
	"context"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"time"

	"github.com/jtolds/qod"
	"github.com/magefile/mage/mg"
)

const (
	goVersion  = "1.9.3"
	nimVersion = "0.17.2"
)

var (
	wd      string
	dateTag string
)

func init() {
	lwd, err := os.Getwd()
	qod.ANE(err)

	wd = lwd
	dateTag = time.Now().Format("01022006")
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
	mg.Deps(Go, Nim)

	qod.Printlnf("all images built :)")
}

// Base builds the base image xena/alpine.
func Base() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./base/alpine")

	// pull base alpine edge image for rebuilds
	shouldWork(ctx, nil, dir, "docker", "pull", "alpine:edge")

	dateSub := "xena/alpine:" + dateTag

	// build and push
	shouldWork(ctx, nil, dir, "docker", "build", "-t", "xena/alpine:latest", "-t", dateSub, ".")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/alpine:latest")
	shouldWork(ctx, nil, dir, "docker", "push", dateSub)

	qod.Printlnf("built and pushed xena/alpine")
}

// Go builds the 'thick' go image xena/go.
// https://golang.org
func Go() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	mg.Deps(GoMini)

	dir := filepath.Join(wd, "./lang/go")

	dateSub := "xena/go:" + goVersion + "-" + dateTag

	shouldWork(ctx, nil, dir, "docker", "build", "-t", "xena/go:"+goVersion, "-t", dateSub, ".")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/go:"+goVersion)
	shouldWork(ctx, nil, dir, "docker", "push", dateSub)

	qod.Printlnf("Built and pushed image for Go xena/go:%s", goVersion)
}

// GoMini builds the 'mini' version of the compiler using golang.org/x/build/version.
// https://golang.org
func GoMini() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/go-mini")

	dateSub := "xena/go-mini:" + goVersion + "-" + dateTag

	// build and push
	shouldWork(ctx, nil, dir, "docker", "build", "-t", "xena/go-mini:"+goVersion, "-t", dateSub, ".")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/go-mini:"+goVersion)
	shouldWork(ctx, nil, dir, "docker", "push", dateSub)

	qod.Printlnf("built image xena/go-mini:%s", goVersion)
}

// Nim builds the image for xena/nim
// https://nim-lang.org
func Nim() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/nim")

	// build and push
	shouldWork(ctx, nil, dir, "box", "box.rb")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/nim:"+nimVersion)

	qod.Printlnf("build image xena/nim:%s", nimVersion)
}
