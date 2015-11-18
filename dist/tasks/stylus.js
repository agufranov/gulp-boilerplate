var gulp, notify, path, plumber, sourcemaps, stylus, watch;

gulp = require('gulp');

watch = require('gulp-watch');

stylus = require('gulp-stylus');

sourcemaps = require('gulp-sourcemaps');

plumber = require('gulp-plumber');

notify = require('gulp-notify');

path = require('path');

module.exports = function(opts) {
  var onError, pipeToStylus, stylusGlob;
  onError = function(err) {
    var at, filename;
    filename = path.relative(process.cwd(), err.message.split(':')[0]);
    at = err.message.match(/:([\w]+)/)[1];
    return notify.onError({
      title: 'Stylus error',
      message: filename + ":" + at
    })(err);
  };
  stylusGlob = path.join(opts.paths.src, '**', '*.styl');
  pipeToStylus = function(p) {
    return p.pipe(plumber({
      errorHandler: onError
    })).pipe(sourcemaps.init()).pipe(stylus()).pipe(sourcemaps.write()).pipe(gulp.dest(opts.paths.build));
  };
  gulp.task('stylus:compile', function() {
    return pipeToStylus(gulp.src(stylusGlob));
  });
  return gulp.task('stylus:watch', ['stylus:compile'], function() {
    return pipeToStylus(watch(stylusGlob, {
      verbose: true,
      name: 'Stylus'
    }));
  });
};
