FROM python:3.10-alpine3.15

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1


RUN pip install --upgrade pip

WORKDIR /app
# RUN mkdir static
#
COPY . /app
# COPY /transfiguration_data/static/ /app/static/

# ENV STATIC_URL /static/
# ENV STATIC_ROOT /app/static

RUN pip install -r requirements.txt

EXPOSE 8000

RUN python manage.py collectstatic --noinput

# CMD ["sh", "-c", "python manage.py collectstatic --noinput"]

# FROM python:3.8.10-slim
#
# RUN mkdir /app
# WORKDIR app
#
# ADD requirements.txt /app/
# RUN pip install -r requirements.txt
# ADD . /app/
#
# RUN pip3 install -r requirements.txt
#
#
# CMD gunicorn poker_stats_data.wsgi:application -b 0.0.0.0:8000
