#### To run:

```
docker run -p 24224:24224 -e LOGGLY_TOKEN=$LOGGLY_TOKEN myfluentd:latest
docker run -p 24224:24224 -e LOGGLY_TOKEN=$LOGGLY_TOKEN -e LOGGLY_CONF=$LOGGLY_CONF myfluentd:latest
```
(where `$LOGGLY_CONF` is a loggly-specific configuration file)

#### To test:

```
docker run --log-driver=fluentd --log-opt fluentd-address=$FLUENTD_HOST:24224 hello-world
```
