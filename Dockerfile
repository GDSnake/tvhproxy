FROM ubuntu:20.04

RUN apt update && apt install --no-install-recommends --yes git python3 python3-pip

RUN update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1

EXPOSE 5004

WORKDIR /opt
RUN git clone https://github.com/GDSnake/tvhProxyMain.git
RUN chmod +x /opt/tvhProxyMain/tvhProxy.py

WORKDIR /opt/tvhProxyMain

RUN rm -rf /var/cache/apt/* /tmp/* /var/lib/{apt,dpkg,cache,log} 

RUN apt-get clean autoclean
RUN apt-get autoremove --yes


RUN pip3 install setuptools wheel

RUN pip3 install -r requirements.txt

CMD ["python","tvhProxy.py"]
