# # pull the official base image
# FROM python:3.7.4
# RUN  apt-get update && apt-get upgrade -y && apt-get install -y supervisor unzip

# # set work directory
# WORKDIR /usr/src/app

# # set environment variables
# ENV LANG C.UTF-8

# # install dependencies
# RUN pip install --upgrade pip 
# COPY ./requirements.txt /usr/src/app
# RUN pip install -r requirements.txt

# # copy project
# COPY . /usr/src/app

# EXPOSE 8101

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8101"]


FROM python:3.7.4
RUN apt-get -q update && apt-get clean && apt-get install -y supervisor unzip nginx && rm -rf /var/lib/apt/lists/*
ENV LANG C.UTF-8
RUN wget -O ngccli_cat_linux.zip https://ngc.nvidia.com/downloads/ngccli_cat_linux.zip && unzip -o ngccli_cat_linux.zip && chmod u+x ngc && mv ngc /usr/bin/
RUN pip install --upgrade virtualenv
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY supervisor-app.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /appWORKDIR /app
ADD requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
ADD . /app
EXPOSE 8101
CMD ["supervisord", "-n"]

