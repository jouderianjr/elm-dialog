all: dist/Simple.html dist/Advanced.html tests.js

dist/%.html: $(shell find src examples -type f -name '*.elm' -o -name '*.js') dist
	(cd examples/ && elm make $*/App.elm --output=../$@ --optimize)

dist:
	@mkdir $@

# tests.js: FORCE $(shell find src -type f -name '*.elm' -o -name '*.js')
# 	elm make --optimize
# 	@$(MAKE) -C test

FORCE:
