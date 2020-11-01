FROM python:3.7.4

RUN mkdir /P9-systems

COPY url_monitor.py requirements.txt /P9-systems/

RUN pip install --no-cache-dir -r /P9-systems/requirements.txt
