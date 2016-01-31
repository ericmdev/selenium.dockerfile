# Debian: Selenium 2.49 + Xvfb (Firefox, Chrome)
#
# VERSION 0.0.1

# Pull the base image.
FROM java:openjdk-8

# Set the author.
MAINTAINER Eric Mugerwa <dev@ericmugerwa.com>

# Set environment variables.
ENV SELENIUM_VERSION 2.49.1

# Acquire selenium standalone server.
RUN wget http://goo.gl/rQhaxb -O /opt/selenium-server-standalone-${SELENIUM_VERSION}.jar

# Install firefox.
RUN echo "deb http://packages.linuxmint.com debian import" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes \
	firefox
RUN chmod -R +x /opt/firefox/

# Install google-chrome-beta.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y \
	google-chrome-beta
RUN chmod -R +x /opt/google/

# Install xvfb.
RUN apt-get update && apt-get install -y \
    xvfb

# Add scripts.
ADD ./scripts/ /home/scripts

# Listen on selenium port.
EXPOSE 4444

# Configure executable.
ENTRYPOINT ["sh", "/home/scripts/start.sh"]

# Define default command.
CMD []