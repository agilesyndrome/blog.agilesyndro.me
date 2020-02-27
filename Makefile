clean:
	rm -rf docs

post:
	hugo new posts/$(name).md

update:
	git submodule update --remote --merge

build:
	hugo

serve:
	hugo server -D -v --disableFastRender

PHONY: clean, build, serve, update
