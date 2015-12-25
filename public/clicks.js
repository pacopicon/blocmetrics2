$( document ).ready(function() {
  $( window ).click( function() {
    blocmetrics_clicks.report("clicks");
  });
});

var blocmetrics_clicks = {};
  blocmetrics_clicks.report = function(eventName) {
    var event = {name: eventName};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
