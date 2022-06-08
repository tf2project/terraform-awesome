FROM alpine:latest

#Setting a default value to Arguments USER and CLASS in main.tf file.
ARG USER
ARG CLASS
RUN echo "Welcome $USER, to $CLASS class!!!" > message.txt
CMD cat message.txt