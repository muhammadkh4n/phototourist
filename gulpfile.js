/*jslint node: true */
"use strict";

var gulp = require('gulp');

// gulp flow control
var gulpif = require('gulp-if');
var sync = require('gulp-sync')(gulp);
// build tools
var del = require('del');
var debug = require('gulp-debug');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var replace = require('gulp-replace');
// dist minification
var useref = require('gulp-useref');
var uglify = require('gulp-uglify');
var cssMin = require('gulp-clean-css');
var htmlMin = require('gulp-htmlmin');
// runtime tools
var browserSync = require('browser-sync').create();
