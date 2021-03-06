FROM clojure:openjdk-8-lein-2.8.3-alpine
RUN mkdir -p /usr/src/app/resources
VOLUME /usr/src/app/resources
WORKDIR /usr/src/app
COPY project.clj /usr/src/app
RUN lein deps
COPY . /usr/src/app
RUN mv "$(lein uberjar | sed -n 's/^Created \(.*standalone\.jar\)/\1/p')" app-standalone.jar
CMD ["java", "-jar", "app-standalone.jar"]
