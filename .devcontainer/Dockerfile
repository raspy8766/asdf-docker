FROM public.ecr.aws/ubuntu/ubuntu:24.04

SHELL ["/bin/bash", "-c"]

# DEBIAN_FRONTEND avoids interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive \
    ASDF_DIR=/opt/asdf

ENV PATH=$PATH:$ASDF_DIR/bin

RUN useradd -ms /bin/bash -U devcontainer

RUN <<EOF
  apt-get update
  apt-get install -y curl git unzip
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
EOF

USER devcontainer

RUN <<EOF
    asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
    asdf plugin add bun https://github.com/cometkim/asdf-bun
    echo -e '\n. /opt/asdf/asdf.sh' >> ~/.bashrc
    echo -e '\n. /opt/asdf/completions/asdf.bash' >> ~/.bashrc
EOF

COPY .tool-versions /home/devcontainer/.tool-versions

RUN asdf install

# Set working directory to user's home directory
WORKDIR /home/devcontainer

CMD ["/bin/bash"]
