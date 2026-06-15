.PHONY: run build install clean

run:
	npm run dev

build:
	npm run build

install:
	npm install

clean:
	rm -rf public resources
