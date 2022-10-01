-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_mipsRegister.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a testbench for the structural mux2t_N 
-- unit with an N value of 32.
--              
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- For logic types I/O
library std;
use std.env.all; -- For hierarchical/external signals
use std.textio.all; -- For basic I/O

-- Create a test entity
entity tb_mipsRegister is
    generic (gCLK_HPER : time := 10 ns); -- Generic for half of the clock cycle period
end tb_mipsRegister;

architecture mixed of tb_mipsRegister is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component mipRegister is 
        port (
            i_Clock : in std_logic;
            i_Reset : in std_logic;
            i_WriteEnable : in std_logic;
            i_Data : in std_logic_vector(31 downto 0);
            write_select : in std_logic_vector(4 downto 0);
            read1_select : in std_logic_vector(4 downto 0);
            read2_select : in std_logic_vector(4 downto 0);
            readPort1 : out std_logic_vector(31 downto 0);
            readPort2 : out std_logic_vector(31 downto 0));
    end component;

    signal CLK, reset : std_logic := '0';

    signal s_RST : std_logic := '0';
    signal s_WE : std_logic := '0';
    signal s_D : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_READ1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_READ2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_WRITEADDR : std_logic_vector(4 downto 0) := "00000";
    signal s_READADDR1 : std_logic_vector(4 downto 0) := "00000";
    signal s_READADDR2 : std_logic_vector(4 downto 0) := "00000";



begin

    DUT0 : mipRegister
    port map(
        i_Clock => CLK,
        i_Reset => s_RST,
        i_WriteEnable => s_WE,
        i_Data => s_D,
        write_select => s_WRITEADDR,
        read1_select => s_READADDR1,
        read2_select => s_READADDR2,
        readPort1 => s_READ1,
        readPort2 => s_READ2);

    P_CLK : process
    begin
        CLK <= '1';
        wait for gCLK_HPER;
        CLK <= '0';
        wait for gCLK_HPER;
    end process;

    P_TEST_CASES : process
    begin
        wait for gCLK_HPER/2;
        -- Reset  the register
        s_RST <= '1'; 
        -- Turn on the write enable
        s_WE <= '1';
        wait for gCLK_HPER;
        s_RST <= '0';
        wait for gCLK_HPER;

        

        -- Load up all the registers with a bit
        s_D <= "10000000000000000000000000000000";
        s_WRITEADDR <= "00000";
        wait for gCLK_HPER * 2;

        s_D <= "01000000000000000000000000000000";
        s_WRITEADDR <= "00001";
        wait for gCLK_HPER * 2;

        s_D <= "00100000000000000000000000000000";
        s_WRITEADDR <= "00010";
        wait for gCLK_HPER * 2;

        s_D <= "00010000000000000000000000000000";
        s_WRITEADDR <= "00011";
        wait for gCLK_HPER * 2;

        s_D <= "00001000000000000000000000000000";
        s_WRITEADDR <= "00100";
        wait for gCLK_HPER * 2;

        s_D <= "00000100000000000000000000000000";
        s_WRITEADDR <= "00101";
        wait for gCLK_HPER * 2;

        s_D <= "00000010000000000000000000000000";
        s_WRITEADDR <= "00110";
        wait for gCLK_HPER * 2;

        s_D <= "00000001000000000000000000000000";
        s_WRITEADDR <= "00111";
        wait for gCLK_HPER * 2;

        s_D <= "00000000100000000000000000000000";
        s_WRITEADDR <= "01000";
        wait for gCLK_HPER * 2;

        s_D <= "00000000010000000000000000000000";
        s_WRITEADDR <= "01001";
        wait for gCLK_HPER * 2;

        s_D <= "00000000001000000000000000000000";
        s_WRITEADDR <= "01010";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000100000000000000000000";
        s_WRITEADDR <= "01011";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000010000000000000000000";
        s_WRITEADDR <= "01100";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000001000000000000000000";
        s_WRITEADDR <= "01101";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000100000000000000000";
        s_WRITEADDR <= "01110";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000010000000000000000";
        s_WRITEADDR <= "01111";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000001000000000000000";
        s_WRITEADDR <= "10000";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000100000000000000";
        s_WRITEADDR <= "10001";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000010000000000000";
        s_WRITEADDR <= "10010";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000001000000000000";
        s_WRITEADDR <= "10011";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000100000000000";
        s_WRITEADDR <= "10100";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000010000000000";
        s_WRITEADDR <= "10101";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000001000000000";
        s_WRITEADDR <= "10110";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000100000000";
        s_WRITEADDR <= "10111";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000010000000";
        s_WRITEADDR <= "11000";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000001000000";
        s_WRITEADDR <= "11001";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000000100000";
        s_WRITEADDR <= "11010";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000000010000";
        s_WRITEADDR <= "11011";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000000001000";
        s_WRITEADDR <= "11100";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000000000100";
        s_WRITEADDR <= "11101";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000000000010";
        s_WRITEADDR <= "11110";
        wait for gCLK_HPER * 2;

        s_D <= "00000000000000000000000000000001";
        s_WRITEADDR <= "11111";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        -- Read from all the registers starting at opposite ends

        s_READADDR1 <= "00000";
        s_READADDR2 <= "11111";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00001";
        s_READADDR2 <= "11110";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00010";
        s_READADDR2 <= "11101";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00011";
        s_READADDR2 <= "11100";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00100";
        s_READADDR2 <= "11011";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00101";
        s_READADDR2 <= "11010";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00110";
        s_READADDR2 <= "11001";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "00111";
        s_READADDR2 <= "11000";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01000";
        s_READADDR2 <= "10111";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01001";
        s_READADDR2 <= "10110";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01010";
        s_READADDR2 <= "10101";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01011";
        s_READADDR2 <= "10100";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01100";
        s_READADDR2 <= "10011";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01101";
        s_READADDR2 <= "10010";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01110";
        s_READADDR2 <= "10001";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "01111";
        s_READADDR2 <= "10000";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10000";
        s_READADDR2 <= "01111";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10001";
        s_READADDR2 <= "01110";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10010";
        s_READADDR2 <= "01101";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10011";
        s_READADDR2 <= "01100";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10100";
        s_READADDR2 <= "01011";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10101";
        s_READADDR2 <= "01010";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10110";
        s_READADDR2 <= "01001";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "10111";
        s_READADDR2 <= "01000";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11000";
        s_READADDR2 <= "00111";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11001";
        s_READADDR2 <= "00110";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11010";
        s_READADDR2 <= "00101";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11011";
        s_READADDR2 <= "00100";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11100";
        s_READADDR2 <= "00011";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11101";
        s_READADDR2 <= "00010";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11110";
        s_READADDR2 <= "00001";
        wait for gCLK_HPER * 2;

        s_READADDR1 <= "11111";
        s_READADDR2 <= "00000";
        wait for gCLK_HPER * 2;

    end process;

end mixed;