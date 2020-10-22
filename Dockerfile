FROM continuumio/miniconda3:latest
MAINTAINER Heather Kelly <heather@slac.stanford.edu>

RUN conda install -y -c conda-forge django flask jinja2 pyyaml

ENV HDF5_USE_FILE_LOCKING FALSE
ENV PYTHONSTARTUP ''
