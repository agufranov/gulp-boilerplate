var gulp = require('../index.js'); 
settings = {
  paths: {
    src: './src',
    build: './dist'
  },
  browserify: {
    path: './.bfy',
    entries: ['js/app.js'],
    bundleName: 'bundle/all.js'
  }
}

gulp(settings);
