IMG = uochan/jupyter
NAME = jupyter
NOTEBOOKS = $$HOME/Dropbox/jupyter
IP = $(shell docker-machine ip default)

.PHONY: all run test bash open clean

all:
	docker build --rm -t $(IMG) .

run:
	docker run --rm \
		--name $(NAME) \
		-p 8888:8888 \
		-v "$(NOTEBOOKS):/notebooks" \
		$(IMG)

test:
	docker build --rm -t $(IMG)test -f Dockerfile.test .

testrun:
	docker run --rm \
		--name $(NAME) \
		-p 8888:8888 \
		-v "$(NOTEBOOKS):/notebooks" \
		$(IMG)test

bash:
	docker run --rm -it \
		-v "$(NOTEBOOKS):/notebooks" \
		$(IMG) \
		bash

open:
	open "http://$(IP):8888"

clean:
	docker images | grep none | awk '{print $$3}' | xargs docker rmi
