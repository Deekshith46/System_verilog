# D Flip-Flop Verification (`d_ff`)

This folder contains the SystemVerilog code and testbench for the verification of a D Flip-Flop (DFF).

## Overview

The verification environment simulates a D Flip-Flop and checks its functional correctness by comparing the Design Under Test (DUT) output to a reference model. The simulation log includes generated data, driven data, monitored outputs, and scoreboarding results.

## Simulation Flow

- **RESET**: The simulation begins by resetting the DUT.
- **Test Sequence**: Various input values (`DIN`) are generated and applied to the DFF.
- **Monitoring**: The output (`DOUT`) is monitored and compared against the expected value using a reference model.
- **Scoreboarding**: Results are checked for data match at each clock cycle.
- **End of Simulation**: Simulation completes when all test vectors are applied, and `$finish` is called.

## Log Output Example

```
[DRV] RESET DONE
[GEN]: DIN : 1 DOUT : 0
[DRV]: DIN : 1 DOUT : 0
[MON]: DIN : 0 DOUT : 1
[SCO]: DIN : 0 DOUT : 1
[REF]: DIN : 1 DOUT : 0
[SCO]: DATA MATCHED
------------------------------------
...
Simulation complete via $finish(1) at time 1310 NS + 1
```

- `[GEN]`: Generated input and expected output.
- `[DRV]`: Driven input and output to the DUT.
- `[MON]`: Monitored input and output from the DUT.
- `[SCO]`: Scoreboard comparison.
- `[REF]`: Reference model output.
- `[SCO]: DATA MATCHED`: Output matches expected value.

## Directory Structure

- `d_ff/`
  - Source files for D Flip-Flop (RTL)
  - Testbench and verification components
  - Simulation scripts and logs

## How to Run

1. **Compile the design and testbench** with your SystemVerilog simulator (e.g., VCS, ModelSim, Questa, etc.).
2. **Run the simulation**:
   ```
   <simulator> -f filelist.f
   ```
   or use your preferred command/script.

3. **Check the simulation log** for `[SCO]: DATA MATCHED` messages indicating successful verification.

## Notes

- The D Flip-Flop is expected to capture the input (`DIN`) on the rising edge of the clock and output it as `DOUT` in the next cycle.
- The verification environment ensures that the DUT output matches the reference model at every step.
- Any mismatches will be reported in the scoreboard logs.

## Contact

For questions or issues, please contact [Deekshith46](https://github.com/Deekshith46).
