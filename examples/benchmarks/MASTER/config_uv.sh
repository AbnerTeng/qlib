#!/bin/bash

uv venv .venv

source .venv/bin/activate

uv pip install pyqlib cryptography pyyaml
uv pip install -r requirements.txt

lib_path="$(python -c 'import qlib, os; print(os.path.join(os.path.dirname(qlib.__file__), "data", "_libs"))')"
echo "Shared object path: $lib_path"

mkdir -p ../../../qlib/data/_libs

find "$lib_path" -type f -name "*.so" -exec cp {} "../../../qlib/data/_libs" \;

uv pip uninstall pyqlib
