FROM fluent/fluentd:latest
MAINTAINER Josh Winters

ENV PATH /home/fluent/.gem/ruby/2.2.0/bin:$PATH

RUN gem install fluent-plugin-loggly
RUN gem install fluent-plugin-forest

USER fluent
WORKDIR /home/fluent

COPY ${FLUENTD_CONF} /fluentd/etc/${FLUENTD_CONF}
ONBUILD COPY ${FLUENTD_CONF} /fluentd/etc/${FLUENTD_CONF}

ENV LOGGLY_CONF loggly.conf
RUN mkdir fluentd/
COPY ${LOGGLY_CONF} /home/fluent/fluentd/${LOGGLY_CONF}
RUN echo ${LOGGLY_TOKEN}
ONBUILD COPY ${LOGGLY_CONF} fluentd/${LOGGLY_CONF}

CMD echo ${LOGGLY_TOKEN} && sed "s/#LOGGLY_TOKEN/${LOGGLY_TOKEN}/g" fluentd/${LOGGLY_CONF} && cat fluentd/*.conf # && exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT
