# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

NumberSayer =
  init: () ->
    $('.form-calculate').on 'submit', (e) ->
      e.preventDefault()
      NumberSayer.send_request(e)

  send_request: (e) ->
  
    data = $('.form-calculate').serialize()
  
    jQuery.ajax
      type: 'POST'
      url: '/numbersayer'
      dataType: 'json'
      data: data
      success: (data, status, jqXHR) ->
        console.log(data)
        $('#calculate_result').val(data.reply)

    
    e.preventDefault()
    return false
  
        
      
jQuery ->
  NumberSayer.init()
