FROM python:3.8 AS builder 

WORKDIR /app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/* \
    && python -m pip install --upgrade pip 

COPY requirements.txt . 

RUN python3 -m pip install mysqlclient \
    && python3 -m pip install --no-cache-dir -r requirements.txt

FROM python:3.8-slim

WORKDIR /app
COPY --from=builder /usr/local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/
RUN apt-get update \
    && apt-get install -y --no-install-recommends libmariadb3 \
    && rm -rf /var/lib/apt/lists/*

COPY . .

CMD ["python","app.py"]


