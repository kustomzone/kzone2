var Client;

Client = require("./app/src/client.js");

$(function() {
  return setTimeout(function() {
    return window.client = new Client;
  }, 250);
});
