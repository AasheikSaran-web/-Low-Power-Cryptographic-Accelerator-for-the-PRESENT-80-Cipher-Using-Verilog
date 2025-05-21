
# Low-Power Cryptographic Accelerator for the PRESENT-80 Cipher Using Verilog

## Authors
- Aasheik Saran S (24478)
- Hariram P (24603)

## Overview
This project presents a low-power cryptographic accelerator for the **PRESENT-80 lightweight block cipher**, optimized for energy efficiency and area through techniques like **clock gating**. The implementation is done using **Verilog**, synthesized with **Yosys**, and analyzed using **OpenSTA**.

## Features
- Encryption and decryption modules for PRESENT-80 cipher.
- Clock gating for reduced power consumption.
- Synthesized and analyzed using open-source EDA tools.
- Optimized S-box and P-box implementation.
- Suitable for IoT and battery-powered embedded systems.

## Cipher Details

### Encryption
- 64-bit plaintext input.
- 80-bit master key.
- Substitution (S-box), permutation (P-box), and round-key XORing.
- Clock-gated control logic to manage power consumption.

### Decryption
- 64-bit ciphertext input.
- Inverse permutation and substitution logic.
- Key schedule with reverse S-box and circular shifts.

## Architecture

- **S-box:** 4-bit to 4-bit nonlinear mapping, applied in parallel.
- **P-box:** Bit-level permutation to ensure diffusion.
- **Registers:** 64-bit data path and 80-bit key registers.
- **Control:** Round counter and reset control logic.
- **Power Efficiency:** Achieved via clock gating during idle cycles.

## Tools Used
- **Yosys:** Synthesis
- **OpenSTA:** Static timing analysis
- **Icarus Verilog:** Simulation

## Performance Metrics
- **Encryption Accelerator Area:** 1552.376 µm²
- **Decryption Accelerator Area:** 1686.706 µm²
- **S-box Area:** 19.684 µm²

## File Structure
```
📁 project/
 ┣ 📜 present80_encrypt.v
 ┣ 📜 present80_decrypt.v
 ┣ 📜 sbox.v
 ┣ 📜 pbox.v
 ┣ 📜 top_module.v
 ┣ 📜 testbench.v
 ┗ 📄 README.md
```

## How to Run
1. Clone this repository.
2. Install Icarus Verilog and GTKWave.
3. Run simulation:
   ```bash
   iverilog -o sim.out testbench.v
   vvp sim.out
   gtkwave dump.vcd
   ```

## References
- [1] PRESENT Cipher Specification: https://link.springer.com/chapter/10.1007/978-3-540-74735-2_31

## License
This project is intended for educational and research purposes.
