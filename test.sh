#!/bin/bash

echo "Running automatic build loop. This will continuously build the project. To quit, press CTRL+C."
while true; do
  cargo build
done