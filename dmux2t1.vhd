-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- mux2t1.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a dataflow 
-- 2 to 1 mux switch.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity dmux2t1 is

  port (
    i_S : in std_logic;
    i_D0 : in std_logic;
    i_D1 : in std_logic;
    o_O : out std_logic);

end dmux2t1;

architecture dataflow of dmux2t1 is
begin
  o_O <= i_D0 when i_S = '0' else
    i_D1 when i_S = '1';

end dataflow;