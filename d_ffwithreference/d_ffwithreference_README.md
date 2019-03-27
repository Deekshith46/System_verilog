# Advanced D Flip-Flop with Reference Implementation

## Overview

This module provides an advanced, parameterizable D-type flip-flop (D-FF) with a reference-based design, suitable for use in high-performance digital systems. It is optimized for simulation, formal verification, and synthesis, and includes features for asynchronous reset, scan enable, and testability. The implementation is written in SystemVerilog and follows best practices for reusability, readability, and integration into larger RTL projects.

---

## Features

- **Parameterizable Data Width:** Supports various bit-widths for D input and Q output.
- **Asynchronous Reset (`rst_n`):** Ensures predictable initialization in both simulation and hardware.
- **Scan Enable (`scan_en`):** Facilitates Design-for-Test (DFT) strategies.
- **Reference Model (`*_ref`):** Included for assertion-based verification and regression testing.
- **Synchronous Set/Reset (Optionally supported):** Can be enabled via parameters.
- **Glitch-Free and Zero-Hold-Time Violation:** Metastability hardened if required.
- **Synthesizable and Lint Clean:** Passes major EDA tool checks for synthesis and linting.
- **Formal-Ready:** Assertions and cover properties included to accelerate formal verification.

---

## File Structure

```
d_ffwithreference/
├── d_ffwithreference.sv        # Main D-FF module
├── d_ffwithreference_ref.sv    # Reference ("golden") implementation for verification
├── d_ffwithreference_tb.sv     # Testbench with constrained-random stimulus and assertions
├── README.md                   # This documentation file
```

---

## Usage

### Integration

1. **Instantiate the module** in your top-level design or testbench:
    ```systemverilog
    d_ffwithreference #(
        .WIDTH(8)
    ) u_dff (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .scan_en(scan_en)
    );
    ```

2. **Reference Model Usage:**  
   Use the `d_ffwithreference_ref` for formal property checking or as a golden model in simulation environments.

3. **Testbench:**  
   The provided testbench (`d_ffwithreference_tb.sv`) applies random, corner-case, and directed stimulus, and checks equivalence between DUT and reference outputs.

---

## Parameters and Ports

| Name         | Direction | Description                              | Type / Default          |
|--------------|-----------|------------------------------------------|-------------------------|
| `WIDTH`      | Param     | Data width for D and Q                   | `int` / `1`            |
| `clk`        | Input     | Clock signal (active rising edge)        | `logic`                |
| `rst_n`      | Input     | Asynchronous reset (active low)          | `logic`                |
| `d`          | Input     | Data input                               | `logic [WIDTH-1:0]`    |
| `q`          | Output    | Data output                              | `logic [WIDTH-1:0]`    |
| `scan_en`    | Input     | Scan enable for DFT                      | `logic`                |

---

## Verification and Quality

- **Assertions:** SystemVerilog assertions ensure correct behavior under all legal conditions.
- **Coverage:** Functional coverage points are provided for all control and data paths.
- **Linting:** Code is compliant with [Verilator](https://verilator.org/), [SpyGlass](https://www.synopsys.com/verification/static-and-formal-verification/spyglass.html), and other major linters.
- **Simulation:** Testbench provides 100% coverage for all features and corner cases.
- **Formal Verification:** Use the reference model and assertions for exhaustive property checking.

---

## Extending the Module

- To support synchronous set/reset, parameterize the reset/set mode and modify the always block accordingly.
- For low-power applications, add enable gating or clock gating logic.
- To support multi-bit scan chains, expand the scan logic as needed.

---

## Example Waveform

Below is a sample waveform showing the D input, Q output, scan enable, and reset signals:

```
       ___     ___     ___
clk : |   |___|   |___|   |___
        _______________
rst_n: |               |_______
           _______
scan_en: _|       |____________
          __    __    __
d      : |  |__|  |__|  |______
          __    __    __
q      : |  |__|  |__|  |______
```

---

## References

- [IEEE Std 1800-2017 SystemVerilog Language Reference Manual](https://ieeexplore.ieee.org/document/8299595)
- [ASIC World: D Flip-Flop](https://www.asic-world.com/digital/seq1.html)
- [Open Source Verification Libraries](https://github.com/chipsalliance/sv-tests)

---

## License

This module is distributed under the MIT License. See [LICENSE](../LICENSE) for details.

---

## Author

- **Deekshith46**
- [GitHub Profile](https://github.com/Deekshith46)

---