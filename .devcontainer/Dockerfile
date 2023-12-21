FROM public.ecr.aws/ubuntu/ubuntu:24.04s

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install ASDF (version manager for multiple runtime versions)
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
    && echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc \
    && echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc \
    source ~/.bashrc


# Install required dependencies for Node.js
# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#         dirmngr \
#         gpg \
#         && rm -rf /var/lib/apt/lists/*
RUN asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
RUN asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git


RUN asdf install
# Add Node.js plugin to ASDF and install Node.js
# RUN bash -c ". $HOME/.asdf/asdf.sh && asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git" \
    # && bash -c ". $HOME/.asdf/asdf.sh && asdf install nodejs" \
    # && bash -c ". $HOME/.asdf/asdf.sh && asdf global nodejs"

# # Install PNPM
# RUN curl -fsSL https://get.pnpm.io/install.sh | sh -

# # Install Terraform using ASDF
# RUN bash -c ". $HOME/.asdf/asdf.sh && asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git" \
#     && bash -c ". $HOME/.asdf/asdf.sh && asdf install terraform 1.0.4" \
#     && bash -c ". $HOME/.asdf/asdf.sh && asdf global terraform 1.0.4"

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Display installed versions
RUN echo "Node.js version: $(node --version)" \
    && echo "PNPM version: $(pnpm --version)" \
    && echo "Terraform version: $(terraform --version)"

# Set the default command to start a bash shell
CMD ["/bin/bash"]
