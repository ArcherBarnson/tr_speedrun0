#build from debian penultimate
FROM	debian:bullseye

RUN	apt update -y && apt upgrade -y

#install python and pip since we're not building from a
#	python runtime image, upgrade, then install django
RUN	apt install python3 -y && apt install python3-pip -y

RUN	pip install --upgrade pip && pip install Django

#path unclear, needs clarification overall
RUN	mkdir /app

WORKDIR	/app

#don't let python write or execute binary on disk (security duh)
ENV	PYTHONDONTRUNBYTECODE=1

#don't display stderr
ENV	PYTHONBUFFERED=1

#this is how you install dependencies with pip
COPY	requirements.txt /app/

#app files that will be served (copied) to the front
#	(through WAF container i suppose)
COPY	staticfiles/* /app/

RUN	pip install --no-cache-dir -r requirements.txt

EXPOSE	8000
#this is not how it works but i don't care for now
ENTRYPOINT	["/bin/sh"]
