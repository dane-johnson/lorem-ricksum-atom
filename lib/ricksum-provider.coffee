{fetchText} = require('./request')

matchers = ['ricksum', 'lorem']

makeSuggestion = (text, matcher) ->
  suggestion =
    text: text
    displayText: matcher
    rightLabel: 'Lorem Ricksum'

module.exports =
  selector: '.source'
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      matcher = matchers.find (val) -> val.indexOf(prefix) >= 0
      if prefix != '' and matcher
        fetchText().then (text) ->
          resolve([makeSuggestion text[0], matcher])
      else
        resolve([])
