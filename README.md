# nxxm_ci_docker

## NXXM
Please visit our website : https://nxxm.github.io 

# Usage
Create a ``.yml`` file under ``.github/workflows`` with the following contents

# Example

You can find an example of how to use this GitHub action if you follow this link : https://github.com/nxxm/example-cpp-github-action

### Configuration to check if your code compiles

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
### Configuration to check if your code compiles and downloads the build folder 


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
          path: build/
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
          target: ""
          dir: ""
          exclude: ""
          config: ""
          jobs: ""
          use_cmakelists: ""
          test: ""
          exclude_test: ""          
          extra_args: ""
      - name: Upload the build directory
        uses: actions/upload-artifact@v2
        with:
          name: my_build
          path: build/
    env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        NXXM_AUTH: ${{ secrets.NXXM_AUTH }}

```

### Input options

``target`` : Choice of the compilation target. 
             For linux : ``gcc-7-cxx17``
             For webassembly : ``wasm-cxx17``
             In default nxxm choose wasm-cxx17
             
``dir`` : Base dir is filled by GitHub and contains all your pull request or push directory. but if you just want to compile a specific folder you can fill in the path to it, for e.g ``./src/banana``.
  
 ``exclude`` : Directories within project dir to exclude from source analysis 
               Repeat to exclude multiple dirs e.g.  ``benchmark/ test/``

``config`` : Build type, defaults to optimized MinSizeRel build.But you can have ``MinSizeRel`` or ``Release`` or ``RelWithDebInfo`` or ``Debug``

``jobs`` : How many CPU cores have to be dedicated to the build. example: ``3``

``use_cmakelists`` :  ``true``  : Don't build by convention, use CMakeLists.txt at toplevel.

``test`` :   Whether to run the tests built ( i.e. .cpp files found in test[s]/ or example[s]/ folder)
            ``all`` runs the full test suite, ``example/mytest`` runs mytest.

``exclude_test`` :   regular expression to match test to exclude. When --test=all is passed, this allows excluding a test or more.
                     for example : ``mytest``

``etra_args`` : You can enter all the other options of nxxm :
     
  - ``-s, --sources <"dir/">`` : Directorie(s) containing the libs sources and headers. Defaults to project root.
                                 Repeat to add many dirs e.g. -s include -s src

  - ``-o, --only `` : Only builds the given executable.
      
  - ``-n, --no-refresh`` : If the dependencies were already fetched once no online access is performed.
                          Note: tags are only accessed once, and kept in local cache.
      
  - ``-D <YOUR_DEFINE[=value]> `` : (Pass any defines to your code, e.g. :
                                    * -DBOOST_MPL_CFG_NO_PREPROCESSED_HEADERS
                                    * -DBOOST_MPL_LIMIT_VECTOR_SIZE=50
                                    * -DMYSTR="\"text\"" \n 

  - ``--dont-check-cli-arg `` : If you don't want to check if your options are okay 
          
  - ``-?, -h, --help `` : Options, arguments
      
  - ``-v, --verbose`` : Display usage information.
                        Be verbose and prints everything the companion knows.
