document.addEventListener('turbolinks:load', function() {
  var badgeType = document.querySelector('#badge_rule_type')

  if (badgeType) {
    badgeType.addEventListener('change', updateBadgeValues)
  }
})

function updateBadgeValues() {
  var type = this.value
  console.log(type)

  Rails.ajax({
    url: '/admin/rule_values',
    type: 'GET',
    data: 'type=' + type,
    success: function(response) {
      var values = response.values

      var select = document.createElement('select')
      for (var i = 0; i < values.length; i++) {
        var option = document.createElement('option')
        option.setAttribute('value', values[i][0])
        option.textContent = values[i][1]
        select.appendChild(option)
      }
      var badgeValue = document.querySelector('#badge_rule_value')
      badgeValue.innerHTML = select.innerHTML
    }
  })
}
