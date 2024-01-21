docker build --no-cache -t asdf -f ./.devcontainer/Dockerfile.asdf .devcontainer
docker build --no-cache -t example -f ./.devcontainer/Dockerfile.example .devcontainer
docker run -it example