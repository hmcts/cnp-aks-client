.DEFAULT=build

build:
	docker build --no-cache -t hmcts/cnp-aks-client-dev .
