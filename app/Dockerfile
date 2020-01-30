FROM ubuntu:19.04

ARG root_dir=/app
ENV ROOT_DIR=$root_dir

WORKDIR $root_dir

RUN apt update && apt upgrade -y && \
  apt install -y nginx && \
  apt clean

COPY nginx.conf /etc/nginx/sites-available/app.conf
RUN ln /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf
RUN rm -r /var/www/html
RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
RUN mkdir $root_dir/logs

WORKDIR $root_dir/www
COPY code .

WORKDIR $root_dir
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/bin/sh", "-c", "$ROOT_DIR/entrypoint.sh"]

VOLUME $root_dir/logs

EXPOSE 80
