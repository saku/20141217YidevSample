var gulp = require('gulp');
var handlebars;
var concat;
var defineModule;
var declare;

try {
  handlebars = require('gulp-handlebars');
  concat = require('gulp-concat');
  defineModule = require('gulp-define-module');
  declare = require('gulp-declare');
} catch (e) {
  console.log('Some plugin is missing! see gulpfile.js and install missing plugins.');
  console.log('');
  return;
}

gulp.task('templates', function() {
  var sourceDir = './JavascriptTestSample/www_resources/templates/';
  var targetDir = './JavascriptTestSample/www/templates/';

  gulp.src(sourceDir + '/*.hbs')
    .pipe(handlebars())
    .pipe(defineModule('plain'))
    .pipe(declare({
      namespace: 'Handlebars.templates'
    }))
    .pipe(concat('template.js'))
    .pipe(gulp.dest(targetDir));
});

gulp.task('watch', function() {
  gulp.watch('./Retty/www_resouces/templates/**', ['templates']);
})

gulp.task('default', ['templates']);
