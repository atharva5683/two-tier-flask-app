# Stage 1: Builder
FROM python:3.8 AS builder

WORKDIR /app

# Install system dependencies and upgrade pip
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/* \
    && python -m pip install --upgrade pip

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Stage 2: Final Image (Slim version)
FROM python:3.8-slim

WORKDIR /app

# Copy the installed packages from the builder stage
COPY --from=builder /usr/local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/

# Copy the application code
COPY . .

# Install minimal dependencies (e.g., libmariadb3)
RUN apt-get update \
    && apt-get install -y --no-install-recommends libmariadb3 \
    && rm -rf /var/lib/apt/lists/*

# Command to run the application
CMD ["python", "app.py"]
