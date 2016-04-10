IMG = uochan/jupyter
NOTEBOOKS = $$HOME/Dropbox/jupyter

.PHONY: all run test bash clean

all:
	docker build --rm -t $(IMG) .

run:
	docker run --rm \
		-p 8888:8888 \
		-v "$(NOTEBOOKS):/notebooks" \
		$(IMG)

bash:
	docker run --rm -it \
		-p 8888:8888 \
		-v "$(NOTEBOOKS):/notebooks" \
		$(IMG) \
		bash

clean:
	docker images | grep none | awk '{print $$3}' | xargs docker rmi
