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

cdn:
	aws s3 sync cdn s3://cdn.agilesyndro.me/cdn.agilesyndro.me

.PHONY: cdn

