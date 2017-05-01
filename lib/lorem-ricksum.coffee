provider = require('./ricksum-provider');
module.exports =
  config:
    quotes:
      type: 'integer'
      default: 1
      minimum: 1
    paragraphs:
      type: 'integer'
      default: 1
      minimum: 1
  provide: ->
    provider
