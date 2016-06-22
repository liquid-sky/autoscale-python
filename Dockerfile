FROM python:3-onbuild
MAINTAINER kpacha

COPY ./examples/mesos_ec2.py mesos_ec2.py

ENV MESOS_HOST=master.mesos
ENV MESOS_PORT=5050
ENV MESOS_ENDPOINT=/metrics/snapshot
ENV MIN_CPUS=1
ENV MAX_CPUS=3
ENV MIN_MEM=512
ENV MAX_MEM=10000
ENV MIN_DISK=1000
ENV MAX_DISK=100000
ENV EC2_REGION=us-west-2
ENV EC2_ASG="mesos-MesosSlaveStack-1AB12345ABC-ServerGroup-789XYZ789"
ENV AUTOSCALER_LOG_LEVEL=info

ENTRYPOINT [ "/bin/sh", "./run.sh" ]
