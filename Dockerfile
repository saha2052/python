# pull the official base image
FROM python:3.8.3-alpine
RUN apt-get -q update && apt-get clean && apt-get install -y supervisor unzip nginx && rm -rf /var/lib/apt/lists/*

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV LANG C.UTF-8

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

# copy project
COPY . /usr/src/app

EXPOSE 8101

CMD ["python", "manage.py", "runserver", "0.0.0.0:8101"]
