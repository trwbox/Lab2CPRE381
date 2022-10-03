-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_sixteenToThirtyTwoExtender.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--              
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- For logic types I/O
library std;
use std.env.all; -- For hierarchical/external signals

-- Create a test entity
entity tb_sixteenToThirtyTwoExtender is
    generic (gCLK_HPER : time := 25 ns); -- Generic for half of the clock cycle period
end tb_sixteenToThirtyTwoExtender;

architecture mixed of tb_sixteenToThirtyTwoExtender is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component sixteenToThrityTwoExtender is
        port(
            i_value : in std_logic_vector;
            o_value : out std_logic_vector;
            i_signExtenstion : in std_logic);
        end component;

    signal s_CLK : std_logic := '0';
    signal s_EXTENSION : std_logic := '0';
    signal s_VALUE : std_logic_vector(15 downto 0) := "0000000000000000";
    signal s_OUT : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

    DUT0 : sixteenToThrityTwoExtender
    port map(
        i_value => s_VALUE,
        i_signExtenstion => s_EXTENSION,
        o_value => s_OUT);

    P_CLK : process
    begin
        s_CLK <= '1';
        wait for gCLK_HPER;
        s_CLK <= '0';
        wait for gCLK_HPER;
    end process;

    P_TEST_CASES : process
    begin
        wait for gCLK_HPER * 2;
        
        -- Test with 0 extension
        s_VALUE <= "1111111111111111";

        wait for gCLK_HPER * 2;

        -- Test with extension
        s_EXTENSION <= '1';
        
        wait for gCLK_HPER * 2;

        -- Test with 0 extension
        s_EXTENSION <= '0';
        s_VALUE <= "0111111111111111";

        wait for gCLK_HPER * 2;

        -- Test with extension
        s_EXTENSION <= '1';
        
        wait for gCLK_HPER * 2;
    end process;
end mixed;