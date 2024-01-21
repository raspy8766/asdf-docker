docker build -t asdf -f ./Dockerfile .devcontainer
docker build -t example -f ./.devcontainer/Dockerfile.example .devcontainer
docker run -it example