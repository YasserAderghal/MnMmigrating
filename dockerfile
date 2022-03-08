


# pull official base image
FROM python:3.9.6-alpine

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
# install psycopg2 dependencies
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add  gcc python3-dev musl-dev \
    && apk del build-deps \
    && apk --no-cache add musl-dev linux-headers g++



# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app
RUN pip install -r requirements.txt


# copy project
COPY . .

#EXPOSE 8000
# run entrypoint.sh
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
