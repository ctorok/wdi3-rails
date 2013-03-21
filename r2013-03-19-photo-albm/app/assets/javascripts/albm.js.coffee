class Home
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Home.clear_form)
    photos = $('.photo').length
    $('#slider').slider({ min: 0, max: photos, step: 1, slide: Home.sliding })
    $('#slider').slider('option', 'value', photos) #this moves the scroll al the way to the end

  @clear_form: (e) ->
    e.preventDefault()
    $('#form').empty()

  @sliding: (e, ui) ->
    album_id = $('#album').data('album-id')
    # console.log(ui.value)
    # console.log(album_id)
    count = ui.value #position teh slider is at
    settings =
      dataType: 'script' #sending JS back, not JSON
      type: 'get'
      url: "/albums/#{album_id}/filter?count=#{count}"
    # console.log(settings.url)
    $.ajax(settings)



$(document).ready(Home.document_ready) #document.ready is a class function
