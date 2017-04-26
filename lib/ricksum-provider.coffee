{fetchText} = require('./request')

makeSuggestion = (text, prefix) ->
  suggestion =
    text: text
    displayText: prefix
    rightLabel: 'Lorem Ricksum'

module.exports =
  selector: '.source.coffee'
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      if 'ricksum'.indexOf(prefix) >= 0 or 'lorem'.indexOf(prefix) >= 0
        resolve([makeSuggestion "WUBBA LUBBA DUB DUB", prefix])
      else
        resolve([])
