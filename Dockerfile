FROM centos:7
MAINTAINER Ruban Matvey <ruban.matvey@mail.ru>

ENV HomeDir=/opt/app
ENV FLASK_APP=js_example

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y install python3 \
    python-pip

COPY . $HomeDir
RUN pip install -e $HomeDir

EXPOSE 5000
CMD flask run --host=0.0.0.0
