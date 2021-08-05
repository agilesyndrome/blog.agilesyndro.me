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
	aws cloudfront create-invalidation --distribution-id E23AGKMUCJGNJ9 --paths='/'

PHONY: clean, build, serve, update
