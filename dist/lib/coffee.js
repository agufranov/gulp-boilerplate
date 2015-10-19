var coffee, gulp, notify, path, plumber, sourcemaps, watch;

gulp = require('gulp');

watch = require('gulp-watch');

coffee = require('gulp-coffee');

sourcemaps = require('gulp-sourcemaps');

plumber = require('gulp-plumber');

notify = require('gulp-notify');

path = require('path');

module.exports = function(opts) {
  var coffeeGlob, onError, pipeToCoffee;
  onError = function(err) {
    var at, filename;
    filename = path.relative(process.cwd(), err.filename);
    at = err.location.first_line + 1;
    return notify.onError({
      title: err.name + " [" + err.message + "]",
      message: filename + ":" + at
    })(err);
  };
  coffeeGlob = path.join(opts.paths.src, '**', '*.coffee');
  pipeToCoffee = function(p) {
    return p.pipe(plumber({
      errorHandler: onError
    })).pipe(sourcemaps.init()).pipe(coffee({
      bare: true
    })).pipe(sourcemaps.write()).pipe(gulp.dest(opts.browserify.path));
  };
  gulp.task('coffee:compile', function() {
    return pipeToCoffee(gulp.src(coffeeGlob));
  });
  return gulp.task('coffee:watch', ['compile'], function() {
    return pipeToCoffee(watch(coffeeGlob, {
      verbose: true,
      name: 'Coffee'
    }));
  });
};
