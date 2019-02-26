#!/bin/sh
set -e

# Mitamaeを使って構築する

case "$(uname)" in	
	"Darwin") tool/bin/mitamae local $@ ./bootstrap.rb ;;
	*) sudo -E tool/bin/mitamae local $@ ./bootstrap.rb ;;
esac
