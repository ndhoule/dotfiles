slate.configAll({
  'defaultToCurrentScreen': true,
  'checkDefaultsOnLoad': true
});

var operations = {
  maximize: slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
  }),

  pushRight: slate.operation("push", {
    "direction" : "right",
    "style" : "bar-resize:screenSizeX/2"
  }),

  pushLeft: slate.operation("push", {
    "direction" : "left",
    "style" : "bar-resize:screenSizeX/2"
  })
};

slate.bindAll({
  "up:ctrl;cmd"    : operations.maximize,
  "right:ctrl;cmd" : operations.pushRight,
  "left:ctrl;cmd"  : operations.pushLeft
});
