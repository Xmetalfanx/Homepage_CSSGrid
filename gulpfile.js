var gulp = require('gulp');
var autoprefixer = require('autoprefixer');
const prettier = require('gulp-prettier');

// The sass/scss to css gulp option says it's obselute and to be honest ... the vscode autocompiler addon for scss works fine

// Runs Prettier on the CSS file
gulp.task('prettier', () => {
  return gulp.src('/universalSCSS/*.css')
    .pipe(prettier({ singleQuote: true }))
    .pipe(gulp.dest('/universalCSS'));
});
