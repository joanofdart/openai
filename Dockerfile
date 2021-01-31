FROM jupyter/tensorflow-notebook

USER root
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y xvfb && \
    apt install -y python-opengl

RUN apt install -y cmake && \
    apt install -y zlib1g zlib1g-dev

USER ${NB_USER}

RUN pip install \
        gym \
        pyvirtualdisplay

RUN conda install swig
RUN pip install box2d-py atari_py pystan

COPY ./example/env_render.ipynb /home/${NB_USER}/env_render.ipynb
COPY ./example/18_reinforcement_learning.ipynb /home/${NB_USER}/01_the_machine_learning_landscape.ipynb