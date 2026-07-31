.PHONY: install validate deploy destroy cleanup

install:
	./scripts/install.sh

validate:
	./scripts/validate.sh

deploy:
	./scripts/deploy.sh

destroy:
	./scripts/destroy.sh

cleanup:
	./scripts/cleanup.sh
