# pull the official base image
FROM python:3.7.4
RUN  apt-get update && apt-get upgrade -y && apt-get install -y supervisor unzip

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
