#### To run:

```
docker run -p 24224:24224 -e LOGGLY_TOKEN=$LOGGLY_TOKEN myfluentd:latest
```

#### To test:

```
docker run --log-driver=fluentd --log-opt fluentd-address=$FLUENTD_HOST:24224 hello-world
```
