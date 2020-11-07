FROM python:3.7.4

RUN mkdir /systems

COPY url_monitor.py requirements.txt /systems/

RUN pip install --no-cache-dir -r /systems/requirements.txt
