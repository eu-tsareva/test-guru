document.addEventListener('turbolinks:load', function() {

  var passConfirmation = document.querySelector('.js-pass-confirm-field')

  if (passConfirmation) {
    var iconSuccess = passConfirmation.querySelector('.octicon-issue-closed')
    var iconFailure = passConfirmation.querySelector('.octicon-issue-opened')

    passConfirmation.querySelector('input').addEventListener('input', function() {
      var password = document.querySelector('.js-pass-field input').value
      if (this.value == password) {
        iconSuccess.classList.remove('hide')
        iconFailure.classList.add('hide')
      } else {
        iconSuccess.classList.add('hide')
        if (this.value.length) {
          iconFailure.classList.remove('hide')
        } else {
          iconFailure.classList.add('hide')
        }
      }
    })
  }
})
