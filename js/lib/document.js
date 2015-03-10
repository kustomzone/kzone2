'use strict';

var dom = require("./dom-lite"),
  UUID = require("uuid"),
  Script = require("../objects/script"),
  Box = require("../objects/box"),
  Spawn = require("../objects/spawn"),
  Player = require("../objects/player"),
  Billboard = require("../objects/billboard"),
  Model = require("../objects/model"),
  Link = require("../objects/link"),
  Skybox = require("../objects/skybox"),
  Fog = require("../objects/fog"),
  Audio = require("../objects/audio"),
  Document = dom.Document,
  HTMLElement = dom.HTMLElement;

Document.prototype.markAsDead = function(uuid) {
  this.deadNodes[uuid] = (new Date).valueOf();
  return delete this.nodeMap[uuid];
};

Document.prototype.getElementByUUID = function(uuid) {
  return this.nodeMap[uuid];
};

Document.prototype.createElement = function(tag) {
  var node;
  if (tag === "script") {
    node = new Script;
  } else if (tag === "box") {
    node = new Box;
  } else if (tag === "player") {
    node = new Player;
  } else if (tag === "billboard") {
    node = new Billboard;
  } else if (tag === "link") {
    node = new Link;
  } else if (tag === "model") {
    node = new Model;
  } else if (tag === "spawn") {
    node = new Spawn;
  } else if (tag === "fog") {
    node = new Fog;
  } else if (tag === "skybox") {
    node = new Skybox;
  } else if (tag === "audio") {
    node = new Audio;
  } else {
    node = new HTMLElement(tag);
  }
  if (node.reflect) {
    node.uuid = UUID.v4();
    this.nodeMap[node.uuid] = node;
  }
  node.ownerDocument = this;
  node.eventTargets = {};
  return node;
};

Document.createDocument = function() {
  var d;
  d = new Document;
  d.deadNodes = {};
  d.nodeMap = {};
  return d;
};

module.exports = Document;
