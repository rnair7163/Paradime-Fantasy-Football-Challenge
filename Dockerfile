# Start from an official Python base image
FROM python:3.9.0

# Set the working directory inside the container (relative to where dbt files are)
WORKDIR /fantasy-football-challenge/dbt

# Install dbt 1.8 and Snowflake adapter
RUN pip3 install --upgrade pip \
    && pip3 install mashumaro==3.11 \
    && pip3 install dbt-core==1.8.7 dbt-snowflake mashumaro

# Copy the dbt files into the container
COPY ./dbt /fantasy-football-challenge/dbt

# Install any additional dependencies if needed (optional)
# COPY requirements.txt /fantasy-football-challenge/dbt/requirements.txt
# RUN pip install -r /fantasy-football-challenge/dbt/requirements.txt

# Set the entrypoint to run dbt commands
# ENTRYPOINT ["dbt"]

# Keep container running
CMD tail -f /dev/null