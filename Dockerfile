FROM beevelop/android-nodejs:latest

# This base image includes beevelop/android & beevelop/java

LABEL maintainer="am_mou@live.concordia.ca"

RUN mkdir -p /usr/app
WORKDIR /usr/app/

COPY . /usr/app

WORKDIR /usr/app

## Install yarn
RUN npm install -g yarn

## Install react native
RUN npm install -g react-native@0.44.3 && \
    npm install -g react-native-cli@2.0.1

# Clean up when done.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache verify

# Install project dependencies.
RUN npm install

# Create the src & dist directory. Point src to local folder when running container with -v $(pwd)/src:/usr/app/src.
RUN mkdir lib && \
    mkdir src

# Default react-native web server port
EXPOSE 8081

# CMD ["react-native", "run-android"]


