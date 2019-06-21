var form = document.querySelector('#filter');
var filterables = document.querySelectorAll('.js-filterable');

var update = function() {
  [].forEach.call(filterables, function(el) {
    el.hidden = false;
  });

  var inputs = document.querySelectorAll('#filter input[value]:checked');
  [].forEach.call(inputs, function(input) {
    var key = input.name;
    var val = JSON.parse(input.value || '""');
    var selector = '.js-filterable[data-' + key + ']:not([hidden])';
    var members = document.querySelectorAll(selector);
    [].forEach.call(members, function(member) {
      var value = JSON.parse(member.getAttribute('data-' + key) || 'null');
      member.hidden = Array.isArray(value)
        ? value.indexOf(val) === -1
        : (value !== val);
    });
  });
};

form.addEventListener('change', update);
