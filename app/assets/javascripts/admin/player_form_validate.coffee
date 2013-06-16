###----------------------------VALIDATION-----------------------------###

#Variables to refer to player number and player height fields
playerNumField = null
playerHgtField = null
playerNumValid = false
playerHgtValid = false

setSubmitEnable = ->
  if playerNumValid && playerHgtValid
    enableSubmit()
  else
    disableSubmit()

disableSubmit = -> $("input[type='submit']").prop("disabled", true)
enableSubmit = -> $("input[type='submit']").prop("disabled", false)

#Validate Player Number is a 1 or 2 digit number (or blank, which is validated server-side)
validatePlayerNum = ->
  error_label = $("label#player_number_error")
  error_div = $("div.entry_error").has(error_label)
  if playerNumField.val().match(/^\d{1,2}$|^$/)
    error_label.text("")
    error_div.hide()
    playerNumValid = true
  else
    error_label.text("Only one or two digit numbers are allowed")
    error_div.show()
    playerNumValid = false


#Validate Player Height follows this Format feet'inches" (or blank)
#Additional characters are allowed, but only if correct height format comes first
validatePlayerHgt = ->
  error_label = $("label#player_height_error")
  error_div = $("div.entry_error").has(error_label)
  if playerHgtField.val().match(/^\d'(1[0-2]|\d)".*$|^$/)
    error_label.text("")
    error_div.hide()
    playerHgtValid = true
  else
    error_label.text("Input height in this format: Feet'Inches\" (i.e. 5'10\")")
    error_div.show()
    playerHgtValid = false

#Initialize, and respond to certain changes
$(document).ready (->
  playerNumField = $("input#player_number")
  playerHgtField = $("input#player_height")
  validatePlayerNum()
  validatePlayerHgt()
  setSubmitEnable()
  #Do stuff on blur
  playerNumField.blur (->
    validatePlayerNum()
    setSubmitEnable()
  )
  playerHgtField.blur (->
    validatePlayerHgt()
    setSubmitEnable()
  )
)