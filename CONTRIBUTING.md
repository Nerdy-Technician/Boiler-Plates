# Contributing

Thanks for improving the boilerplates. Keep examples boring, readable, and easy to adapt.

## Local Checks

Run the validation suite before opening a pull request:

```bash
make validate
```

The validator checks YAML syntax, Docker Compose config when Compose is installed, `.env.example` coverage, and template filename consistency.

## Template Guidelines

- Prefer `.env.example` for configurable stacks.
- Keep real secrets out of examples.
- Use explicit comments for paths, ports, user IDs, and external networks.
- Add healthchecks when the image includes `curl`, `wget`, or a native CLI.
- Keep host paths and domain names obviously replaceable.
- Update `STACKS.md`, `README.md`, and `CHANGELOG.md` when adding or moving templates.

## Commit Style

Use Conventional Commits where practical:

```text
feat: add uptime kuma template
fix: correct sonarr healthcheck
docs: document external network setup
```
