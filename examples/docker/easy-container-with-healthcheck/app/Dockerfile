FROM python:3.8.2-alpine

COPY . /app

WORKDIR /app

RUN apk add curl --no-cache && pip install -r requirements.txt

CMD ["python", "app.py"]:
