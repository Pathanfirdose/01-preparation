# Docker

Docker    
    Docker is a platform that allows you to package an application and all its dependencies into a lightweight, portable container so it runs the same way on any system, and it is used in software development because it eliminates environment-related issues (“works on my machine”), speeds up deployment, improves scalability, enables microservices architecture, simplifies CI/CD pipelines, and allows developers to quickly build, test, and ship applications in consistent, isolated environments.

Bare minimum OS

    A bare minimum OS (often called a minimal operating system or minimal base image) is a highly stripped-down operating system that contains only the essential components required to run applications—no extra packages, tools, or services—resulting in a smaller footprint, better performance, faster boot times, and reduced security risks; in Docker, examples include **Alpine Linux**, **BusyBox**, or **Scratch**, which developers use to create lightweight, efficient containers.

Apllication run time

    Application runtime refers to the environment in which an application executes, providing the necessary libraries, dependencies, and settings required for the program to run correctly, such as the Java Runtime Environment (JRE) for Java apps, Node.js for JavaScript apps, or Python interpreter for Python apps; in Docker, the runtime is included inside the container image so the application always runs with the correct version of languages, libraries, and configurations regardless of the underlying host system.

Docker image

    In Docker, an image is a lightweight, read-only template that contains everything needed to run an application—including the application code, runtime, system tools, libraries, and configuration—built in layers so it can be reused and shared, and when you run an image, it creates a container that acts as the actual running instance of the application.

    In Docker, an **image** is a read-only template that contains everything needed to run an application—its code, runtime, libraries, configuration files, and a minimal OS layer—and it acts as the blueprint for creating containers, meaning every container you run is an isolated instance based on that image.

Docker port farwarding 

    Docker port forwarding is the process of mapping a port from your host machine to a port inside a container so you can access the application running inside the container from outside, and it is done using the `-p` option in `docker run` (for example, `docker run -p 8080:80 nginx` maps host port 8080 to container port 80), enabling external clients, browsers, or other services to reach the containerized application through the host’s network.

Dockerfile

    A Dockerfile is a simple text file containing step-by-step instructions that Docker uses to build an image, defining things like the base OS, application code to copy, dependencies to install, environment variables, exposed ports, and the command to run the application, and when you run `docker build`, Docker reads this file and creates a reproducible, version-controlled image that can be deployed anywhere.

FROM
    `FROM` is the first instruction in a Dockerfile and it specifies the base image your new image will be built on top of, meaning it defines the starting operating system or runtime environment (for example, `FROM ubuntu`, `FROM alpine`, or `FROM node:18`), and every subsequent instruction in the Dockerfile layers on top of this base to create the final container image.

RUN
    `RUN` in a Dockerfile is an instruction used to execute commands inside the image while it is being built, typically for installing packages, downloading dependencies, or configuring the environment (for example, `RUN apt-get update && apt-get install -y nginx`), and each `RUN` creates a new layer in the final image, contributing to how the image is built and cached.

CMD
    `CMD` in a Dockerfile specifies the default command that should run when a container starts, meaning it defines what the container will execute by default unless overridden at runtime (for example, `CMD ["python", "app.py"]`), and unlike `RUN` which executes during image build, `CMD` runs only when the container is launched.

LABEL
    `LABEL` in a Dockerfile is used to add metadata to an image—such as the maintainer’s name, version, description, or custom tags—in key-value form (for example, `LABEL maintainer="faiz@example.com" version="1.0"`), and these labels help in organizing, searching, filtering, and automating tasks in container environments without affecting how the image runs.

EXPOSE
    `EXPOSE` in a Dockerfile is an instruction that documents which port inside the container the application will listen on (for example, `EXPOSE 80`), and while it does not actually publish or open the port on the host, it serves as metadata to indicate the intended port, with actual port mapping done at runtime using `-p` or `--publish` when running the container.

ENV
    `ENV` in a Dockerfile is used to set environment variables inside the image, which will be available to the application when the container runs (for example, `ENV APP_ENV=production`). These variables can store configuration values, paths, or credentials (non-sensitive), and they help make the container more flexible because you can reference them later in the Dockerfile or use them at runtime without hardcoding values.

ADD
    `ADD` in a Dockerfile copies files, directories, or remote URLs from your host machine into the image, and it also has extra features like automatically extracting local tar archives, which is why it is more powerful but less recommended than `COPY`; typically `ADD source destination` places the specified content into the image during build time.

COPY
    `COPY` in a Dockerfile is used to copy files or directories from your host machine into the image without any extra processing, making it the preferred and safer choice compared to `ADD` when you simply want to transfer application code or configuration files into the container during the image build process.

ENTRYPOINT
    `ENTRYPOINT` in a Dockerfile defines the main command that will always run when a container starts, making the container behave like a dedicated executable, and unlike `CMD` which can be easily overridden, `ENTRYPOINT` ensures the core command stays fixed while allowing additional arguments to be passed at runtime (for example, `ENTRYPOINT ["python", "app.py"]`).

USER
    `USER` in a Dockerfile specifies which user the container should run as after the image is built, allowing you to switch from the default `root` user to a non-root user for better security (for example, `USER appuser`), and this ensures that any commands, processes, or applications inside the running container execute with the permissions of that specified user rather than with elevated privileges.

WORKDIR
    `WORKDIR` in a Dockerfile sets the working directory for any subsequent instructions (like `RUN`, `CMD`, `COPY`, or `ADD`) in the image, so you don’t have to use full paths repeatedly (for example, `WORKDIR /app`), and if the directory doesn’t exist, Docker will automatically create it.

ARG
    `ARG` in a Dockerfile defines a build-time variable that can be passed to the image during the build process using `--build-arg` (for example, `ARG APP_VERSION=1.0`), allowing you to customize the build without hardcoding values; unlike `ENV`, `ARG` values exist only during the image build and are not available in the running container.

ONBUILD
    `ONBUILD` in a Dockerfile is a trigger instruction that sets up a command to execute later when a child image is built FROM this image, allowing you to create “template” images that automatically perform certain actions in derived images (for example, `ONBUILD COPY . /app` will copy files when another Dockerfile uses this image as its base).

=============================================================================================

# Docker network
    Docker network is a virtual networking system that allows containers to communicate with each other, with the host, or with external systems, and Docker provides different network types like **bridge** (default, used for container-to-container communication on the same host), **host** (shares the host’s network stack), **none** (no network), and **overlay** (used in multi-host Swarm setups), enabling isolated, controlled, and flexible communication between services running in containers.

```sh
docker ps # displays running containers
docker ps -a # list all containers including stopped,paused or exited
docker rm $(ps -a -q) # delete all containers
docker images # list all images
docker pull # pulls image
docker create <image-id> # creates container without starting
docker start <container-id> # starts container
docker stop <container-id> # stops container
docker rm <conatiner-id> # to remove stopped container
docker rm -f <container-id> # to remove running containers
docker rmi <image-id> # to remove image
docker run <image> # docker pull + create + run
docker run -d <image> # runs container in detached mode
docker run -d -p 80:80 <image> # maps the host port to container port
docker exec -it <container-id> bash # to open interactive shell in running container
docker inspect <container-id> # info about container or image
docker logs <container-id> # to retrieve logs
docker run -d -p 8081:80 --name <container-name> <image>
docker tag <image> <new tag>
docker login -u <username>
docker push <username/image:tag>
docker build -t <image-name:tag> . # to build image
docker images -f 'label=company=joindevops'



