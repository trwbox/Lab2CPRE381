-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- thirtyTwoBitMux.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide
-- d flip flop using structural VHDL, generics, and 
-- generate statements.
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity thirtyTwoBitMux is 
    port (
        data_input0 : in std_logic_vector(31 downto 0);
        data_input1 : in std_logic_vector(31 downto 0);
        data_input2 : in std_logic_vector(31 downto 0);
        data_input3 : in std_logic_vector(31 downto 0);
        data_input4 : in std_logic_vector(31 downto 0);
        data_input5 : in std_logic_vector(31 downto 0);
        data_input6 : in std_logic_vector(31 downto 0);
        data_input7 : in std_logic_vector(31 downto 0);
        data_input8 : in std_logic_vector(31 downto 0);
        data_input9 : in std_logic_vector(31 downto 0);
        data_input10 : in std_logic_vector(31 downto 0);
        data_input11 : in std_logic_vector(31 downto 0);
        data_input12 : in std_logic_vector(31 downto 0);
        data_input13 : in std_logic_vector(31 downto 0);
        data_input14 : in std_logic_vector(31 downto 0);
        data_input15 : in std_logic_vector(31 downto 0);
        data_input16 : in std_logic_vector(31 downto 0);
        data_input17 : in std_logic_vector(31 downto 0);
        data_input18 : in std_logic_vector(31 downto 0);
        data_input19 : in std_logic_vector(31 downto 0);
        data_input20 : in std_logic_vector(31 downto 0);
        data_input21 : in std_logic_vector(31 downto 0);
        data_input22 : in std_logic_vector(31 downto 0);
        data_input23 : in std_logic_vector(31 downto 0);
        data_input24 : in std_logic_vector(31 downto 0);
        data_input25 : in std_logic_vector(31 downto 0);
        data_input26 : in std_logic_vector(31 downto 0);
        data_input27 : in std_logic_vector(31 downto 0);
        data_input28 : in std_logic_vector(31 downto 0);
        data_input29 : in std_logic_vector(31 downto 0);
        data_input30 : in std_logic_vector(31 downto 0);
        data_input31 : in std_logic_vector(31 downto 0);
        EN : in std_logic;
        i_SEL : in std_logic_vector(4 downto 0);
        data_output : out std_logic_vector(31 downto 0));

end thirtyTwoBitMux;

architecture mixed of thirtyTwoBitMux is

begin

process(i_SEL, EN)
begin
    data_output <= "00000000000000000000000000000000";
    if (EN = '1') then
        case i_SEL is
            -- Get the correct input and output
            when "00000" => data_output <= data_input0;
            when "00001" => data_output <= data_input1;
            when "00010" => data_output <= data_input2;
            when "00011" => data_output <= data_input3;
            when "00100" => data_output <= data_input4;
            when "00101" => data_output <= data_input5;
            when "00110" => data_output <= data_input6;
            when "00111" => data_output <= data_input7;
            when "01000" => data_output <= data_input8;
            when "01001" => data_output <= data_input9;
            when "01010" => data_output <= data_input10;
            when "01011" => data_output <= data_input11;
            when "01100" => data_output <= data_input12;
            when "01101" => data_output <= data_input13;
            when "01110" => data_output <= data_input14;
            when "01111" => data_output <= data_input15;
            when "10000" => data_output <= data_input16;
            when "10001" => data_output <= data_input17;
            when "10010" => data_output <= data_input18;
            when "10011" => data_output <= data_input19;
            when "10100" => data_output <= data_input20;
            when "10101" => data_output <= data_input21;
            when "10110" => data_output <= data_input22;
            when "10111" => data_output <= data_input23;
            when "11000" => data_output <= data_input24;
            when "11001" => data_output <= data_input25;
            when "11010" => data_output <= data_input26;
            when "11011" => data_output <= data_input27;
            when "11100" => data_output <= data_input28;
            when "11101" => data_output <= data_input29;
            when "11110" => data_output <= data_input30;
            when "11111" => data_output <= data_input31;
            -- Prevent things from happening if it breaks
            when others => data_output <= "00000000000000000000000000000000";
        end case;
    end if;
end process;

end mixed;