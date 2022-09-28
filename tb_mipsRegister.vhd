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

    signal s_OUT : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
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

        

    end process;

end mixed;