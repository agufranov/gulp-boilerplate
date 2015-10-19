var gulp, jade, notify, path, plumber, watch;

gulp = require('gulp');

watch = require('gulp-watch');

jade = require('gulp-jade');

plumber = require('gulp-plumber');

notify = require('gulp-notify');

path = require('path');

module.exports = function(opts) {
  var jadeGlob, onError, pipeToJade;
  onError = function(err) {
    var at, filename;
    filename = path.relative(process.cwd(), err.path);
    at = err.message.match(/:([\w]+)/)[1];
    return notify.onError({
      title: 'Jade error',
      message: filename + ":" + at
    })(err);
  };
  jadeGlob = path.join(opts.paths.src, '**', '*.jade');
  pipeToJade = function(p) {
    return p.pipe(plumber({
      errorHandler: onError
    })).pipe(jade()).pipe(gulp.dest(opts.paths.build));
  };
  gulp.task('jade:compile', function() {
    return pipeToJade(gulp.src(jadeGlob));
  });
  return gulp.task('jade:watch', ['build'], function() {
    return pipeToJade(watch(jadeGlob, {
      verbose: true,
      name: 'Jade'
    }));
  });
};
