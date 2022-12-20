install: # Install dependencies
	bundle install
lint: # Check code offences
	bundle exec rubocop
test: # Run tests
	bundle exec rake test

.PHONY: test
