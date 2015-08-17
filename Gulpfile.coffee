require 'coffee-script/register'

gulp = require 'gulp'
source = require 'vinyl-source-stream'
browserify = require 'browserify'
del = require 'del'

gulp.task 'clean', (cb) ->
    del ['lib/**'], cb

gulp.task 'scripts', ->
    bundler = browserify './src/i18next-ko.js',
        debug: no
        standalone: 'i18nextko'
    bundler.bundle()
    .pipe source 'i18next-ko.js'
    .pipe gulp.dest './lib'

gulp.task 'default', ['clean', 'scripts']
