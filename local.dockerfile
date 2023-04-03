FROM ruby:2.4

COPY . /app
WORKDIR /app

RUN /bin/sh docker_setup.sh

# Update the package index and install dependencies
RUN apt-get update 
RUN apt-get install -y openjdk-11-jdk

# Set the JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN gem install rjb -v '1.6.5' --source 'https://rubygems.org/'

RUN bundle update
RUN bundle install
RUN bundle config set --local path 'vendor/cache'
ENTRYPOINT ["/bin/bash","docker_entrypoint.sh"]