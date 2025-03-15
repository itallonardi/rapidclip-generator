FROM python:3.12-slim

RUN apt-get update && apt install ffmpeg -y

RUN python3 -m pip install --upgrade pip

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/
