lapis = require "lapis"

class extends lapis.Application
  layout: require "layout.bootstrap"

  [index: "/"]: =>
   render: true

  handle_404: =>
    status: 404, render: "notfound"
