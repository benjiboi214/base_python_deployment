#!/bin/bash

. .env

echo "#### Running PyTest ####"
pipenv run pytest functional_tests.py \
  -c $PYTEST_FUNC_CONFIG_PATH \
  --junitxml=${PYTEST_FUNC_REPORT_PATH:-"./pytest-func.xml"}