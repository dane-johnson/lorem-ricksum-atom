{fetchText} = require('./request')

matchers = ['ricksum', 'lorem']

makeSuggestion = (text, matcher) ->
  suggestion =
    text: text.reduce (a, b) -> a + "\n" + b
    displayText: matcher
    rightLabel: 'Lorem Ricksum'

module.exports =
  selector: '*'
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      matcher = matchers.find (val) -> val.indexOf(prefix) >= 0
      if prefix != '' and matcher
        quotes = atom.config.get('lorem-ricksum.quotes')
        paragraphs = atom.config.get('lorem-ricksum.paragraphs')
        fetchText(paragraphs, quotes).then (text) ->
          resolve([makeSuggestion text, matcher])
      else
        resolve([])
