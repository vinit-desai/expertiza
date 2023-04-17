FROM ruby:2.4

# Copy the application files to the container
COPY . /app

# Set the working directory to the application directory
WORKDIR /app

# Install required dependencies
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_14.x | sh -
RUN apt-get install -y nodejs
RUN npm install -g bower
RUN bower install --allow-root
RUN gem install rspec
RUN apt-get install -y openjdk-11-jdk

# Set the JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Install Ruby dependencies
RUN gem install rjb -v '1.6.5' --source 'https://rubygems.org/'
RUN bundle install
RUN bundle config set --local path 'vendor/cache'

# ENTRYPOINT ["/bin/bash","docker_entrypoint.sh"]
CMD ["bash"]