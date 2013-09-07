/*global S:false*/

slate.configAll({
  defaultToCurrentScreen: true,
  checkDefaultsOnLoad: true
});

var layout = {};

layout.full = S.op('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY'
});

layout.topHalf = layout.full.dup({
  height: 'screenSizeY/2'
});

layout.bottomHalf = layout.topHalf.dup({
  y: 'screenOriginY+screenSizeY/2'
});

layout.leftHalf = layout.full.dup({
  width: 'screenSizeX/2'
});

layout.rightHalf = layout.leftHalf.dup({
  x: 'screenOriginX+screenSizeX/2'
});

layout.topLeftQuadrant = layout.leftHalf.dup({
  height: 'screenSizeY/2'
});

layout.bottomLeftQuadrant = layout.topLeftQuadrant.dup({
  y: 'screenSizeY/2'
});

layout.topRightQuadrant = layout.rightHalf.dup({
  height: 'screenSizeY/2'
});

layout.bottomRightQuadrant = layout.topRightQuadrant.dup({
  y: 'screenSizeY/2'
});

var operations = {
  grid: S.op('grid', {
    padding: '5'
  }),

  throw0: S.op('throw', {
    screen: '0',
    width: 'screenSizeX',
    height: 'screenSizeY'
  }),

  throw1: S.op('throw', {
    screen: '1',
    width: 'screenSizeX',
    height: 'screenSizeY'
  })
};

slate.bindAll({
  // Directionals
  'up:ctrl;cmd;shift': layout.full,
  'up:ctrl;cmd': layout.topHalf,
  'down:ctrl;cmd': layout.bottomHalf,
  'left:ctrl;cmd': layout.leftHalf,
  'right:ctrl;cmd': layout.rightHalf,
  'j:ctrl;cmd': layout.topLeftQuadrant,
  'k:ctrl;cmd': layout.bottomLeftQuadrant,
  'l:ctrl;cmd': layout.topRightQuadrant,
  ';:ctrl;cmd': layout.bottomRightQuadrant,

  // Monitors
  '[:ctrl;cmd': operations.throw0,
  ']:ctrl;cmd': operations.throw1,

  // Features
  'esc:cmd': operations.grid
});
