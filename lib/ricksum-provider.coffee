{fetchText} = require('./request')

matchers = ['ricksum', 'lorem']

makeSuggestion = (text, matcher) ->
  suggestion =
    text: text
    displayText: matcher
    rightLabel: 'Lorem Ricksum'

module.exports =
  selector: '.source.coffee'
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      matcher = matchers.find (val) -> val.indexOf(prefix) >= 0
      if prefix != '' and matcher
        resolve([makeSuggestion "WUBBA LUBBA DUB DUB", matcher])
      else
        resolve([])
