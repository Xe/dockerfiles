import Widget from require "lapis.html"

class UserInfo extends Widget
  content: =>
    center ->
      h1 "Oops!"

      p "Page not found!"

      img src: "/static/img/404.png"
