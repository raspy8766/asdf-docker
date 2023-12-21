FROM public.ecr.aws/ubuntu/ubuntu:24.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV ASDF_DIR=/opt/asdf

COPY .tool-versions .tool-versions

# Install ASDF (version manager for multiple runtime versions)
RUN apt update
RUN apt install -y git curl unzip
RUN git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR \
    && echo '. $ASDF_DIR/asdf.sh' >> ~/.bashrc \
    && echo '. $ASDF_DIR/completions/asdf.bash' >> ~/.bashrc

ENV PATH="$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH"

# Source asdf to make it available in subsequent RUN commands
RUN . $ASDF_DIR/asdf.sh

RUN asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
RUN asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git

RUN asdf global terraform \
    && asdf global nodejs

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Display installed versions
RUN echo "Node.js version: $(node --version)" \
    && echo "Terraform version: $(terraform --version)"

# Set the default command to start a bash shell
CMD ["/bin/bash"]
