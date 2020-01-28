//
// picoVersat system definitions
// edited for project
//`define bigram

// DATA WIDTH
`define DATA_W 32 // bits


`ifndef bigram
// ADDRESS WIDTH
`define ADDR_W 10
`endif

`ifdef bigram
`define ADDR_W 11
`endif


// MODULE SELECT ADDR WIDTH
`define SEL_ADDR_W 3

// REGISTER FILE ADDRESS WIDTH


// DEBUG: USE PRINTER AND GENERATE VCD FILE
//`define DEBUG

//
// MEMORY MAP
//
`ifndef bigram
`define MEM_BASE 0 //instruction and data memory
`define MEM_ADDR_W 9 //512 positions (2kB)

`define REGF_BASE 512 //registers 0x200
`define REGF_ADDR_W 4 //2**4 = 16 registers

`define CPRT_BASE 600 //0x258
`define CPRT_ADDR_W 0 //only one address

`define PUSH_BASE 602 //0x25A
`define PUSH_ADDR_W 0 //only one address

`define SW_BASE 603 //0x25B
`define SW_ADDR_W 0 //only one address

`define LOOP_BASE 604 //0x25C
`define LOOP_ADDR_W 0 //only one address

`define SND_BASE 605 //0x25D
`define SND_ADDR_W 0 //only one address


`define NO_EXT 1

`define TRAP_BASE 1023
`endif

`ifdef bigram
`define MEM_BASE 0 //instruction and data memory
`define MEM_ADDR_W 10 //512 positions (2kB)

`define REGF_BASE 1024 //registers 0x200
`define REGF_ADDR_W 4 //2**4 = 16 registers

`define CPRT_BASE 1040 //0x258
`define CPRT_ADDR_W 0 //only one address

`define PUSH_BASE 1041 //0x25A
`define PUSH_ADDR_W 0 //only one address

`define SW_BASE 1042 //0x25B
`define SW_ADDR_W 0 //only one address

`define LOOP_BASE 1043 //0x25C
`define LOOP_ADDR_W 0 //only one address

`define SND_BASE 1044 //0x25D
`define SND_ADDR_W 0 //only one address
`endif

// Instruction width 
`define INSTR_W 32

// Instruction fields
`define OPCODESZ 4
`define IMM_W 28

`define DELAY_SLOTS 1

// Instruction codes

// arithmetic
`define addi 0
`define add 1
`define sub 2
//logic
`define shft 3
`define and 4
`define xor 5

// load / store
`define ldi 6
`define ldih 7
`define rdw 8
`define wrw 9
`define rdwb 10
`define wrwb 11

// branch
`define beqi 12
`define beq 13
`define bneqi 14
`define bneq 15
