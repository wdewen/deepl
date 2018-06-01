FROM wdewen/deepo:all-py36-jupyter-cpu
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
