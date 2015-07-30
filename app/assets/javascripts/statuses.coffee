jQuery ->
  $('#table_data tbody').sortable
    axis: 'y'
    update: ->      
      $.post($(this).data('update-url'), $(this).sortable('serialize'))