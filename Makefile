clean:
	rm -rf docs

build:
	hugo


deploy:
	echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
	git add .
	git commit -S -m "rebuilding site `date`"
	git push origin master

PHONY: clean, build, deploy
