FROM fluent/fluentd:latest
MAINTAINER Josh Winters <josh+gh@idealspot.com>

RUN gem install fluent-plugin-loggly
RUN gem install fluent-plugin-forest

ENV LOGGLY_CONF loggly.conf
RUN mkdir fluentd/
COPY ${LOGGLY_CONF} /home/fluent/fluentd/${LOGGLY_CONF}
ONBUILD COPY ${LOGGLY_CONF} fluentd/${LOGGLY_CONF}

CMD sed -i "s/#LOGGLY_TOKEN/${LOGGLY_TOKEN}/g" fluentd/${LOGGLY_CONF} && exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
