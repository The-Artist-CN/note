`gdb`（GNU Debugger）是用于调试程序的工具，它支持多种编程语言，包括 C 和 C++。通过 `gdb`，你可以查看程序运行时的内存、寄存器、变量，设置断点，单步执行，查看调用栈等。以下是 `gdb` 常见命令的详细介绍：

### 启动 `gdb`

gdb <program_name>

启动 `gdb` 并加载指定的程序（可执行文件）。

### 基本调试命令

#### 1. **运行程序**

run [args]

- 启动程序，并传递可选的命令行参数（例如：`run arg1 arg2`）。
- 如果程序遇到断点或崩溃，`gdb` 会暂停并等待进一步的调试命令。

#### 2. **设置断点**

break <location>

- 设置断点，暂停程序的执行。
- `<location>` 可以是：
  - 函数名：`break main`
  - 行号：`break 25`（在第 25 行设置断点）
  - 文件和行号：`break foo.c:25`
  
#### 3. **列出源代码**

list

- 显示当前代码上下文，默认显示当前位置前后 10 行。
  
- 也可以指定位置，例如：
  
  list 10, 20  # 显示第 10 行到第 20 行的代码
  

#### 4. **单步调试**

next

- 执行当前行，并停在下一行。如果当前行是一个函数调用，会跳过函数的执行并停在下一行。


step

- 执行当前行，并停在函数的第一行。如果当前行是函数调用，会进入该函数的执行。

#### 5. **继续执行程序**

continue

- 继续程序的执行，直到遇到下一个断点或程序结束。

#### 6. **查看当前调用栈**

backtrace

- 显示调用栈，显示从程序入口到当前函数的函数调用链。

#### 7. **查看变量的值**

print <variable>

- 显示变量的当前值。例如：`print x` 会显示变量 `x` 的值。

- 可以使用表达式进行计算：`print x + y`。

#### 8. **观察点**

watch <variable>

- 设置一个“观察点”，当某个变量的值发生变化时，程序会暂停。

#### 9. **暂停程序**

interrupt

- 在程序运行时，手动暂停执行。

#### 10. **删除断点**

delete <breakpoint_number>

- 删除指定编号的断点。

- 例如：`delete 1` 删除编号为 1 的断点。

#### 11. **查看断点**

info breakpoints

- 查看当前所有的断点信息，包括断点位置和状态。

#### 12. **跳过当前函数**

finish

- 跳过当前函数的执行，直接返回到调用该函数的地方。

#### 13. **改变变量的值**

set variable <variable> = <value>

- 修改程序中某个变量的值。例如：`set variable x = 5`。

#### 14. **查看寄存器**

info registers

- 显示所有寄存器的当前值。

### 进阶调试命令

#### 1. **跟踪函数调用**

trace

- 跟踪程序中的函数调用，记录每次调用函数的情况。

#### 2. **动态加载共享库**

sharedlibrary

- 在调试过程中动态加载共享库。

#### 3. **重置调试环境**

run

- 重新启动程序，通常在修改源代码后使用。

#### 4. **调试多线程程序**

info threads

- 显示程序中的所有线程。


thread <thread_number>

- 切换到指定的线程进行调试。

#### 5. **检查内存**

x/<format> <memory_address>

- 查看指定内存地址的内容。例如：
  - `x/4xw $esp`：以 4 个字（word）为单位，查看栈顶地址（`$esp`）的内存内容。

#### 6. **使用符号文件**

symbol-file <path_to_symbol_file>

- 加载一个符号文件，用于调试没有符号信息的程序。

#### 7. **条件断点**

break <location> if <condition>

- 设置一个条件断点，只有满足指定条件时才会停下。

例如：`break foo.c:25 if x == 5`，当变量 `x` 的值为 5 时，断点才会触发。

#### 8. **调试优化的程序**
如果程序是使用优化编译的（如 `-O2`），可能会导致调试困难。使用 `-g` 编译时会保留符号信息，禁用优化可以提高调试的准确性。

---
