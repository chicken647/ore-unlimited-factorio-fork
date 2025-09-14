#!/bin/python3

import json
import os
import shutil
import zipfile

with open("src/info.json", "r") as file:
    contents = json.load(file)
    name = contents["name"]
    version = contents["version"]

target_name = f"{name}_{version}"
zip_filename = f"{target_name}.zip"

# Remove old zip if exists
if os.path.exists(zip_filename):
    os.remove(zip_filename)
# Remove old temp folder if exists
if os.path.exists(target_name):
    shutil.rmtree(target_name)

# Copy src to temp folder
shutil.copytree("src", target_name)

# Zip the folder
with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
    for root, dirs, files in os.walk(target_name):
        for file in files:
            file_path = os.path.join(root, file)
            arcname = os.path.relpath(file_path, start=target_name)
            zipf.write(file_path, arcname=os.path.join(target_name, arcname))

# Remove temp folder
shutil.rmtree(target_name)
