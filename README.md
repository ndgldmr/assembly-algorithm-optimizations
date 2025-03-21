# 🔧 Assembly & C++ Algorithm Implementations

This repository contains a collection of low-level algorithm implementations written in both **x86-64 assembly** and **C++**, organized by algorithm type. Each folder features Makefiles, test drivers, and optionally timing tools to benchmark performance.

> ⚠️ **Note:** These implementations were written in 2023 and may require updates to be compatible with newer compilers, toolchains, or platforms (especially macOS/Linux assembly formats like `elf64` vs `macho64`).

## 🧠 Included Modules

### 🔍 Binary Search
- `BinarySearch.cpp` and `binarySearch.s`
- Recursive binary search in C++ and x86-64 assembly
- Includes a performance timer (`timer.cpp/.h`)
- `testBinarySearch.cpp` accepts CLI flags and runs 1000 iterations for timing

### 🔄 Linear Search
- Pure assembly implementation in `linearSearch.s`
- Test driver in `testLinearSearch.cpp`

### 📉 Merge Sort
- Recursive merge sort in `mergeSort.s`
- Includes internal merge logic (`_merge`)
- Test driver in `testMergeSort.cpp`

### 🔢 Collatz Conjecture
- Recursive `collatz.cpp` in C++
- Optimized `threexplusone.s` using `shr` and `lea`
- `threexinput.cpp` prompts for input, runs timed iterations

### 🧮 Math Fun
- `product` and `power` functions written in assembly (`mathlib.s`)
- Called from C++ driver `mathfun.cpp`

## ⚙️ Build & Run

Each directory includes a `Makefile` for compilation.

```bash
cd "binary search"
make
./a.out
```
To clean compiled object files:

```
make clean
```
## 🛠️ Requirements

To build and run these projects, you'll need the following tools installed on your system:

### 🧰 Toolchain

- [`nasm`](https://www.nasm.us/) — Netwide Assembler for assembling `.s` files
- [`clang++`](https://clang.llvm.org/) or [`g++`](https://gcc.gnu.org/) — C++ compiler for `.cpp` files
- Unix-like OS (macOS or Linux recommended)

### 🧩 Platform-Specific Notes

- Use `-f elf64` when assembling for **Linux**
- Use `-f macho64` when assembling for **macOS**
