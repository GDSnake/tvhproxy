# 54cr4m3n70/tvhproxy
Tvhproxy is a small flask app to proxy requests between Plex Media Server and Tvheadend.



# Full Description

## About

This is a small proxy to use Plex DVR and Live TV with your Tvheadend server. This Container based on Alpine Linux.

Based to chvb/docker-tvhproxy and kiall/docker-tvhProxy.

Works in Raspberry Pi Zero

### Usage
```
docker create \
  --name tvhproxy \
  --net=host \
  -e TVH_TUNER_COUNT=<count> \
  -e TVH_PROFILE=<profile> \
  -e TVH_URL=<url> \
54cr4m3n70/tvhproxy
```
  
### Parameters

* --net=host - Shares host networking with container, required.
* -e TVH_TUNER_COUNT
* -e TVH_PROFILE
* -e TVH_URL


Setting up the application
IMPORTANT... THIS IS THE arm32v6 VERSION

Webui can be found at <your-ip>:5004
