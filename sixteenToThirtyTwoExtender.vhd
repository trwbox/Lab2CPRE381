-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- sixteenToThrityTwoExtender.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity sixteenToThrityTwoExtender is 
    port (
        i_value : in std_logic_vector(15 downto 0);
        o_value : out std_logic_vector(31 downto 0);
        i_signExtenstion : in std_logic);

end sixteenToThrityTwoExtender;

architecture mixed of sixteenToThrityTwoExtender is
    signal out_vector : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin

    out_vector(0) <= i_value(0); 
    out_vector(1) <= i_value(1);
    out_vector(2) <= i_value(2);
    out_vector(3) <= i_value(3);
    out_vector(4) <= i_value(4);
    out_vector(5) <= i_value(5);
    out_vector(6) <= i_value(6);
    out_vector(7) <= i_value(7);
    out_vector(8) <= i_value(8);
    out_vector(9) <= i_value(9);
    out_vector(10) <= i_value(10);
    out_vector(11) <= i_value(11);
    out_vector(12) <= i_value(12);
    out_vector(13) <= i_value(13);
    out_vector(14) <= i_value(14);
    out_vector(15) <= i_value(15);

    process(i_value, i_signExtenstion)
    begin
        if i_signExtenstion = '1' then
            out_vector(16) <= i_value(15);
            out_vector(17) <= i_value(15);
            out_vector(18) <= i_value(15);
            out_vector(19) <= i_value(15);
            out_vector(20) <= i_value(15);
            out_vector(21) <= i_value(15);
            out_vector(22) <= i_value(15);
            out_vector(23) <= i_value(15);
            out_vector(24) <= i_value(15);
            out_vector(25) <= i_value(15);
            out_vector(26) <= i_value(15);
            out_vector(27) <= i_value(15);
            out_vector(28) <= i_value(15);
            out_vector(29) <= i_value(15);
            out_vector(30) <= i_value(15);
            out_vector(31) <= i_value(15);
        else
            out_vector(16) <= '0';
            out_vector(17) <= '0';
            out_vector(18) <= '0';
            out_vector(19) <= '0';
            out_vector(20) <= '0';
            out_vector(21) <= '0';
            out_vector(22) <= '0';
            out_vector(23) <= '0';
            out_vector(24) <= '0';
            out_vector(25) <= '0';
            out_vector(26) <= '0';
            out_vector(27) <= '0';
            out_vector(28) <= '0';
            out_vector(29) <= '0';
            out_vector(30) <= '0';
            out_vector(31) <= '0';
        end if;
    end process;

    o_value <= out_vector;
end mixed;