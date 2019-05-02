document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  if (control) {
    control.addEventListener('click', sortRowsByTitle)
  }
})

function sortRowsByTitle() {
  var table = this.closest('.table')
  var rows = table.querySelectorAll('tr')

  var sortedRows = []
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  var arrowUp = table.querySelector('.octicon-arrow-up')
  var arrowDown = table.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
    sortedRows.sort(compareRowsAsc)
  } else {
    arrowUp.classList.add('hide')
    arrowDown.classList.remove('hide')
    sortedRows.sort(compareRowsDesc)
  }

  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])


  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var title1 = row1.querySelector('td').textContent
  var title2 = row2.querySelector('td').textContent

  if (title1 < title2) return -1;
  if (title1 > title2) return 1;

  return 0;
}

function compareRowsDesc(row1, row2) {
  var title1 = row1.querySelector('td').textContent
  var title2 = row2.querySelector('td').textContent

  if (title1 < title2) return 1;
  if (title1 > title2) return -1;

  return 0;
}
