# crunit.

An npm package for running interactable C/C++ programs in a browser.

## preparing files

C/C++ can't be directly run in the browser, so they first must be compiled to a `.wasm` file. See more about WebAssembly [here](https://webassembly.org/).

To compile your file, install and use [Emscripten](https://emscripten.org/). Then, move the `.js` and `.wasm` file to your project.

## adding emcc command

1. Using the emsdk, navigate to the Emscripten SDK Directory:

`cd /path/to/emsdk`

2. Activate the Emscripten Environment:

`source ./emskd_env.sh`

3. Add the activation command to your shell config:

`echo 'source /path/to/emsdk/emsdk_env.sh`
