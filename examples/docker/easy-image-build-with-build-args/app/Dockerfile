ARG PYTHON_IMAGE=alpine
FROM python:$PYTHON_IMAGE

EXPOSE 5000

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ARG TERRAFORM
ENV TERRAFORM=$TERRAFORM

CMD python app.py
