'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
const autoprefixer = require('autoprefixer');
const postcss = require('gulp-postcss');
const prettier = require('gulp-prettier');
var sorting = require('postcss-sorting');
var sourcemaps = require('gulp-sourcemaps');
const cleanCSS = require('gulp-clean-css');


sass.compiler = require('node-sass');

// The sass/scss to css gulp option says it's obselute and to be honest ... the vscode autocompiler addon for scss works fine

gulp.task('compile', function(){
  var plugin = [
    // PostCSS Plugins
    autoprefixer,
    sorting
  ];

  return gulp.src('./universalSCSS/**/*.scss')
    .pipe(sourcemaps.init())
    .pipe(sass()) // Using gulp-sass
    .pipe(postcss(plugin))
    .pipe(prettier({}))
    .pipe(cleanCSS({colors: 'true', format: 'beautify'}))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('./universalCSS'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./sass/**/*.scss', ['sass']);
});
