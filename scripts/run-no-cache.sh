docker build --no-cache -t asdf -f ./Dockerfile .devcontainer
docker build --no-cache -t example -f ./.devcontainer/Dockerfile.example .devcontainer
docker run -it example