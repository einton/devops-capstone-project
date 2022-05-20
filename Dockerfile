FROM circleci/node:13.8.0

## Step 1:
WORKDIR /app/backend

ARG TYPEORM_CONNECTION
ARG TYPEORM_DATABASE
ARG TYPEORM_ENTITIES
ARG TYPEORM_HOST
ARG TYPEORM_MIGRATIONS
ARG TYPEORM_MIGRATIONS_DIR
ARG TYPEORM_PASSWORD
ARG TYPEORM_PORT
ARG TYPEORM_USERNAME

ENV TYPEORM_CONNECTION=${TYPEORM_CONNECTION}
ENV TYPEORM_DATABASE=${TYPEORM_DATABASE}
ENV TYPEORM_ENTITIES=${TYPEORM_ENTITIES}
ENV TYPEORM_HOST=${TYPEORM_HOST}
ENV TYPEORM_MIGRATIONS_DIR=${TYPEORM_MIGRATIONS_DIR}
ENV TYPEORM_PASSWORD=${TYPEORM_PASSWORD}
ENV TYPEORM_PORT=${TYPEORM_PORT}
ENV TYPEORM_USERNAME=${TYPEORM_USERNAME}

## Step 2:
COPY . artifact.tar.gz /app/

## Step 3:
RUN cd /app
RUN ls -la
RUN sudo npm install pm2 -g
RUN sudo tar -xvf artifact.tar.gz
RUN cd backend


## Step 4:
EXPOSE 3030

## Step 5:
CMD ["pm2-runtime", "start", "npm -- start"]