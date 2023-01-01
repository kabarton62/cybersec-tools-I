FROM wfarn86/python2_requests:latest
RUN apt update && apt -y install locales nano && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
CMD pip install sh
