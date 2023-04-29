#!/bin/bash

echo "Running automatic crate compilation. This will loop forever. To quit, press CTRL+C."
while true; do
  cargo build
done