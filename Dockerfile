# Copyright 2017 TWO SIGMA OPEN SOURCE, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Pick up latest beakerx image from Continuam beakerx/beakerx
FROM beakerx/beakerx

ENV DEBIAN_FRONTEND noninteractive

USER beakerx

RUN /bin/bash -c "id && conda env list && source activate beakerx && \
#     conda update --all && \
     conda install -c r r -y && \
     conda install -c r r-essentials -y && \
     conda install -c r r-irkernel -y && \
     jupyter kernelspec list && \
     conda install -c conda-forge matplotlib -y"

RUN /bin/bash -c "id && conda env list && source activate beakerx && \
     conda install rpy2 -y && \ 
     conda install tzlocal -y && \
     conda install -c anaconda make -y" 

USER root

RUN /bin/bash -c "id && conda env list && source activate beakerx && \
     apt-get update -y && \
    apt-get install xserver-common xserver-xorg xserver-xorg-core -y && \
    apt-get install xserver-xorg-input-all -y && \
    apt-get install xorg -y && \
    apt-get install vim -y"

COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py
RUN sudo chown -R beakerx:beakerx /etc/jupyter/jupyter_notebook_config.py
