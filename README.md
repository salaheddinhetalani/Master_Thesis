# Master Thesis
Correct-by-Construction Hardware Design of A 5-Stage-Pipelined-RV32I CPU

## Implementation
The Implementation of the piplined CPU follows the following steps:

1. an abstract untimed SystemC design of the base integer instruction set RV32I without interrupts is implemented as a single cycle implementation [ISA](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_ISA/ESL).
2. based on ISA, a complete set of abstract [properties](https://github.com/salaheddinhetalani/Master_Thesis/blob/master/example/RISCV_Pipelined/Properties/original_ISA.vhi) is generated using the open source tool [SCAM](https://github.com/ludwig247/SCAM)
3. these generated properties are refined while developing the [hardware](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_Pipelined/RTL) for the pipelined CPU in VHDL.
4. the [refined properties](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_Pipelined/Properties/General) has to be proved against the final implementation of the RTL. 

## Remarks
- System level design of the pipelined CPU could be found in the [ESL](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_Pipelined/ESL) folder.
- Assembly [programs](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_Test/Programs) as well as [instruction tests](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_Test/Instruction_Tests) have been developed to [test](https://github.com/salaheddinhetalani/Master_Thesis/tree/master/example/RISCV_Test/ESL/Core_test.h) the CPU, as both Pipelined or single cycle implementation, on system level.

*NOTE: README FILES WOULD BE ADDED ON THE 15th OF DEC 2018*
