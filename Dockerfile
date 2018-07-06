# Base image with selenium and firefox
FROM selenium/standalone-firefox

# Change the User to Root
USER root

# Install Ruby version 2.3.3
RUN \
  apt-get update && apt-get install -y --no-install-recommends --no-install-suggests curl bzip2 build-essential libssl-dev libreadline-dev zlib1g-dev && \
  rm -rf /var/lib/apt/lists/* && \
  curl -L https://github.com/sstephenson/ruby-build/archive/v20180329.tar.gz | tar -zxvf - -C /tmp/ && \
  cd /tmp/ruby-build-* && ./install.sh && cd / && \
  ruby-build -v 2.3.3 /usr/local && rm -rfv /tmp/ruby-build-* && \
  gem install bundler --no-rdoc --no-ri


# Install Gecko Driver for Firefox Browser
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.21.0/geckodriver-v0.21.0-linux64.tar.gz \
  && tar -xvzf geckodriver* \
  && chmod +x geckodriver \
  && mv geckodriver /usr/local/bin/ \
  && rm geckodriver-v0.21.0-linux64.tar.gz

# Create a new directory
RUN mkdir usr/src/app

# Copy Source Code to the newly created directory
COPY . usr/src/app

# Change the working directory
WORKDIR usr/src/app

# Installing missing gems and dependencies
RUN gem install cucumber --no-ri --no-rdoc \
	&& gem install watir-webdriver --no-ri --no-rdoc \
	&& gem install selenium-webdriver --no-ri --no-rdoc \
	&& bundle install


# Start container by below command
# docker container run -d --name custom_name -v /dev/shm:/dev/shm --privileged image_name