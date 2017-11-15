# Makefile

# Set this to view drafts when viewing locally - remove to see what will be published
DRAFTS := -D
PID_FILE := .server.PID

publish:  ## Publish the website into the rayjohnson.github.io repository
	@hugo
	@cd public; \
		git add .; \
		git commit -m "rebuilding site: `date`"; \
		git push; \
		cd ..


$(PID_FILE):
	@hugo server $(DRAFTS) --disableFastRender --quiet  & echo $$! > $(PID_FILE)

.PHONY: start 
start: $(PID_FILE) ## Start the hugo server for local viewing

.PHONY: stop
stop: $(PID_FILE)  ## Stop the hugo server
	@-kill `[[ -f $(PID_FILE) ]] && cat $(PID_FILE)` 2>/dev/null || true
	@rm $(PID_FILE)
  
.PHONY: help
help:   ## Display this help message
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
