# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# tensorflow    latest (pip)
# keras         latest (pip)
# ==================================================================

FROM ubuntu:16.04
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        ca-certificates \
        cmake \
        wget \
        git \
        vim \
        curl \
        && \

# ==================================================================
# python
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.6 \
        python3.6-dev \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    $PIP_INSTALL \
        setuptools \
        && \
    $PIP_INSTALL \
        numpy \
        scipy \
        pandas \
        scikit-learn \
        matplotlib \
        Cython \
        && \
        
# ==================================================================
# jupyter
# ------------------------------------------------------------------

    $PIP_INSTALL \
        jupyter \
        && \

# ==================================================================
# tensorflow
# ------------------------------------------------------------------

    $PIP_INSTALL \
        tensorflow \
        && \

# ==================================================================
# keras
# ------------------------------------------------------------------

    $PIP_INSTALL \
        h5py \
        keras \
        && \

# ==================================================================
# tensorlayer
# ------------------------------------------------------------------

    $PIP_INSTALL  tensorlayer && \
   
# ==================================================================
# tflearn
# ------------------------------------------------------------------

    $PIP_INSTALL  tflearn  && \
    
# ==================================================================
# excel
# ------------------------------------------------------------------

   $PIP_INSTALL  xlrd \
                 xlwt \
                 && \
    
# ==================================================================
# python3-tk
# ------------------------------------------------------------------  

    $APT_INSTALL python3-tk && \
    
# ==================================================================
# pydot and graphviz
# ------------------------------------------------------------------ 

    $APT_INSTALL python3-pydot \
                         graphviz \
                         && \
    $PIP_INSTALL  pydot_ng  && \
    
# ==================================================================

# config & cleanup
# ------------------------------------------------------------------

    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*  && \
    
    mkdir -p /root/.keras/datasets  && \
    curl -O https://s3.amazonaws.com/img-datasets/mnist.npz
    
    WORKDIR "/root"
    CMD ["/bin/bash"]

EXPOSE 8888 6006
