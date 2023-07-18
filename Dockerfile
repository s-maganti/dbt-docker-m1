FROM python:3.9

# Update and install system packages
# https://github.com/davidgasquez/dbt-docker/blob/master/Dockerfile
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install dbt
RUN pip install -U pip
RUN pip install dbt-redshift==1.5.4
RUN pip install markupsafe==2.0.1

# Set environment variables
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

# Run dbt
CMD ["dbt"]
