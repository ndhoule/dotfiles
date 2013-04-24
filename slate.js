slate.configAll({
  'defaultToCurrentScreen': true,
  'checkDefaultsOnLoad': true
});

var layout = {
  maximize: S.op('move', {
    'x' : 'screenOriginX',
    'y' : 'screenOriginY',
    'width' : 'screenSizeX',
    'height' : 'screenSizeY'
  }),

  pushRight: S.op('push', {
    'direction' : 'right',
    'style' : 'bar-resize:screenSizeX/2'
  }),

  pushLeft: S.op('push', {
    'direction' : 'left',
    'style' : 'bar-resize:screenSizeX/2'
  })
};

var operations = {
  'grid': S.op('grid'),

  throw0: S.op('throw', {
    'screen': '0',
    'width': 'screenSizeX',
    'height': 'screenSizeY'
  }),

  throw1: S.op('throw', {
    'screen' : '1',
    'width' : 'screenSizeX',
    'height' : 'screenSizeY'
  })
};

slate.bindAll({
  // Directionals
  'up:ctrl;cmd': layout.maximize,
  'right:ctrl;cmd': layout.pushRight,
  'left:ctrl;cmd': layout.pushLeft,
  '[:ctrl;cmd': operations.throw0,
  ']:ctrl;cmd': operations.throw1,
  'esc:cmd': operations.grid
});
