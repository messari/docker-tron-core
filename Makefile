build:
	cd Odyssey-v3.1.1 && docker build -t messari/tron-core:Odyssey-v3.1.1 .
	docker tag messari/tron-core:Odyssey-v3.1.1 messari/tron-core:latest

push:
	docker push messari/tron-core:Odyssey-v3.1.1
	docker push messari/tron-core:latest
