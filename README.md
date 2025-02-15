# Assembly String and List Operations

This project provides a collection of assembly functions for string manipulation and linked list operations, along with a C test suite to demonstrate their usage.

## Features

- **String Functions:**
  - `ft_strcmp`: Compare two strings.
  - `ft_strcpy`: Copy a string to a destination.
  - `ft_strdup`: Duplicate a string using dynamic memory allocation.
  - `ft_strlen`: Calculate the length of a string.
  - `ft_read`: Read from a file descriptor.
  - `ft_write`: Write to a file descriptor.

- **Bonus Functions:**
  - `ft_atoi_base`: Convert a string to an integer using a specified base.
  - `ft_list_push_front`: Add an element to the front of a linked list.
  - `ft_list_size`: Calculate the size of a linked list.
  - `ft_list_sort`: Sort a linked list using a comparison function.
  - `ft_list_remove_if`: Remove elements from a linked list based on a comparison function.

## Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/jguigli/libasm.git
   cd libasm
   ```

2. **Build the Project:**
   - Ensure you have `nasm` and `gcc` installed.
   - Run the following command to assemble and compile the project:
     ```bash
     make
     ```

## Usage

- **Run Tests:**
  - Execute the test suite to verify the functionality of the assembly functions:
    ```bash
    ./test/test
    ```

- **Integrate Functions:**
  - Include the header file in your C projects:
    ```c
    #include "test/test.h"
    ```
  - Link the compiled assembly object files with your C code during compilation.

## Useful Links

- **Calling Conventions:**  
  [x86 Calling Conventions](https://en.wikipedia.org/wiki/X86_calling_conventions)

- **Assembly Language Resources:**  
  [x86-64 Assembly Course](https://perso.univ-st-etienne.fr/ezequel/L2info/coursAssembleur_x86_64.pdf)  
  [MIT x86-64 Architecture Guide](http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html)  
  [x64 Cheatsheet](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)

- **Basic Assembly Concepts:**  
  [Assembly Basics](https://beta.hackndo.com/assembly-basics/)

- **Stack Operations:**  
  [Stack Introduction](https://beta.hackndo.com/stack-introduction/)

- **Memory Management:**  
  [Memory Allocation](https://beta.hackndo.com/memory-allocation/)
