// The Module object is created by the Emscripten-generated main.js
Module.onRuntimeInitialized = () => {
  // Set up file system here
  const FS = Module.FS;
  FS.mkdir("/home");
  FS.mkdir("/home/user");
  FS.writeFile("/home/user/example.txt", "Hello from the virtual file system!");

  // Call your C++ functions here
  Module.ccall("your_function_name", "number", ["string"], ["argument"]);
};
