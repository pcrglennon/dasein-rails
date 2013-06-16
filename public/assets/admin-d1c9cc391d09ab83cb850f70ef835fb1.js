/*----------------------------VALIDATION-----------------------------
*/


(function() {
  var disableSubmit, enableSubmit, playerHgtField, playerHgtValid, playerNumField, playerNumValid, setSubmitEnable, validatePlayerHgt, validatePlayerNum;

  playerNumField = null;

  playerHgtField = null;

  playerNumValid = false;

  playerHgtValid = false;

  setSubmitEnable = function() {
    if (playerNumValid && playerHgtValid) {
      return enableSubmit();
    } else {
      return disableSubmit();
    }
  };

  disableSubmit = function() {
    return $("input[type='submit']").prop("disabled", true);
  };

  enableSubmit = function() {
    return $("input[type='submit']").prop("disabled", false);
  };

  validatePlayerNum = function() {
    var error_div, error_label;

    error_label = $("label#player_number_error");
    error_div = $("div.entry_error").has(error_label);
    if (playerNumField.val().match(/^\d{1,2}$|^$/)) {
      error_label.text("");
      error_div.hide();
      return playerNumValid = true;
    } else {
      error_label.text("Only one or two digit numbers are allowed");
      error_div.show();
      return playerNumValid = false;
    }
  };

  validatePlayerHgt = function() {
    var error_div, error_label;

    error_label = $("label#player_height_error");
    error_div = $("div.entry_error").has(error_label);
    if (playerHgtField.val().match(/^\d'(1[0-2]|\d)".*$|^$/)) {
      error_label.text("");
      error_div.hide();
      return playerHgtValid = true;
    } else {
      error_label.text("Input height in this format: Feet'Inches\" (i.e. 5'10\")");
      error_div.show();
      return playerHgtValid = false;
    }
  };

  $(document).ready((function() {
    playerNumField = $("input#player_number");
    playerHgtField = $("input#player_height");
    validatePlayerNum();
    validatePlayerHgt();
    setSubmitEnable();
    playerNumField.blur((function() {
      validatePlayerNum();
      return setSubmitEnable();
    }));
    return playerHgtField.blur((function() {
      validatePlayerHgt();
      return setSubmitEnable();
    }));
  }));

}).call(this);
