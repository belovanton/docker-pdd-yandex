FROM ubuntu
MAINTAINER Anton Belov anton4@bk.ru

RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && apt-get clean && \
	apt-get -y install \	
	python-setuptools python-software-properties software-properties-common && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php5-5.6 && \
	apt-get update && \
	apt-get -y -f install \
	php5.6 php-curl php-cli &&\
        apt-get clean && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /download/directory

WORKDIR /

ADD ./start.sh /start.sh
ADD ./pdd_yandex_control/pdd_create.php /pdd_create.php
ADD ./pdd_yandex_control/pdd_delete.php /pdd_delete.php
ADD ./pdd_create /usr/local/bin/pdd_create
ADD ./pdd_delete /usr/local/bin/pdd_delete

CMD ["/start.sh"]
