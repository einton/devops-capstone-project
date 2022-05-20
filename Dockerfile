FROM circleci/node:13.8.0

## Step 1:
WORKDIR /app

## Step 2:
COPY . artifact.tar.gz /app/

## Step 3:
RUN sudo npm install pm2
RUN tar -xvf artifact.tar.gz
RUN sudo npm install
RUN sudo pm2 stop default

## Step 4:
EXPOSE 9090

## Step 5:
CMD ["pm2", "start", "npm -- start"]