<h1 align=center>Cachivache 2</h1>

<p>Application that enables its users to upload images of the things they like, informing their friends about these preferences. This facilitates choosing appropriate gifts for special occasions, such as birthdays.</p>

> [!NOTE]
> This solution replaces <a href=https://github.com/pablomgdev/cachivache2-api>cachivache2-api</a>. Now it is a monorepo with all the artefacts needed (frontend, backend, etc).


## 📄 Table of content
- [ℹ️ Why Has This Project Been Created?](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#%E2%84%B9%EF%B8%8F-why-has-this-project-been-created)
- [🧱 Project Setup](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#-project-setup)
  - [Prerequisites](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#prerequisites)
  - [Docker Compose](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#docker-compose)
  - [Makefile Commands](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#makefile-commands)
- [🚀 Launch Project](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#-launch-project)
  - [Environment Variables](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#environment-variables)
  - [Build and Run](https://github.com/pablomgdev/cachivache2?tab=readme-ov-file#build-and-run)
- [🪪 License](https://github.com/pablomgdev/cachivache2#-license)


## ℹ️ Why Has This Project Been Created?
Have you ever felt lost not knowing what to give someone because you're unsure of their likes? Have you ever forgotten what your boyfriend or girlfriend wanted for their birthday? This app has been created to address these kinds of dilemmas in a clever way.

With this app, individuals can upload pictures of things to let their friends know about their preferences. However, these photos won't be visible to the person who uploaded them. This way, the person who shared the images won't remember what they uploaded; only their friends will know.

If you're someone who occasionally finds it challenging to choose the right gift, this app is your salvation. It makes everything easier for you.

## 🧱 Project Setup
In this section is explained how to set up the project.

### Prerequisites
- Golang 1.21.4: [Install Golang](https://go.dev/doc/install).
- Docker: [Install Docker](https://docs.docker.com/get-docker/).
- Make: [Install Make](https://www.gnu.org/software/make/).

### Docker Compose
This project uses Docker Compose for container orchestration. The configuration can be found in the `docker-compose.yml` file.

### Makefile Commands
The project includes a Makefile with the following commands:

- `make build`: Build the project using Docker Compose.
- `make run`: Run the project in detached mode.
- `make down`: Stop and remove all containers, networks, and volumes.
- `make logs`: View logs in real-time.

## 🚀 Launch Project
### Environment Variables
To run this project, you need to set up the following environment variables. Create a `.env` file based on the provided sample:

1. Copy `.env.sample` to `.env`.
1. Open the `.env` file and replace the placeholder values with your actual configuration.

### Build and Run
To build and run the project, follow these steps:

1. Build the project: `make build`.
1. Run the project: `make run`.

## 🪪 License
Todos los derechos reservados © 2023 [pablomgdev](https://github.com/pablomgdev).
