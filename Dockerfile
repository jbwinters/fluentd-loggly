FROM fluent/fluentd:latest
MAINTAINER Josh Winters <josh+gh@idealspot.com>

RUN gem install fluent-plugin-loggly
RUN gem install fluent-plugin-forest

CMD sed -i "s/#LOGGLY_TOKEN/${LOGGLY_TOKEN}/g" /fluentd/etc/${FLUENTD_CONF} && exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
