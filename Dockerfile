FROM jupyter/datascience-notebook:latest

USER root

# system
RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y apt-get install -y \
    htop

# blogging (jekyll)
RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y apt-get install -y \
    ruby-full build-essential zlib1g-dev
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc &&\
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc &&\
    echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc &&\
    source ~/.bashrc &&\
    gem install jekyll bundler

USER ${NB_UID}

# dev work
RUN pip install \
    treelite treelite_runtime

RUN Rscript -e "install.packages(c('arrow', 'xgboost'))"


