start:
	docker compose up --build

stop:
	docker compose down

db_files:
	mkdir -p ./data/db

db_rm:
	sudo rm -rf data/db/*

.PHONY: start stop db_rm db_files