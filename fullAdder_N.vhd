-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- fullAdder_N.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide
-- ripple carry fulladder using structural VHDL, generics, and 
-- generate statements.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity fullAdder_N is
  generic (N : integer := 16); -- Generic of type integer for input/output data width. Default value is 32.
  port (
    i_SA : in std_logic_vector(N - 1 downto 0);
    i_SB : in std_logic_vector(N - 1 downto 0);
    i_Carry : in std_logic;
    o_Sum : out std_logic_vector(N - 1 downto 0);
    o_Carry : out std_logic);

end fullAdder_N;

architecture structural of fullAdder_N is

  component fullAdder is
    port (
      i_A : in std_logic;
      i_B : in std_logic;
      i_C : in std_logic;
      o_S : out std_logic;
      o_C : out std_logic);
  end component;
  signal carry_vector : std_logic_vector(N - 1 downto 0);
begin
    entryAdder : fullAdder port map(
        i_A => i_SA(0),
        i_B => i_SB(0),
        i_C => i_Carry,
        o_S => o_Sum(0),
        o_C => carry_vector(0));
    -- Instantiate N adder instances.
    G_NBit_ADD : for i in 1 to N - 2 generate
      ADDER : fullAdder port map(
        i_A => i_SA(i), -- ith instance's A input hooked up to ith A input.
        i_B => i_SB(i),
        i_C => carry_vector(i - 1),
        o_S => o_Sum(i),
        o_C => carry_vector(i)); -- ith instance's data output hooked up to ith data output.
    end generate G_NBit_ADD;
    
    endingAdder : fullAdder port map(
        i_A => i_SA(N - 1),
        i_B => i_SB(N - 1),
        i_C => carry_vector(N - 2),
        o_S => o_Sum(N - 1),
        o_C => o_Carry);
--signal o_C => carry_vector(N - 1);

end structural;