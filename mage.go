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
	goVersion  = "1.14"
	nimVersion = "1.0.6"
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

// Zig creates the latest nightly release of zig.
func Zig() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	shouldWork(ctx, nil, "./lang/zig", "sh", "./make_image.sh")
}

// V builds the master version of v (https://vlang.io)
func V() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	shouldWork(ctx, nil, "./lang/v", "docker", "build", "--no-cache", "-t", "xena/vlang:latest", "-t", "xena/vlang:"+dateTag, ".")
	shouldWork(ctx, nil, "", "docker", "push", "xena/vlang:latest")
	shouldWork(ctx, nil, "", "docker", "push", "xena/vlang:"+dateTag)
}

// Vars shows the list of variables and their values.
func Vars() {
	qod.Printlnf("go version: %v", goVersion)
	qod.Printlnf("nim version: %v\n", nimVersion)

	qod.Printlnf("dateTag: %v", dateTag)
	qod.Printlnf("wd: %v", wd)
}

// All builds every image in order.
func All() {
	// Base image
	mg.Deps(Base)

	// Programming language specific images
	mg.Deps(Go, Nim, Zig, V, Elm)

	// Tools
	mg.Deps(MDBook, Pandoc)

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

	shouldWork(ctx, nil, dir, "docker", "build", "-t", "xena/go:"+goVersion, "-t", dateSub, "--build-arg", "version="+goVersion, ".")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/go:"+goVersion)
	shouldWork(ctx, nil, dir, "docker", "push", dateSub)

	qod.Printlnf("Built and pushed image for Go xena/go:%s %s", goVersion, dateSub)
}

// GoMini builds the 'mini' version of the compiler using golang.org/x/build/version.
// https://golang.org
func GoMini() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/go-mini")
	dateSub := "xena/go-mini:" + goVersion + "-" + dateTag

	// build and push
	shouldWork(ctx, nil, dir, "docker", "build", "-t", "xena/go-mini:"+goVersion, "-t", dateSub, "--build-arg", "version="+goVersion, ".")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/go-mini:"+goVersion)
	shouldWork(ctx, nil, dir, "docker", "push", dateSub)

	qod.Printlnf("built image xena/go-mini:%s %s", goVersion, dateSub)
}

// Nim builds the image for xena/nim
// https://nim-lang.org
func Nim() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	dir := filepath.Join(wd, "./lang/nim")
	dateSub := "xena/nim:" + nimVersion + "-" + dateTag

	// build and push
	shouldWork(ctx, nil, dir, "docker", "build", "-t", "xena/nim:"+nimVersion, "-t", dateSub, "--build-arg", "nim_version="+nimVersion, ".")
	shouldWork(ctx, nil, dir, "docker", "push", "xena/nim:"+nimVersion)
	shouldWork(ctx, nil, dir, "docker", "push", dateSub)

	qod.Printlnf("build image xena/nim:%s", nimVersion)
}

// Pandoc builds pandoc
func Pandoc() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	shouldWork(
		ctx,
		nil,
		"./tools/pandoc",
		"docker",
		"build",
		"-t",
		"xena/pandoc:latest",
		".",
	)
	shouldWork(ctx, nil, "", "docker", "push", "xena/pandoc:latest")
}

// Elm builds an image for https://elm-lang.org
func Elm() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	shouldWork(
		ctx,
		nil,
		"./lang/elm",
		"docker",
		"build",
		"-t",
		"xena/elm:0.19.1",
		".",
	)
	shouldWork(ctx, nil, "", "docker", "push", "xena/elm:0.19.1")
}

// MDBook builds mdbook
func MDBook() {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	shouldWork(
		ctx,
		nil,
		"./tools/mdbook",
		"docker",
		"build",
		"-t",
		"xena/mdbook:latest",
		".",
	)
	shouldWork(ctx, nil, "", "docker", "push", "xena/mdbook:latest")
}
