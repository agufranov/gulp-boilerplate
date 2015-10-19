var browserSync, gulp, path, watch;

gulp = require('gulp');

watch = require('gulp-watch');

path = require('path');

browserSync = require('browser-sync').create();

module.exports = function(opts) {
  gulp.task('browser-sync:serve', ['build'], function() {
    return browserSync.init({
      server: {
        baseDir: opts.paths.build
      }
    });
  });
  return gulp.task('browser-sync:watch', ['browser-sync:serve'], function() {
    return watch(path.join(opts.paths.build, '**', '*.*')).pipe(browserSync.reload({
      stream: true
    }));
  });
};
