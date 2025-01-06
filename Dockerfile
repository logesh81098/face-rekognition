FROM python:3.9-slim

WORKDIR /app

COPY template/ /app/templates/

COPY requirements.txt /app/requirements.txt

COPY app.py /app/app.py

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 81

ENV FLASK_ENV=development

CMD [ "python", "app.py" ]