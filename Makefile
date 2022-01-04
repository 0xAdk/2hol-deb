.PHONY: make clean clean_build clean_output

make: clean_build ; ./build_package.sh

clean: clean_build clean_output
clean_build: ; rm -rf ./build/*
clean_output: ; rm -rf ./output/*
