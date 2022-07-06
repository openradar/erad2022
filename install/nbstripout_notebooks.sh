#!/bin/bash

# strip notebooks
find notebooks -path notebooks/*.ipynb_checkpoints -prune -o -name *.ipynb -print0 | xargs -0 nbstripout --extra-keys "metadata.kernelspec"

