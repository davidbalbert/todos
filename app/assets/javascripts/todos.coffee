$(document).ready ->
  $(document).on "click", ".completed-form input[type=checkbox]", ->
    $(this).closest("form").submit()
