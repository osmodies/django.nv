# FROM python base image
FROM python:3-alpine3.15

# COPY startup script
COPY . /app

WORKDIR /app

RUN apk add --no-cache gawk=5.0.1-r0 sed=4.7-r0 bash=5.0.11-r1 grep=3.3-r0 bc=1.07.1-r1 coreutils=8.31-r0
RUN pip install -r requirements.txt
RUN chmod +x reset_db.sh && bash reset_db.sh

# EXPOSE port 8000 for communication to/from server
EXPOSE 8000

# CMD specifies the command to execute container starts running.
CMD ["/app/run_app_docker.sh"]
