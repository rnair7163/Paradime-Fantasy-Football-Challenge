# Start from an official Python base image
FROM python:3.9-slim

# Set the working directory inside the container (relative to where dbt files are)
WORKDIR /fantasy-football-challenge/dbt

# Install dbt 1.8 and Snowflake adapter
RUN pip install dbt==1.8.0 dbt-snowflake

# Copy the dbt files into the container
COPY ./dbt /fantasy-football-challenge/dbt

# Install any additional dependencies if needed (optional)
# COPY requirements.txt /fantasy-football-challenge/dbt/requirements.txt
# RUN pip install -r /fantasy-football-challenge/dbt/requirements.txt

# Set the entrypoint to run dbt commands
ENTRYPOINT ["dbt"]