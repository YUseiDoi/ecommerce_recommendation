FROM nvcr.io/nvidia/pytorch:21.12-py3

# TIMEZONE
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
	git \
	python3-pip \
	vim

RUN pip install --upgrade pip

COPY requirements.txt /app/
WORKDIR /app/

RUN pip3 install -r requirements.txt
ENV APP /app
