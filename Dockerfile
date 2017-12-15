FROM java:jre-alpine

MAINTAINER Scott Peper <cspeper@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip
RUN unzip stanford-corenlp-full-2017-06-09.zip && \
	rm stanford-corenlp-full-2017-06-09.zip

WORKDIR stanford-corenlp-full-2017-06-09

RUN export CLASSPATH="`find . -name '*.jar'`"

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT -password $PASSWORD -username $USERNAME
