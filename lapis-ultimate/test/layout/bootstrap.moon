import Widget from require "lapis.html"

class Layout extends Widget
  head: =>
    meta charset: "UTF-8"

    title ->
      if @title
        text "#{@title} - My Awesome Site"
      else
        text "My Awesome Site"

    if @meta_description
      meta property: "og:description", content: @meta_description
      meta name: "description", content: @meta_description

    link rel: "stylesheet", href: "/static/comp/bootstrap/dist/css/bootstrap.min.css"
    link rel: "stylesheet", href: "/static/comp/bootstrap/dist/css/bootstrap-theme.min.css"
    link rel: "stylesheet", href: "/static/comp/fontawesome/font-awesome.min.css"
    link rel: "stylesheet", href: "/static/css/main.css"

    link type: "text/plain", rel: "author", href: "/humans.txt"

    script src: "/static/comp/jquery/dist/jquery.min.js"
    script src: "/static/comp/bootstrap/dist/js/bootstrap.min.js"
    script src: "/static/comp/instantclick/instantclick.js"

  header: =>
    nav class: "navbar navbar-fixed-top", ->
      div class: "container", ->
        div class: "navbar-header", ->
          button type: "button", class: "navbar-toggle collapsed", ["data-toggle"]: "collapse", ["data-target"]: "#navbar", ["aria-expanded"]: "false", ["aria-controls"]: "navbar", ->
            span class: "sr-only", ->
              text "Toggle navigation"

            for i=1,3
              span class: "icon-bar"

          a class: "navbar-brand", href: "/", ->
            text "My Awesome Site"

        div id: "navbar", class: "collapse navbar-collapse", ->
          ul class: "nav navbar-nav", ->
            li ->
              a href: "#", "Link 1"
            li ->
              a href: "#", "Link 2"

          ul class: "nav navbar-nav navbar-right", ->
            li ->
              a href: "#", "Contact"

  footer: =>
    footer ->
      div class: "container footer", ->
        center ->
          p class: "text-muted", ->
            text "Copyright - #{os.date "%Y"}"

            if os.getenv "GIT_REV"
              text " - revision "
              code "#{os.getenv("GIT_REV")\sub 1,8}"

  body: =>
    div class: "container", ->
      if @flash
        div class: "flash", ->
          text @flash

      @content_for "inner"

  content: =>
    html_5 ->
      head ->
        @head!

      body ->
        @header!
        @body!
        @footer!
