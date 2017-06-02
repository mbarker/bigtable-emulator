FROM centos:7

RUN yum update -y python2
RUN yum install -y wget
RUN yum install -y which
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-157.0.0-linux-x86_64.tar.gz
RUN tar -xvf google-cloud-sdk-157.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh --quiet
RUN yes | ./google-cloud-sdk/bin/gcloud components update beta
RUN yes | ./google-cloud-sdk/bin/gcloud components install bigtable

EXPOSE 8080

ENTRYPOINT ./google-cloud-sdk/bin/gcloud beta emulators bigtable start --host-port=0.0.0.0:8080