FROM python:3.9-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install git
RUN git clone https://github.com/RichardPilbery/HSMA5-test.git

RUN apt-get -y install nano
RUN apt-get -y install gcc python3-dev

RUN cp -a HSMA5-test/. . && rm -r HSMA5-test
RUN mkdir -p -v data

RUN pip install -r ./requirements.txt

CMD jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root