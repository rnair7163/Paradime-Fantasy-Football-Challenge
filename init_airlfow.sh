#!/bin/bash
# init_airflow.sh
# This script initializes the Airflow database and creates the admin user.

echo "Initializing Airflow DB..."
# Initialize the Airflow database
airflow db init

# Check if the admin user already exists
if ! airflow users list | grep -q "${AIRFLOW_USERNAME}"; then
  echo "Creating Airflow admin user: ${AIRFLOW_USERNAME}"
  airflow users create \
    --username "${AIRFLOW_USERNAME}" \
    --password "${AIRFLOW_PASSWORD}" \
    --firstname "Admin" \
    --lastname "User" \
    --email "code66698@gmail.com" \
    --role Admin
else
  echo "Admin user ${AIRFLOW_USERNAME} already exists."
fi

# Start the airflow webserver
exec airflow webserver