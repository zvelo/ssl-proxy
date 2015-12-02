IMAGE_NAME = zvelo/ssl-proxy

image: .image-stamp

.image-stamp:
	docker build -t $(IMAGE_NAME) .
	@touch .image-stamp

clean:
	@rm -f \
		.image-stamp \
		.push-stamp

push: .push-stamp

.push-stamp: .image-stamp
	docker push $(IMAGE_NAME):latest
	@touch .push-stamp

.PHONY: image clean push
