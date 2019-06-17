clean:
	rm -rf docs

post:
	hugo new posts/$(name).md

update:
	git submodule update --remote --merge

build:
	hugo

serve:
	hugo server -D -b http://blawg.agilesyndro.me:1313 -v --disableFastRender

PHONY: clean, build, serve, update
