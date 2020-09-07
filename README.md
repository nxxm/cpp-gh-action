# nxxm_ci_docker

## NXXM
Please visit our website : https://nxxm.github.io 

# Usage
Create a ``.yml`` file under ``.github/workflows`` with the following contents
### Default configuration

```yml
name: CI
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
jobs:
  build:
    name: nxxm_CI
    runs-on: ubuntu-latest
    steps:
      - name: nxxm_CI 
        uses: nxxm/nxxm_ci_docker@master
    env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
