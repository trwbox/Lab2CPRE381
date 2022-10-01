-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- mux2t1.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a 2 to 1 mux 
-- switch.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux2t1 is

  port (
    i_S : in std_logic;
    i_D0 : in std_logic;
    i_D1 : in std_logic;
    o_O : out std_logic);

end mux2t1;

architecture structure of mux2t1 is
  component andg2
    port (
      i_A : in std_logic;
      i_B : in std_logic;
      o_F : out std_logic);
  end component;

  component org2
    port (
      i_A : in std_logic;
      i_B : in std_logic;
      o_F : out std_logic);
  end component;

  component invg
    port (
      i_A : in std_logic;
      o_F : out std_logic);
  end component;

  signal s_inv : std_logic;
  signal s_and1 : std_logic;
  signal s_and2 : std_logic;

begin
  g_invert : invg
  port map(
    i_A => i_S,
    o_F => s_inv);

  g_and1 : andg2
  port map(
    i_A => i_D0,
    i_B => s_inv,
    o_F => s_and1);
  g_and2 : andg2
  port map(
    i_A => i_D1,
    i_B => i_S,
    o_F => s_and2);

  g_or : org2
  port map(
    i_A => s_and1,
    i_B => s_and2,
    o_F => o_O);

end structure;