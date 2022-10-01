-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_firstDataPath.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--              
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- For logic types I/O
library std;
use std.env.all; -- For hierarchical/external signals
use std.textio.all; -- For basic I/O

-- Create a test entity
entity tb_firstDataPath is
    generic (gCLK_HPER : time := 25 ns); -- Generic for half of the clock cycle period
end tb_firstDataPath;

architecture mixed of tb_firstDataPath is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component firstDataPath is
        port(
            i_Clock : in std_logic;
            i_Reset : in std_logic;
            nAdd_Sub : in std_logic;
            ALUSrc : in std_logic;
            i_Immediate : in std_logic_vector;
            write_select : in std_logic_vector;
            read1_select : in std_logic_vector;
            read2_select : in std_logic_vector);
        end component;
    
    signal CLK : std_logic := '0';
    signal s_RST : std_logic := '0';
    signal s_nAdd_Sub : std_logic := '0';
    signal s_ALUSrc : std_logic := '0';
    signal s_Immediate : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_WRITEADDR : std_logic_vector(4 downto 0) := "00000";
    signal s_READADDR1 : std_logic_vector(4 downto 0) := "00000";
    signal s_READADDR2 : std_logic_vector(4 downto 0) := "00000";

begin

    DUT0 : firstDataPath
    port map(
        i_Clock => CLK,
        i_Reset => s_RST,
        nAdd_Sub => s_nAdd_Sub,
        ALUSrc => s_ALUSrc,
        i_Immediate => s_Immediate,
        write_select => s_WRITEADDR,
        read1_select => s_READADDR1,
        read2_select => s_READADDR2);

    P_CLK : process
    begin
        CLK <= '1';
        wait for gCLK_HPER;
        wait for gCLK_HPER;
        CLK <= '0';
        wait for gCLK_HPER;
        wait for gCLK_HPER;
    end process;

    P_TEST_CASES : process
    begin 
        wait for gCLK_HPER/2;
        -- Reset the register
        s_RST <= '1';
        wait for cCLK_PER;
        s_RST <= '0';
        wait for cCLK_PER;

        ----- Loop Number 0
        -- addi    $1,  $0,  1         # Place "1" in $1               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0001, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x01
        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000001";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00001";
        wait for cCLK_PER * 2;

        ----- Loop Number 1
        -- addi    $2,  $0,  2         # Place "2" in $2               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0002, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x02
        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000010";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00010";
        wait for cCLK_PER * 2;

        ----- Loop Number 2
        -- addi    $3,  $0,  3         # Place "3" in $3               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0003, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x03
        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000011";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00011";
        wait for cCLK_PER * 2;

        ----- Loop Number 3
        -- addi    $4,  $0,  4         # Place "4" in $4               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0004, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x04
        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000100";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00100";
        wait for cCLK_PER * 2;

        ----- Loop Number 4
        -- addi    $5,  $0,  5         # Place "5" in $5               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0005, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x05

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000101";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00101";
        wait for cCLK_PER * 2;

        ----- Loop Number 5
        -- addi    $6,  $0,  6         # Place "6" in $6               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0006, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x06

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000110";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00110";
        wait for cCLK_PER * 2;

        ----- Loop Number 6
        -- addi    $7,  $0,  7         # Place "7" in $7               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0007, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x07

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000000111";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "00111";
        wait for cCLK_PER * 2;

        ----- Loop Number 7
        -- addi    $8,  $0,  8         # Place "8" in $8               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0008, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x08

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000001000";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "01000";
        wait for cCLK_PER * 2;

        ----- Loop Number 8
        -- addi    $9,  $0,  9         # Place "9" in $9               # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x0009, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x09

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000001001";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "01001";
        wait for cCLK_PER * 2;

        ----- Loop Number 9
        -- addi    $10, $0,  10        # Place "10" in $10             # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x000A, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x0A

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "00000000000000000000000000001010";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "01010";
        wait for cCLK_PER * 2;

        ----- Loop Number 10
        -- add     $11, $1,  $2        # $11 = $1 + $2                 # nAdd_Sub = '0', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x01, read2_sel = 0x02, write_sel = 0x0B

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "00001";
        s_READADDR2 <= "00010";
        s_WRITEADDR <= "01011";
        wait for cCLK_PER * 2;

        ----- Loop Number 11
        -- sub     $12, $11, $3        # $12 = $11 - $3                # nAdd_Sub = '1', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x0B, read2_sel = 0x03, write_sel = 0x0C

        s_nAdd_Sub <= '1';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "01011";
        s_READADDR2 <= "00011";
        s_WRITEADDR <= "01100";
        wait for cCLK_PER * 2;

        ----- Loop Number 12
        -- add     $13, $12, $4        # $13 = $12 + $4                # nAdd_Sub = '0', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x0C, read2_sel = 0x04, write_sel = 0x0D

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "01100";
        s_READADDR2 <= "00100";
        s_WRITEADDR <= "01101";
        wait for cCLK_PER * 2;

        ----- Loop Number 13
        -- sub     $14, $13, $5        # $14 = $13 - $5                # nAdd_Sub = '1', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x0D, read2_sel = 0x05, write_sel = 0x0E

        s_nAdd_Sub <= '1';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "01101";
        s_READADDR2 <= "00101";
        s_WRITEADDR <= "01110";
        wait for cCLK_PER * 2;

        ----- Loop Number 14
        -- add     $15, $14, $6        # $15 = $14 + $6                # nAdd_Sub = '0', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x0E, read2_sel = 0x06, write_sel = 0x0F

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "01110";
        s_READADDR2 <= "00110";
        s_WRITEADDR <= "01111";
        wait for cCLK_PER * 2;

        ----- Loop Number 15
        -- sub     $16, $15, $7        # $16 = $15 - $7                # nAdd_Sub = '1', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x0F, read2_sel = 0x07, write_sel = 0x10

        s_nAdd_Sub <= '1';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "01111";
        s_READADDR2 <= "00111";
        s_WRITEADDR <= "10000";
        wait for cCLK_PER * 2;

        ----- Loop Number 16
        -- add     $17, $16, $8        # $17 = $16 + $8                # nAdd_Sub = '0', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x10, read2_sel = 0x08, write_sel = 0x11

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "10000";
        s_READADDR2 <= "01000";
        s_WRITEADDR <= "10001";
        wait for cCLK_PER * 2;

        ----- Loop Number 17
        -- sub     $18, $17, $9        # $18 = $17 - $9                # nAdd_Sub = '1', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x11, read2_sel = 0x09, write_sel = 0x12

        s_nAdd_Sub <= '1';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "10001";
        s_READADDR2 <= "01001";
        s_WRITEADDR <= "10010";
        wait for cCLK_PER * 2;

        ----- Loop Number 18
        -- add     $19, $18, $10       # $19 = $18 + $10               # nAdd_Sub = '0', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x12, read2_sel = 0x0A, write_sel = 0x13

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "10010";
        s_READADDR2 <= "01010";
        s_WRITEADDR <= "10011";
        wait for cCLK_PER * 2;

        ----- Loop Number 19
        -- addi    $20, $0,  -35       # Place "-35" in $20            # nAdd_Sub = '0', ALUSrc = '1', i_Immediate = 0x, read1_sel = 0x00, read2_sel = 0xXX, write_sel = 0x14

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "11111111111111111111111111011101";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "10100";
        wait for cCLK_PER * 2;

        ----- Loop Number 20
        -- add     $21, $19, $20       # $21  = $19 + $20              # nAdd_Sub = '0', ALUSrc = '0', i_Immediate = 0xXXXX, read1_sel = 0x13, read2_sel = 0x14, write_sel = 0x15

        s_nAdd_Sub <= '0';
        s_ALUSrc <= '0';
        s_Immediate <= "00000000000000000000000000000000";
        s_READADDR1 <= "10011";
        s_READADDR2 <= "10100";
        s_WRITEADDR <= "10101";
        wait for cCLK_PER * 4;

    end process;

end mixed;