FROM alpine:3.7

EXPOSE 8118 9050

RUN apk --no-cache --update add privoxy tor runit tini

COPY service /etc/service/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["tini", "--", "/entrypoint.sh"]
CMD ["runsvdir", "/etc/service"]
