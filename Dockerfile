FROM jupyter/datascience-notebook:latest

RUN pip install \
    treelite treelite_runtime

USER root

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y apt-get install -y \
    htop

USER ${NB_UID}
