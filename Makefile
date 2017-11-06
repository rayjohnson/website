# Makefile

# Set this to view drafts when viewing locally - remove to see what will be published
DRAFTS := -D

publish:  ## Publish the website into the rayjohnson.github.io repository
	@hugo
	@cd public; \
		git add .; \
		git commit -m "rebuilding site: `date`"; \
		git push; \
		cd ..


server.PID:
	@hugo server $(DRAFTS) --disableFastRender --quiet  & echo $$! > $@;

.PHONY: start 
start: server.PID ## Start the hugo server for local viewing

.PHONY: stop
stop: server.PID  ## Stop the hugo server
	@kill `cat $<` && rm $<

.PHONY: help
help:   ## Display this help message
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
