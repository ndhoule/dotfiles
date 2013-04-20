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
  'grid': S.op('grid')
};

slate.bindAll({
  // Directionals
  'up:ctrl;cmd': layout.maximize,
  'right:ctrl;cmd': layout.pushRight,
  'left:ctrl;cmd': layout.pushLeft,
  'esc:cmd': operations.grid
});
