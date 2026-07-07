# Changelog

All notable changes to this project will be documented in this file.

The format is loosely based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and versions follow the automated release workflow rules.

## [Unreleased]
- Fixed Lidarr Docker image casing and README port examples.
- Fixed Transmission healthcheck to target the Transmission web UI.
- Standardized Docker environment templates on `.env.example`.
- Added a root `.gitignore` for local env files and runtime data.
- Aligned release automation with `v`-prefixed semantic tags.
- Added repository validation tooling, Makefile commands, and CI checks.
- Added stack catalog and contribution guidelines.
- Added Docker template guide and editor defaults.
- Removed checked-in OS thumbnail files.
- Added Uptime Kuma, Vaultwarden, Paperless-ngx, and Borgmatic boilerplates.

## [0.1.0] - Initial automated release
- Initial directory structure
- Added Media and Selfhosted docker-compose examples
- Added NGINX, Apache, and Systemd boilerplates
- Added auto-release workflow
