jQuery ->
  $('#position_clients tbody').sortable
    axis: 'y'
    update: ->      
      $.post($(this).data('update-url'), $(this).sortable('serialize'))