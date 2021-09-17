FROM scrin/dev-spconv:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN add-apt-repository -r "deb [arch=amd64] https://dl.bintray.com/tetrate/getenvoy-deb focal Release "

RUN apt-get update  \
	&& apt-get install -y --no-install-recommends gsutil build-essential git ca-certificates python3-pip libboost-all-dev ffmpeg libsm6 libxext6   \
	&& rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --upgrade pip 
RUN python3 -m pip install pyyaml numpy scikit-image numba tqdm easydict tensorboardX
ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# CMake installation
RUN wget -q https://github.com/Kitware/CMake/releases/download/v3.16.4/cmake-3.16.4-Linux-x86_64.tar.gz
RUN tar -xzf cmake-3.16.4-Linux-x86_64.tar.gz --exclude=bin/cmake-gui --exclude=doc/cmake --exclude=share/cmake-3.12/Help  \
	&& cp -fR cmake-3.16.4-Linux-x86_64/* /usr  \
	&& rm -rf cmake-3.16.4-Linux-x86_64  \
	&& rm cmake-3.16.4-Linux-x86_64.tar.gz

# installing votr dependencies
RUN pip3 install waymo-open-dataset-tf-2-2-0 
RUN pip3 install wandb


# ARG USER=trainer
# ARG UID=1000
# ARG GID=1000
# # default password
# ARG PW=user 

# RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser ${USER} sudo

# WORKDIR /home/${USER}
# RUN cd /home/${USER} && mkdir -p fmf && chown -R ${UID}:${GID} ./

# USER ${UID}:${GID}
