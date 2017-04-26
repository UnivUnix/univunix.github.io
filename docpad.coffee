# DocPad Configuration File
# http://docpad.org/docs/config

# Requires
moment = require('moment')

# Define the DocPad Configuration
docpadConfig = {
  regenerateDelay: 1000
  ignoreHiddenFiles: true

  port: 9778
  checkVersion: true

  templateData:
    site:
      url: "http://software.univunix.com"
      title: "UnivUnix Github projects"
      description: """
        Github projects made for UnivUnix website.
        """
      keywords: """
        Unix, GNU, Linux, Mac, BSD, Software
        """
      styles: [
        "/styles/styles.css",
        "/vendor/bootstrap/css/bootstrap-min.css",
        "/vendor/elegant_font/css/style.css",
        "/vendor/font-awesome/css/font-awesome-min.css",
        "/vendor/lightbox/ekko-lightbox-min.css",
        "/vendor/prism/prism.css",
        "https://fonts.googleapis.com/css?family=Lato:300,400,700"
      ]
      scripts: [
        "/vendor/jquery-min.js",
        "/vendor/bootstrap/js/bootstrap-min.js",
        "/vendor/jquery-scrollTo/jquery-scrollTo-min.js",
        "/vendor/jquery-match-height/jquery-matchHeight-min.js",
        "/vendor/lightbox/ekko-lightbox-min.js",
        "/vendor/prism/prism-min.js",
        "/scripts/main.js"
      ]

    # Helper functions
    getDocumentTitle: ->
      if @document.title
        "#{@document.title} | #{@site.title}"
      else
        @site.title

    getDocumentDescription: ->
      @document.description or @site.description

    getKeywords: ->
      @site.keywords.concat(@document.keywords or []).join(', ')

    formatURL: (url) ->
      url
      .replace(/\s/g, "%20")
      .replace(/&/g, "&amp;")

    # Format the passed date, by default format like: Thursday, November 29 2012 3:53 PM
    formatDate: (date,format='LLLL') -> return moment(date).format(format)

    getFullURL: (relativeURL) ->
      @formatURL(@site.url + relativeURL)

    getBreadcrumb: (url) ->
      if(url.search(/projects\/docpad-plugin-api/) != -1)
        return '<li><a href="/">Home</a></li><li class="active">Docpad api plugin</li>'

  #Environment configuration
  localeCode: 'en'

  environments:
    development:
      templateData:
        site:
          url: "http://localhost:9778"
      hostname: 'localhost'
      maxAge: false
    production:
      maxAge: false
      hostname: 'software.univunix.com'

  # Plugins configuration
  plugins:
  	ghpages:
  		deployRemote: 'origin'
  		deployBranch: 'master'

    less:
      referencesOthers: true
      # http://lesscss.org/#using-less-configuration
      lessOptions:
        compress: true,
        sourceMap:
          sourceMapFileInline: true
}

# Export the DocPad Configuration
module.exports = docpadConfig
