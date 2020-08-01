##
# main
#
# @file
# @version 0.1

OUT=dist/main

.PHONY: $(OUT)
$(OUT):
	@$(MAKE) -sC dist

.PHONY: run
run: $(OUT)
	 @./$^

.PHONY: clean
clean:
	@$(MAKE) -sC dist clean

# end
