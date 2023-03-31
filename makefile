all: clean install format analyze testing

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

testing:
	@echo "Testing"
	fvm flutter test