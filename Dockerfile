FROM python:3.12.3-alpine3.18

WORKDIR /app

RUN pip install flask boto3 pillow

COPY . /app

EXPOSE 81

CMD [ "app.py" "python" ]