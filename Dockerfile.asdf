FROM public.ecr.aws/ubuntu/ubuntu:24.04

SHELL ["/bin/bash", "-c"]

# DEBIAN_FRONTEND avoids interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive \
    ASDF_DIR=/opt/asdf \
    TERM=xterm-256color

ENV PATH=$PATH:$ASDF_DIR/bin

RUN useradd -ms /bin/bash -U main

# Install utils as root user
RUN <<EOF
  apt-get update
  apt-get install -y curl git unzip yq jq gh
  git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR
EOF

USER main

# Update main user runtime config files
RUN <<EOF
  echo "PS1='\e[92m\u\e[0m@\e[94m\h\e[0m:\e[35m\w\e[0m# '" >> ~/.bashrc
  echo -e '\n. /opt/asdf/asdf.sh' >> ~/.bashrc
  echo -e '\n. /opt/asdf/completions/asdf.bash' >> ~/.bashrc
EOF

WORKDIR /home/main

CMD ["/bin/bash"]
