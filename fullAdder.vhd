-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- fullAdder.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a full adder 
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity fullAdder is

  port (
    i_A : in std_logic;
    i_B : in std_logic;
    i_C : in std_logic;
    o_S : out std_logic;
    o_C : out std_logic);

end fullAdder;

architecture structure of fullAdder is
  component andg2
    port (
      i_A : in std_logic;
      i_B : in std_logic;
      o_F : out std_logic);
  end component;

  component xorg2
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

  signal s_xor1 : std_logic;
  signal s_and1 : std_logic;
  signal s_and2 : std_logic;

begin

    -- First half adder
    g_xor1 : xorg2
    port map(
        i_A => i_A,
        i_B => i_B,
        o_F => s_xor1
    );

    g_and1 : andg2
    port map(
        i_A => i_A,
        i_B => i_B,
        o_F => s_and1
    );
    
    -- Second half adder
    g_xor2 : xorg2
    port map(
        i_A => s_xor1,
        i_B => i_C,
        o_F => o_S
    );

    g_and2 : andg2
    port map(
        i_A => s_xor1,
        i_B => i_C,
        o_F => s_and2
    );

    -- Or for the carry

    g_or1 : org2
    port map(
        i_A => s_and1,
        i_B => s_and2,
        o_F => o_C
    );

end structure;