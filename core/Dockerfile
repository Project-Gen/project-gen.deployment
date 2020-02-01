FROM node:13.7-slim

ARG root_dir=/app
ENV ROOT_DIR $root_dir

WORKDIR $root_dir

RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y nginx python build-essential && \
  apt autoremove -y

COPY nginx.conf /etc/nginx/sites-available/core.conf
RUN ln /etc/nginx/sites-available/core.conf /etc/nginx/sites-enabled/core.conf
RUN rm -r /var/www/html
RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
RUN mkdir $root_dir/logs

WORKDIR $root_dir/core
COPY code/package.json .
RUN npm i
COPY code .

WORKDIR $root_dir
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/bin/sh", "-c", "$ROOT_DIR/entrypoint.sh"]

VOLUME $root_dir/logs

EXPOSE 80
