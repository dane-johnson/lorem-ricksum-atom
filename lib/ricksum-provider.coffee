module.exports =
  selector: '.source'

  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    new Promise (resolve) ->
      suggestion:
        text: 'rickandmorty1000years.com'
      resolve([suggestion])
