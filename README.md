# MnMmigrating
MnMmigrating is a program for converting sql files to json. Built to convert dumped files from phpMyadmin (mysql) to mongo database.

Note: there's two version of this programs , one with user interface(web app) which can let you choose tables with references if they exists , and the second is a script file , it generate all possibilities.


## Prerequisites
MnMmigrating make use of this libraries.

```
django==3.2.5
sql-metadata==2.3.0
gunicorn==20.1.0
django-cors-headers==3.11.0
```

## Install
This application is developed and tested on "linux".
### Run directly

You can run this project directly by:
```
$ virtualenv mnmmigrating
(mnmmigrating)$ cd mnmmigrating && source ./bin/activate
(mnmmigrating)$ git clone git@github.com:YasserAderghal/MnMmigrating.git
(mnmmigrating)$ cd MnMmigrating && pip install -r requirements.txt
(mnmmigrating)$ gunicorn MnMmigrating.wsgi
```
port used 8000

### run using docker (preferable)
```
$ git clone git@github.com:YasserAderghal/MnMmigrating.git && cd MnMmigrating
$ docker-compose build
$ docker-compose up
```
port used 1300 
## Usage
Before you interact with the application , if you're not using docker . You should turn debug on , to do so :
```
(mnmmigrating)$ cd MnMmigrating && vi settings.py 

```
And change debug from false to true.
```
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True 
```


Three steps to get your results:
* First page: upload sql file (it must be dumped from phpMyadmin).
* Second page: it will show you tables in database.
    - if you didn't select any table , your json files would be just collection without any reference to other collection , otherwise , the selected table should result a json file with reference to other tables if it exists.
* Third page : download a zip file contains json files.

