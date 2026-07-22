<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="../images/docker-logo-white.svg">
    <source media="(prefers-color-scheme: light)" srcset="../images/docker-logo-black.svg">
    <img alt="Docker logo" src="../images/docker-logo-black.svg" width="850">
  </picture>
</div>

# WordPress Stack

## :dart: Objective

This project aims to demonstrate a modern, lightweight **WordPress** development environment in **Docker**, fully orchestrated using **Docker Compose**.

It is designed as an efficient local stack for PHP development, showcasing best practices in container isolation, developer experience (DX), and automated service management via a custom `Makefile`.

## :building_construction: Stack Overview

The stack isolates core components into dedicated, lightweight containers:

- **Application**: WordPress running on `PHP-FPM` (Alpine Linux).
- **Web Server**: Nginx (serving static files & reverse-proxying PHP requests).
- **Database**: MariaDB (optimized relational storage).
- **Object Cache**: Redis (reducing database queries for dynamic content).
- **CLI Tooling**: WP-CLI via an interactive container environment for administration tasks.
