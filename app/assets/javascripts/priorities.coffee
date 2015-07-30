jQuery ->
  $('#position_priorities tbody').sortable
    axis: 'y'
    update: ->      
      $.post($(this).data('update-url'), $(this).sortable('serialize'))