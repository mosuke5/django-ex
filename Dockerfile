FROM python:3.8.10-alpine3.13
ENV PYTHONUNBUFFERED 1
RUN apk --update add python3-dev py-configobj libusb py-pip gcc linux-headers musl-dev postgresql-dev
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/
RUN python manage.py collectstatic --noinput
CMD ["python", "manage.py", "runserver"]
