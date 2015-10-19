var browserify, buffer, gulp, path, source, sourcemaps, uglify, watch;

gulp = require('gulp');

watch = require('gulp-watch');

sourcemaps = require('gulp-sourcemaps');

browserify = require('browserify');

source = require('vinyl-source-stream');

buffer = require('vinyl-buffer');

uglify = require('gulp-uglify');

path = require('path');

module.exports = function(opts) {
  var entries, makeBundle, watchGlob;
  watchGlob = path.join(opts.browserify.path, '**', '*.js');
  entries = opts.browserify.entries.map(function(p) {
    return path.join(opts.browserify.path, p);
  });
  makeBundle = function() {
    return browserify({
      entries: entries,
      debug: true
    }).bundle().pipe(source(opts.browserify.bundleName)).pipe(buffer()).pipe(sourcemaps.init({
      loadMaps: true
    })).pipe(uglify()).pipe(sourcemaps.write()).pipe(gulp.dest(opts.paths.build));
  };
  gulp.task('browserify:compile', ['coffee:compile'], makeBundle);
  return gulp.task('browserify:watch', ['build'], function() {
    return watch(watchGlob, {
      verbose: true,
      name: 'Browserify'
    }, makeBundle);
  });
};
