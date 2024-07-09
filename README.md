# crunit.

An npm package for running interactable C/C++ programs in a browser.

## preparing files

C/C++ can't be directly run in the browser, so they first must be compiled to a `.wasm` file. See more about WebAssembly [here](https://webassembly.org/).

To compile your file, install and use [Emscripten](https://emscripten.org/). Then, move the `.js` and `.wasm` file to your project.
