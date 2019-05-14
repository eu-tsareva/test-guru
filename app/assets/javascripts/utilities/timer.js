document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  if (timer) {
    var minField = document.querySelector('.timer-min')
    var secField = document.querySelector('.timer-sec')

    var time = timeInSec(minField.textContent, secField.textContent)
    var timeLeft = time

    var timerId = setInterval(function() {
      timeLeft -= 1
      minField.textContent = minutes(timeLeft)
      secField.textContent = seconds(timeLeft)
    }, 1000)

    setTimeout(function() {
      clearInterval(timerId)
      window.location.href = document.location + '/finish'
    }, time * 1000)
  }
})

function timePadded(time) {
  if (time < 60) { time = ('0' + time).slice(-2) }
  return time
}

function minutes(time) {
  return timePadded(Math.floor(time / 60))

}
function seconds(time) {
  return timePadded(time % 60)
}

function timeInSec(min, sec) {
  return parseInt(min) * 60 + parseInt(sec)
}
