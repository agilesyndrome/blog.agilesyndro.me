env:=production
HUGO ?= hugo
PUBLISH_DIR ?= docs
COMMIT_MESSAGE ?= rebuild site

clean:
	rm -rf docs

post:
	hugo new posts/$(name).md

update:
	git submodule update --remote --merge

build:
	$(HUGO) --destination $(PUBLISH_DIR) --cleanDestinationDir

publish: build
	@test -z "$$(git status --porcelain --untracked-files=all -- ':!docs')" || { echo "working tree contains non-generated changes; commit or stash them before publishing" >&2; git status --short; exit 1; }
	git add --all $(PUBLISH_DIR)
	@if git diff --cached --quiet; then \
		echo "No generated changes to commit."; \
	else \
		git commit -m "$(COMMIT_MESSAGE)"; \
	fi
	git push origin HEAD:main

serve:
	hugo server -D -v --disableFastRender

cdn:
	aws s3 sync cdn s3://cdn.agilesyndro.me/cdn.agilesyndro.me

.PHONY: clean post update build publish serve cdn

