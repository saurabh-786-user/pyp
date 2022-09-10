FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /my-dir

## Step 2:
# Copy source code to working directory
RUN mkdir model_data
ADD model_data/ /my-dir/
COPY app.py /my-dir
COPY make_prediction.sh /my-dir
COPY Makefile /my-dir
COPY requirements.txt /my-dir
COPY run_docker.sh /my-dir

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install -r /my-dir/requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
RUN chmod +x run_docker.sh
RUN ./run_docker.sh

