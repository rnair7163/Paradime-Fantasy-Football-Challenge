# Dockerfile
FROM python:3.9-slim

# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    git \
    && apt-get clean

# Install dbt-core and Snowflake adapter (specific version)
RUN pip install dbt-core==1.8.0 dbt-snowflake==1.8.0

# Set working directory
WORKDIR /dbt

# Copy dbt project files
COPY ./dbt /dbt

# Default command
CMD ["dbt", "--help"]