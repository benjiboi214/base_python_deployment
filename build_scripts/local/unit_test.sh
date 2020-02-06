#!/bin/bash

. .env

echo "#### Running PyTest ####"
pipenv run pytest ./api \
  -c $PYTEST_UNIT_CONFIG_PATH \
  --junitxml=${PYTEST_UNIT_REPORT_PATH:-"./pytest-unit.xml"}

echo "#### Running Flake8 ####"
pipenv run flake8 \
  --config=${FLAKE8_CONFIG_PATH:-"flake8.cfg"} .
pipenv run flake8 \
  --format junit-xml \
  --output-file=${FLAKE8_REPORT_PATH:-"./flake8.xml"} \
  --config=${FLAKE8_CONFIG_PATH:-"flake8.cfg"} .

echo "#### Running Coverage ####"
# pipenv run coverage \
#   run -m pytest
# pipenv run coverage \
#   xml -o ${COVERAGE_REPORT_OUTPUT:-"./coverage.xml"}
pipenv run pytest --cov=api ./api \
  -c $PYTEST_UNIT_CONFIG_PATH \
  --junitxml=${COVERAGE_REPORT_PATH:-"./coverage.xml"}