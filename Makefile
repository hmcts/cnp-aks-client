.DEFAULT=build

build:
	docker build --no-cache -t hmcts/cnp-aks-client-dev .

run:
	docker run -it --rm hmcts/cnp-aks-client-dev sh
