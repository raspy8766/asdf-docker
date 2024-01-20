FROM public.ecr.aws/ubuntu/ubuntu:24.04

SHELL ["/bin/bash", "-c"]

# DEBIAN_FRONTEND avoids interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive \
    ASDF_DIR=/opt/asdf

ENV PATH=$PATH:$ASDF_DIR/bin

RUN useradd -ms /bin/bash -U devcontainer

# Install utils as root user
RUN <<EOF
  apt-get update
  apt-get install -y curl git unzip
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
EOF

USER devcontainer

# Update devcontainer user runtime config files
RUN <<EOF
  echo -e '\n. /opt/asdf/asdf.sh' >> ~/.bashrc
  echo -e '\n. /opt/asdf/completions/asdf.bash' >> ~/.bashrc
EOF

WORKDIR /home/devcontainer

COPY .tool-versions .tool-versions

RUN <<EOF
    asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
    asdf plugin add bun https://github.com/cometkim/asdf-bun
    asdf install
EOF

CMD ["/bin/bash"]
