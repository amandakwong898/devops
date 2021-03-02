#!/bin/bash
set -ex

# Remove ansible 
sudo yum erase -y ansible openscap scap-security-guide
