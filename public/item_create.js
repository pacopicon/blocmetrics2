var blocmetrics_item_create = {};
  blocmetrics_item_create.report = function(eventName) {
    var event = {name: eventName};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };

blocmetrics_item_create.report("items created");
