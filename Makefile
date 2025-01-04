# Makefile

dbt-docker:
	docker-compose up -d dbt
	@echo "Waiting for dbt container to be ready..."
	sleep 5 # Wait for a few seconds to ensure the container is up
	docker exec -it dbt-container bash

# Build and start Airflow locally
local-airflow:
	docker-compose up -d airflow-webserver airflow-scheduler
	@echo "Airflow webserver available at http://localhost:8080"
	docker logs -f airflow-webserver

# Stop all services
stop:
	docker-compose down

# Rebuild all images
rebuild:
	docker-compose build