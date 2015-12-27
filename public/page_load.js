var blocmetrics_page_load = {};
  blocmetrics_page_load.report = function(eventName) {
    var event = {name: eventName};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };

blocmetrics_page_load.report("page load");
