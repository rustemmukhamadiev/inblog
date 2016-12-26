class @FilePreview
  constructor: (el) ->
    @$el = $(el)
    @dataKey = "file-preview"
    @width = 200

    @_bind()

  _bind: ->
    @$el.on "change", @_show

  _name: ->
    @$el.data(@dataKey)

  _container: ->
    $("[data-" + @dataKey + "-container=" + @_name() + "]")

  _show: (event) =>
    input = event.target

    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) =>
        @_container()
          .attr("src", e.target.result)
          .attr("width", @width)

      reader.readAsDataURL input.files[0]
