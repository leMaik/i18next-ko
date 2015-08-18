require 'coffee-script/register'

gulp = require 'gulp'
source = require 'vinyl-source-stream'
browserify = require 'browserify'
del = require 'del'
rename = require 'gulp-rename'

gulp.task 'clean', (cb) ->
    del ['lib/**'], cb

gulp.task 'scripts', ->
    bundler = browserify './src/i18next-ko.js',
        debug: no
        standalone: 'i18nextko'
    bundler.bundle()
    .pipe source 'i18next-ko.js'
    .pipe rename 'i18next-ko.bundle.js'
    .pipe gulp.dest './lib'

    gulp.src './src/i18next-ko.js'
    .pipe gulp.dest './lib'

gulp.task 'default', ['scripts']
