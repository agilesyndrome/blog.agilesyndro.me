env:=production

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

push:
	aws s3 cp docs s3://cdn.agilesyndro.me/agilesyndro.me/$(env) --recursive

PHONY: clean, build, serve, update
