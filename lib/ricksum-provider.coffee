{fetchText} = require('./request')

matchers = ['ricksum', 'lorem']

parsePrefix = (prefix, matchers) ->
  matcher = matchers.find (val) -> val.indexOf(prefix) >= 0
  if matcher then return {
    display: matcher,
    quotes: atom.config.get('lorem-ricksum.quotes'),
    paragraphs: atom.config.get('lorem-ricksum.paragraphs')
  }
  matcher = matchers.find (val) -> RegExp("#{val}(_[pq]\d*){0,2}").test prefix
  if matcher
    tail = prefix.substr matcher.length

    data = /_p(\d)+/.exec(tail)
    if data and data.length > 1
      paragraphs = Number(data[1])
    else
      paragraphs = atom.config.get('lorem-ricksum.paragraphs')

    data = /_q(\d)+/.exec(tail)
    if data and data.length > 1
      quotes = Number(data[1])
    else
      quotes = atom.config.get('lorem-ricksum.quotes')

    return {display: prefix, quotes, paragraphs}

makeSuggestion = (text, display) ->
  suggestion =
    text: text.reduce (a, b) -> a + "\n" + b
    displayText: display
    rightLabel: 'Lorem Ricksum'

module.exports =
  selector: '*'
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      {display, quotes, paragraphs} = parsePrefix prefix, matchers
      if prefix != '' and display
        fetchText(paragraphs, quotes).then (text) ->
          resolve([makeSuggestion text, display])
      else
        resolve([])
