FROM python:alpine

EXPOSE 5000

WORKDIR /app

COPY . .

RUN apk add curl --no-cache && pip install -r requirements.txt

CMD ["python", "app.py"]