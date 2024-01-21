docker build -t asdf -f ./.devcontainer/Dockerfile.asdf .devcontainer
docker build -t example -f ./.devcontainer/Dockerfile.example .devcontainer
docker run -it example