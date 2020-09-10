# nxxm_ci_docker

## NXXM
Please visit our website : https://nxxm.github.io 

# Usage
Create a ``.yml`` file under ``.github/workflows`` with the following contents

### Configuration to check if your code compiles under linux 

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
      - uses: actions/checkout@v2
      - name: nxxm_CI 
        uses: nxxm/nxxm_ci_docker@master
    env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        
```
### Configuration to check if your code compiles under linux and downloads the build folder 


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
      - uses: actions/checkout@v2
      - name: nxxm_CI 
        uses: nxxm/nxxm_ci_docker@master
      - name: Upload the build directory
        uses: actions/upload-artifact@v2
        with:
          name: my_build
          path: build.zip
    env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
       
```

### Configuration to check if your code compiles and downloads the build folder with option 

```yml
name: CI
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
jobs:
  build:
    name: nxxm_CI_input
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: nxxm_CI 
        uses: nxxm/nxxm_ci_docker@master
        with: 
          target: ''
          configuration: ''
          only_exe: ''
          cpus: ''
          use_cmake: ''
      - name: Upload the build directory
        uses: actions/upload-artifact@v2
        with:
          name: my_build
          path: build.zip
    env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Input options

``target`` : Choice of the compilation target. 
             For linux : ``gcc-7-cxx17``
             For webassembly : ``wasm-cxx17``

``configuration`` : Build type, defaults to optimized MinSizeRel build. ``MinSizeRel`` But you can have ``MinSizeRel`` or ``Release`` or ``RelWithDebInfo`` or ``Debug``

``only_exe`` : Default value is ``disable`` , ``enable`` : Only builds the given executable.

``cpus`` : How many CPU cores have to be dedicated to the build. example: ``3``

``use_cmake`` : Default value is ``disable`` , ``enable`` : Don't build by convention, use CMakeLists.txt at toplevel.

