.PHONY: help validate yaml env clean

help:
	@printf '%s\n' \
		'Available commands:' \
		'  make validate  Run all repository checks' \
		'  make yaml      Parse every YAML file' \
		'  make env       Check Docker env examples cover compose variables' \
		'  make clean     Remove common local runtime folders'

validate:
	@bash tools/validate.sh

yaml:
	@CHECK_YAML_ONLY=1 bash tools/validate.sh

env:
	@CHECK_ENV_ONLY=1 bash tools/validate.sh

clean:
	@rm -rf Appdata appdata config data downloads watch grafana mariadb mongo mysql postgres redis timescaledb influxdb
