FROM centos:7
LABEL maintainer="Jayanth C A <jaimyname@gmail.com>"
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm &&\
    yum update -y &&\
    yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN pip3 install virtualenv && virtualenv -p python3 /wagtail
WORKDIR /
RUN source /wagtail/bin/activate && pip install wagtail gunicorn psycopg2-binary && ln -s /wagtail/bin/wagtail /usr/bin/wagtail && ln -s /wagtail/bin/gunicorn /usr/bin/gunicorn
RUN /usr/bin/wagtail start blogsite
WORKDIR /blogsite
COPY settings.py /blogsite/blogsite/settings/base.py
COPY init.sh /blogsite/init.sh
RUN chmod +x init.sh
RUN source /wagtail/bin/activate &&\
    pip install -r requirements.txt

RUN useradd wagtail
RUN chown -R wagtail /blogsite
USER wagtail

EXPOSE 8000
CMD ["./init.sh"]

