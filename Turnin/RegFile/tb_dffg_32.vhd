-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_dffg_32.vhd
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
entity tb_dffg_32 is
    generic (gCLK_HPER : time := 10 ns); -- Generic for half of the clock cycle period
end tb_dffg_32;

architecture mixed of tb_dffg_32 is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component dffg_N is 
        generic (N : integer := 32);
        port (
            i_Clock : in std_logic;
            i_Reset : in std_logic;
            i_WriteEnable : in std_logic;
            i_Data : in std_logic_vector;
            o_Data : out std_logic_vector);
    end component;

    signal CLK, reset : std_logic := '0';

    signal s_OUT : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_RST : std_logic := '0';
    signal s_WE : std_logic := '0';
    signal s_D : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

    DUT0 : dffg_N
    generic map(32)
    port map(
        i_Clock => CLK,
        i_Reset => s_RST,
        i_WriteEnable => s_WE,
        i_Data => s_D,
        o_Data => s_OUT);

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

        -- Test case 1:
        -- reset high should set the whole register to zero
        s_RST <= '1';
        s_D <= "00000000000000000000000000000000";
        wait for gCLK_HPER * 2;

        -- Test case 2:
        -- Have all ones, but do not write
        s_RST <= '0';
        s_WE <= '0';
        s_D <= "11111111111111111111111111111111";
        wait for gCLK_HPER * 6;

        -- Test case 3:
        -- Write those ones to the register
        s_WE <= '1';
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        s_D <= "10101010101010101010101010101010";
        wait for gCLK_HPER * 6;

        s_RST <= '1';
        wait for gCLK_HPER * 2;

        s_RST <= '0';
        s_WE <= '1';
        wait for gCLK_HPER * 4;

        s_WE <= '0';
        s_D <= "01010101010101010101010101010101";
        wait for gCLK_HPER * 10;

    end process;

end mixed;