# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# torch         latest (git)
# chainer       latest (pip)
# cntk          2.3    (pip)
# jupyter       latest (pip)
# mxnet         latest (pip)
# pytorch       0.3.0  (pip)
# tensorflow    latest (pip)
# theano        latest (git)
# keras         latest (pip)
# lasagne       latest (git)
# opencv        latest (git)
# sonnet        latest (pip)
# caffe         latest (git)

# tensorlayer   latest (pip)
# tflearn       latest (pip)
# ==================================================================

FROM ufoym/deepo:all-py36-jupyter-cpu
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    apt-get update && \

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
    apt-get clean && \
    apt-get autoremove
    
    WORKDIR "/root"
    CMD ["/bin/bash"]
