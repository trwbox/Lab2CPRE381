-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- fullAdder_N.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide
-- d flip flop using structural VHDL, generics, and 
-- generate statements.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity dffg_N is 
    generic (N : integer := 32);
    port (
        i_Clock : in std_logic;
        i_Reset : in std_logic;
        i_WriteEnable : in std_logic;
        i_Data : in std_logic_vector(N - 1 downto 0);
        o_Data : out std_logic_vector(N - 1 downto 0));

end dffg_N;

architecture structural of dffg_N is
    component dffg is
        port (
            i_CLK : in std_logic;
            i_RST : in std_logic;
            i_WE : in std_logic;
            i_D : in std_logic;
            o_Q : out std_logic);
    end component;
begin
    G_NBit_dffg : for i in 0 to N - 1 generate
        DFFGI : dffg port map(
            i_CLK => i_Clock,
            i_RST => i_Reset,
            i_WE => i_WriteEnable,
            i_D => i_Data(i),
            o_Q => o_Data(i));
    end generate G_NBit_dffg;
end structural;