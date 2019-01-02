# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow=1.12*' \
    'keras=2.2*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Install Pytorch-ver0.4.1
RUN conda install pytorch=0.4.1
RUN conda install torchvision -c pytorch

# Install Jupyterthemes
RUN pip install jupyterthemes

# Install for ReinforceLearning
RUN pip install gym
RUN pip install JSAnimation
RUN pip uninstall pyglet -y
RUN pip install pyglet==1.2.4
RUN conda install -c conda-forge ffmpeg