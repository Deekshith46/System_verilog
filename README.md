# SystemVerilog Master Reference — Advanced Concepts and Examples

Welcome to the **SystemVerilog Master Reference**, a comprehensive and advanced guide for engineers, students, and verification professionals. This repository (`System_verilog`) contains meticulously organized and thoroughly commented SystemVerilog examples, designed to take you from foundational constructs to sophisticated verification methodologies.

## 📂 Repository Structure

- **man.sv**  
  The central file, containing progressive chapters of SystemVerilog features with real-world examples.  
  Each code block is self-contained and commented for easy copy-paste and simulation.

## 🚀 Advanced Topics Covered

### 1. Fundamentals and Testbench Construction
- **Parameters**: Usage in testbenches and reusable modules.
- **Advanced Datatypes**: 2-state and 4-state types, signed/unsigned, bytes, `shortint`, `longint`.
- **Enumerations & Typedefs**: Creating readable and maintainable code.

### 2. Data Structures
- **Packed/Unpacked Arrays**: Efficient memory representation and manipulation.
- **Dynamic Arrays**: Resizing, copying, and advanced memory management.
- **Queues**: FIFO/LIFO behavior, custom insertions, and deletions.
- **Associative Arrays**: Sparse memory models, existence checks, and iteration.
- **Array Methods**: Sorting, shuffling, reversing, and custom comparators.

### 3. Procedural Constructs
- **Tasks & Functions**
  - Static vs. automatic scope
  - Argument passing (input/output/inout), default values, return types
  - Re-entrant and recursive constructs
- **Threading**
  - `fork...join`, `fork...join_any`, `fork...join_none`
  - Synchronization, disabling threads, and inter-process communication

### 4. Object-Oriented Programming (OOP)
- **Classes & Objects**: Data encapsulation, constructors, destructors.
- **Inheritance**: Multi-level, hierarchical design, and method overriding.
- **Polymorphism**: Virtual methods, interfaces, and factory patterns.
- **Copy Semantics**: Shallow vs. deep copy, clone methods.
- **Advanced Keywords**: `this`, `super`, and static class members.

### 5. Randomization & Constraints
- **Random Variables**: `rand`, `randc`, and controlling randomization.
- **Pre/Post Randomization Hooks**: Customizing randomization flow.
- **Constraint Blocks**: Range, equality, implication, distribution (weighted/randomized).
- **Constraint Modes & Inheritance**: Dynamic enable/disable, hierarchical constraints.

### 6. Verification Techniques
- **Functional Coverage**: (To be extended—contribute your examples!)
- **Assertions (SVA)**: (To be extended—contribute your examples!)
- **Scoreboarding & Monitor Patterns**: Extend the file with your verification IP!
- **Transaction-Level Modeling (TLM)**: Example stubs included for further learning.

### 7. Utilities & Best Practices
- **String Manipulation**: Advanced string methods and formatting.
- **Simulation Control**: `$shm_open`, `$finish`, `$display` best practices.
- **Debugging Aids**: Tips embedded in code comments for visibility.

---

## 🛠️ How to Use

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Deekshith46/System_verilog.git
   cd System_verilog
   ```

2. **Explore the Main File**
   - Open `man.sv` in your editor or IDE.
   - Each section is wrapped in comments. Uncomment the part you want to simulate.
   - All examples are designed to be modular, so you can focus on one concept at a time.

3. **Simulate the Code**
   - Use simulators like **Questa**, **VCS**, **Xcelium**, or **ModelSim**.
   - Example:
     ```bash
     vlog man.sv
     vsim tb      # or the specific module/class you wish to simulate
     ```

4. **Experiment**
   - Modify parameters, constraints, and class hierarchies.
   - Add your own scenarios for advanced learning.

---

## 📈 Extending This Reference

This repo is a living document!  
Feel free to contribute:
- **New advanced topics** (SVA, UVM, coverage, DPI, etc.)
- **Bug fixes or improvements** to code examples or comments
- **Real-world verification patterns** or best practices

Open an issue or submit a pull request to help the community.

---

## 📜 License

This repository is intended for educational and research purposes.  
Check the [LICENSE](LICENSE) file for details.

---

## ✨ Quick Start Example

Try this: Uncomment the **dynamic array** section in `man.sv`, simulate, and observe how dynamic memory allocation works in SystemVerilog.  
Then, move to **OOP** and experiment with class inheritance and polymorphism!

---

**Master SystemVerilog. Build robust, reusable, and scalable testbenches.**

---
