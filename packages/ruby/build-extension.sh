#!/bin/bash
# Wrapper script to build the native extension without bundler environment pollution.
#
# The native extension build (rb-sys) invokes ruby subprocesses that fail when
# RUBYOPT is set to auto-require bundler/setup, because bundler then tries to load
# gems with missing extensions (rbs, json, strscan, etc.).
#
# This script clears the bundler environment variables before invoking rake compile.

unset RUBYOPT
unset BUNDLE_GEMFILE
unset BUNDLE_APP_CONFIG
unset BUNDLE_BIN_PATH
unset BUNDLER_SETUP

exec rake compile "$@"
