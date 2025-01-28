FROM	debian:bullseye

RUN	apt update -y && apt upgrade -y

RUN	apt install python3 -y && apt install python3-pip -y

RUN	pip install --upgrade pip && pip install Django

RUN	mkdir /app

WORKDIR	/app

ENV	PYTHONDONTRUNBYTECODE=1

ENV	PYTHONBUFFERED=1

COPY	requirements.txt /app/

COPY	staticfiles/* /app/

RUN	pip install --no-cache-dir -r requirements.txt

EXPOSE	8000

ENTRYPOINT	["/bin/sh"]
