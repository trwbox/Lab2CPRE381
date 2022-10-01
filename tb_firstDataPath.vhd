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

architecture mixed of tb_mipsRegister is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component firstDataPath is
        port(
            -- TODO Add this component
        );
        end component;
    
    signal CLK, reset : std_logic := '0';

begin

    DUT0 : firstDataPath
    port map(
        -- TODO do this port mapping
    );

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