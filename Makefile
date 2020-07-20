##
# main
#
# @file
# @version 0.1

OUT=dist/main

.PHONY: run
run: $(out)
   $(MAKE) build
   ./$^

.PHONY: build
build:
  @cd dist; make;

# end
