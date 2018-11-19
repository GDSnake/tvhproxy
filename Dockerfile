FROM arm32v6/alpine

# Install core packages
RUN apk add --no-cache \
        ca-certificates \
        coreutils \
        tzdata 

# Install build packages
RUN apk add --no-cache --virtual=build-dependencies \
	build-base

# Create user
RUN adduser -H -D -S -u 99 -G users -s /sbin/nologin duser 

# Install runtime packages
RUN apk add --no-cache \
        python \
	git \
	uwsgi \
	uwsgi-python \
	python-dev \
        py2-pip

RUN pip2 install flask \
	requests \
	gevent 


# Cleanup
RUN apk del --purge build-dependencies
RUN rm -rf /var/cache/apk/* /tmp/* 

WORKDIR /opt
RUN git clone https://github.com/jkaberg/tvhProxy.git
RUN chmod +x /opt/tvhProxy/tvhProxy.py
WORKDIR tvhProxy
CMD ["python","tvhProxy.py"]
