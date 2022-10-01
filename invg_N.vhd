-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- invg_N.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide
-- one's complement inverter using structural VHDL, generics, and 
-- generate statements.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity invg_N is
  generic (N : integer := 16); -- Generic of type integer for input/output data width. Default value is 32.
  port (
    i_A : in std_logic_vector(N - 1 downto 0);
    o_F : out std_logic_vector(N - 1 downto 0));

end invg_N;

architecture structural of invg_N is

  component invg is
    port (
      i_A : in std_logic;
      o_F : out std_logic);
  end component;

begin

  -- Instantiate N mux instances.
  G_NBit_INV : for i in 0 to N - 1 generate
    INVI : invg port map(
      i_A => i_A(i), -- ith instance's A input hooked up to ith A input.
      o_F => o_F(i)); -- ith instance's data output hooked up to ith data output.
  end generate G_NBit_INV;

end structural;