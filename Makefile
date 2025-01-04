# Makefile

# Build and run the dbt container
dbt-docker:
	docker-compose up -d dbt
	docker logs -f dbt-container

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