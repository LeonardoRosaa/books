all: clean install format analyze test

clean:
	@echo "Cleaning"
	fvm flutter clean

install:
	@echo "Installing dependencies"
	fvm flutter pub get

format:
	@echo "Formatting files"
	fvm flutter format .

analyze:
	@echo "Analyzing files"
	fvm flutter analyze

test:
	@echo "Testing"
	fvm flutter test