FROM centos:7

# update yum list
RUN yum -y update

# Install service
RUN yum -y install vim 
RUN yum -y install net-tools 
RUN yum -y install wget unzip
RUN yum -y --enablerepo=extras install epel-release
RUN yum -y install python-pip 
RUN yum -y install ansible 
RUN yum -y install python-lxml
RUN yum -y install git
RUN /usr/bin/pip install python-jenkins 
RUN /usr/bin/pip install PyVmomi
RUN /usr/bin/pip install ansible==2.7.10
RUN yum -y install  openssh openssh-server openssh-clients

# change time zone
RUN /bin/cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo 'Asia/Taipei' >/etc/timezone

# install terraform
RUN cd /tmp/ && /usr/bin/wget https://releases.hashicorp.com/terraform/0.12.14/terraform_0.12.14_linux_amd64.zip
RUN cd /tmp/ && /usr/bin/unzip ./terraform_0.12.14_linux_amd64.zip -d /usr/local/bin/
RUN cd /tmp/ && rm ./terraform_0.12.14_linux_amd64.zip 

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]