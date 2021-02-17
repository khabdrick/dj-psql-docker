#Dockerfile


# The image you are going to inherit your dockerfile from
FROM python:3.7-alpine

# Necessary so docker doesn't buffer the output and that you can see the output of your application (e.g. django logs) in real time.
ENV PYTHONUNBUFFERED 1

#copy the requirements.txt file adjacent to the Dockerfile to the our docker image requirements.txt
COPY ./requirements.txt /requirements.txt


      
# Istall requirements.txt file in docker image
RUN pip install -r /requirements.txt

# make directory in our docker image in which we can use to store our source code
RUN mkdir /app
WORKDIR /app

# Copies from our local machine the app folder to the app folder in the docker image
COPY ./app /app

# Create user that can run our image on docker
RUN adduser -D user

USER user