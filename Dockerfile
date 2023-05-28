FROM python:3.9-slim-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install git
RUN git clone https://github.com/RichardPilbery/HSMA5-test.git

RUN apt-get -y install nano wget ca-certificates
RUN apt-get -y install gcc python3-dev build-essential

RUN cp -a HSMA5-test/. . && rm -r HSMA5-test
RUN mkdir -p -v data

RUN wget --progress=dot:mega https://github.com/stan-dev/cmdstan/releases/download/v2.32.0/cmdstan-2.32.0.tar.gz
RUN tar -zxpf cmdstan-2.32.0.tar.gz
RUN ln -s cmdstan-2.32.0 cmdstan
RUN cd cmdstan; make build

RUN pip install -r ./requirements.txt

CMD jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root