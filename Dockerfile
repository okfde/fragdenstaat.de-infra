FROM ubuntu:trusty
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && apt-get update
RUN apt-get install -y git-core python-pip build-essential python-dev libevent1-dev libxml2-dev libxslt-dev libpq-dev -y
RUN easy_install pip
RUN mkdir /code
ADD fragdenstaat_de/requirements.txt /tmp/requirements.txt
RUN pip install -U -r /tmp/requirements.txt
ADD froide /code/froide
ADD fragdenstaat_de /code/fragdenstaat_de
WORKDIR /code/fragdenstaat_de
RUN cd /code/froide && python setup.py develop
ENV DJANGO_SETTINGS_MODULE fragdenstaat_de.settings
ENV DJANGO_CONFIGURATION Dev
EXPOSE 8000
CMD gunicorn -b 0.0.0.0:8000 froide.wsgi
