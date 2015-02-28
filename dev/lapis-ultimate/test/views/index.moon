import Widget from require "lapis.html"

class Index extends Widget
  content: =>
    center ->
      h1 "My Awesome Site"

      p class: "lead", "Check out this awesomeness :D"
