<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./images/docker-logo-white.svg">
    <source media="(prefers-color-scheme: light)" srcset="./images/docker-logo-black.svg">
    <img alt="Docker logo" src="./images/docker-logo-black.svg" width="850">
  </picture>
</div>

# Docker Portfolio

Welcome to my Docker Portfolio!

This repository is a curated collection of **Docker and Containerization** projects, demonstrating a journey from Docker fundamentals to complex multi-container architectures. The goal of this repository is to showcase scalable, isolated, and highly optimized environments using **Docker** and **Docker Compose** best practices.

## :file_folder: Portfolio Structure

Every directory inside this repository represents an independent, self-contained project.

- [wordpress-stack](wordpress-stack): Deploy a containerized WordPress site powered by MariaDB. Perfect for beginners to get familiar with Docker Compose, volume persistence, and container networking.

## :gear: Operational Guidelines & Best Practices

- :package: **Isolated Environments**: Every project is fully self-contained with its own `compose.yaml`. You can build, run, and test within any specific directory without risking port conflicts or cross-project interference.
- :shield: **Execution Safety**: Always verify container health and port bindings prior to production deployment. Reviewing logs via `make logs` or `docker compose logs` is non-negotiable to catch early configuration errors or boot loops.
- :notebook: **Granular Documentation**: Each project folder contains its own local `README.md`. Refer to it for specific architecture details, environment variables (`.env.example`), and local deployment steps.
- :recycle: **Resource Cleanup**: Avoid unnecessary background resource consumption and disk bloat. Always execute `make down && make clean` or `docker compose down -v` immediately after testing to ensure proper cleanup of containers, networks, and persistent volumes.

## :scroll: License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.\
Feel free to use, modify, and distribute this Docker code for personal or commercial projects!

## :mailbox_with_mail: Contact

Questions, suggestions, or feedback? Open an issue or reach out! Happy Containerization! :earth_americas::sparkles:
