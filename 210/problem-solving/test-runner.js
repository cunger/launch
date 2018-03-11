var Jasmine = require('jasmine');
var jasmine = new Jasmine();

jasmine.loadConfig({
  spec_dir: '.',
  spec_files: [
    '*.js',
  ],
  helpers: []
});

jasmine.execute();
