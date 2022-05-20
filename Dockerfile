FROM circleci/node:13.8.0

## Step 1:
WORKDIR /app

## Step 2:
COPY . artifact.tar.gz /app/

## Step 3:
RUN sudo npm install pm2 -g
RUN sudo tar -xvf artifact.tar.gz
RUN cd backend
RUN ls -la

## Step 4:
EXPOSE 3030

## Step 5:
CMD ["cd", "backend", "&&", "pm2", "start", "npm -- start"]