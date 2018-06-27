# Base Image
FROM drecom/centos-ruby:2.3.3

# Changing User to root
USER root

# XVFB and Chrome driver
RUN yum -y install xorg-x10-server-Xvfb unzip wget
RUN wget https://chromedriver.storage.googleapis.com/2.39/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip && mv chromedriver /usr/bin
RUN yum -y install Xvfb

# Chrome Browser
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN yum -y install google-chrome-stable_current_x86_64.rpm
RUN yum -y install which

# Copy code to the newly created directory
RUN mkdir usr/src/app
COPY . usr/src/app

# Change the working directory
WORKDIR usr/src/app

#Installing missing gems and dependencies
RUN gem install cucumber --no-ri --no-rdoc \
	&& gem install watir-webdriver --no-ri --no-rdoc \
	&& gem install bundler \
	&& bundle install
