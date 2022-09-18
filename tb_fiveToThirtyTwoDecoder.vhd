-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_fiveToThirtyTwoDecoder.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a testbench for the structural mux2t_N 
-- unit with an N value of 32.
--              
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- For logic types I/O
library std;
use std.env.all; -- For hierarchical/external signals
use std.textio.all; -- For basic I/O

-- Create a test entity
entity tb_fiveToThirtyTwoDecoder is
    generic (gCLK_HPER : time := 10 ns); -- Generic for half of the clock cycle period
end tb_fiveToThirtyTwoDecoder;

architecture mixed of tb_fiveToThirtyTwoDecoder is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component fiveToThirtyTwoDecoder is 
        port (
            data_input : in std_logic_vector;
            EN : in std_logic;
            data_output : out std_logic_vector);
    end component;

    signal CLK, reset : std_logic := '0';

    signal s_OUT : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_EN : std_logic := '0';
    signal s_IN : std_logic_vector(4 downto 0) := "00000";

begin

    DUT0 : fiveToThirtyTwoDecoder
    port map(
        data_input => s_IN,
        EN => s_EN,
        data_output => s_OUT);

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
        s_EN <= '1';

        -- Test Case 1
        -- This is testing "00000" should be an output of "00000000000000000000000000000000"
        s_IN <= "00000";
        wait for gCLK_HPER * 2;

        -- Test Case 2
        -- This is testing "00001" should be an output of "00000000000000000000000000000001"
        s_IN <= "00001";
        wait for gCLK_HPER * 2;

        -- Test Case 3
        -- This is testing "00010" should be an output of "00000000000000000000000000000010"
        s_IN <= "00010";
        wait for gCLK_HPER * 2;

        -- Test Case 4
        -- This is testing "00011" should be an output of "00000000000000000000000000000100"
        s_IN <= "00011";
        wait for gCLK_HPER * 2;

        -- Test Case 5
        -- This is testing "00100" should be an output of "00000000000000000000000000001000"
        s_IN <= "00100";
        wait for gCLK_HPER * 2;

        -- Test Case 6
        -- This is testing "00101" should be an output of "00000000000000000000000000010000"
        s_IN <= "00101";
        wait for gCLK_HPER * 2;

        -- Test Case 7
        -- This is testing "00110" should be an output of "00000000000000000000000000100000"
        s_IN <= "00110";
        wait for gCLK_HPER * 2;

        -- Test Case 8
        -- This is testing "00111" should be an output of "000000000000000000000000010000000"
        s_IN <= "00111";
        wait for gCLK_HPER * 2;

        -- Test Case 9
        -- This is testing "01000" should be an output of "00000000000000000000000010000000"
        s_IN <= "01000";
        wait for gCLK_HPER * 2;

        -- Test Case 10
        -- This is testing "01001" should be an output of "00000000000000000000000100000000"
        s_IN <= "01001";
        wait for gCLK_HPER * 2;

        -- Test Case 11
        -- This is testing "01010" should be an output of "00000000000000000000001000000000"
        s_IN <= "01010";
        wait for gCLK_HPER * 2;

        -- Test Case 12
        -- This is testing "01011" should be an output of "00000000000000000000010000000000"
        s_IN <= "01011";
        wait for gCLK_HPER * 2;

        -- Test Case 13
        -- This is testing "01100" should be an output of "00000000000000000000100000000000"
        s_IN <= "01100";
        wait for gCLK_HPER * 2;

        -- Test Case 14
        -- This is testing "01101" should be an output of "00000000000000000001000000000000"
        s_IN <= "01101";
        wait for gCLK_HPER * 2;

        -- Test Case 15
        -- This is testing "01110" should be an output of "00000000000000000010000000000000"
        s_IN <= "01110";
        wait for gCLK_HPER * 2;

        -- Test Case 16
        -- This is testing "01111" should be an output of "00000000000000000100000000000000"
        s_IN <= "01111";
        wait for gCLK_HPER * 2;

        -- Test Case 17
        -- This is testing "10000" should be an output of "00000000000000001000000000000000"
        s_IN <= "10000";
        wait for gCLK_HPER * 2;

        -- Test Case 18
        -- This is testing "10001" should be an output of "00000000000000010000000000000000"
        s_IN <= "10001";
        wait for gCLK_HPER * 2;

        -- Test Case 19
        -- This is testing "10010" should be an output of "00000000000000100000000000000000"
        s_IN <= "10010";
        wait for gCLK_HPER * 2;

        -- Test Case 20
        -- This is testing "10011" should be an output of "00000000000001000000000000000000"
        s_IN <= "10011";
        wait for gCLK_HPER * 2;

        -- Test Case 21
        -- This is testing "10100" should be an output of "00000000000010000000000000000000"
        s_IN <= "10100";
        wait for gCLK_HPER * 2;

        -- Test Case 22
        -- This is testing "10101" should be an output of "00000000000100000000000000000000"
        s_IN <= "10101";
        wait for gCLK_HPER * 2;

        -- Test Case 23
        -- This is testing "10110" should be an output of "00000000001000000000000000000000"
        s_IN <= "10110";
        wait for gCLK_HPER * 2;

        -- Test Case 24
        -- This is testing "10111" should be an output of "00000000010000000000000000000000"
        s_IN <= "10111";
        wait for gCLK_HPER * 2;

        -- Test Case 25
        -- This is testing "11000" should be an output of "00000000100000000000000000000000"
        s_IN <= "11000";
        wait for gCLK_HPER * 2;

        -- Test Case 26
        -- This is testing "11001" should be an output of "00000001000000000000000000000000"
        s_IN <= "11001";
        wait for gCLK_HPER * 2;

        -- Test Case 27
        -- This is testing "11010" should be an output of "00000010000000000000000000000000"
        s_IN <= "11010";
        wait for gCLK_HPER * 2;

        -- Test Case 28
        -- This is testing "11011" should be an output of "00000100000000000000000000000000"
        s_IN <= "11011";
        wait for gCLK_HPER * 2;

        -- Test Case 29
        -- This is testing "11100" should be an output of "00001000000000000000000000000000"
        s_IN <= "11100";
        wait for gCLK_HPER * 2;

        -- Test Case 30
        -- This is testing "11101" should be an output of "00010000000000000000000000000000"
        s_IN <= "11101";
        wait for gCLK_HPER * 2;

        -- Test Case 31
        -- This is testing "11110" should be an output of "00100000000000000000000000000000"
        s_IN <= "11110";
        wait for gCLK_HPER * 2;

        -- Test Case 32
        -- This is testing "11111" should be an output of "01000000000000000000000000000000"
        s_IN <= "11111";
        wait for gCLK_HPER * 2;

        s_EN <= '0';

        -- Test Case 33
        -- This is testing "00000" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00000";
        wait for gCLK_HPER * 2;

        -- Test Case 34
        -- This is testing "00001" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00001";
        wait for gCLK_HPER * 2;

        -- Test Case 35
        -- This is testing "00010" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00010";
        wait for gCLK_HPER * 2;

        -- Test Case 36
        -- This is testing "00011" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00011";
        wait for gCLK_HPER * 2;

        -- Test Case 37
        -- This is testing "00100" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00100";
        wait for gCLK_HPER * 2;

        -- Test Case 38
        -- This is testing "00101" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00101";
        wait for gCLK_HPER * 2;

        -- Test Case 39
        -- This is testing "00110" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00110";
        wait for gCLK_HPER * 2;

        -- Test Case 40
        -- This is testing "00111" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "00111";
        wait for gCLK_HPER * 2;

        -- Test Case 41
        -- This is testing "01000" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01000";
        wait for gCLK_HPER * 2;

        -- Test Case 42
        -- This is testing "01001" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01001";
        wait for gCLK_HPER * 2;

        -- Test Case 43
        -- This is testing "01010" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01010";
        wait for gCLK_HPER * 2;

        -- Test Case 44
        -- This is testing "01011" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01011";
        wait for gCLK_HPER * 2;

        -- Test Case 45
        -- This is testing "01100" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01100";
        wait for gCLK_HPER * 2;

        -- Test Case 46
        -- This is testing "01101" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01101";
        wait for gCLK_HPER * 2;

        -- Test Case 47
        -- This is testing "01110" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01110";
        wait for gCLK_HPER * 2;

        -- Test Case 48
        -- This is testing "01111" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "01111";
        wait for gCLK_HPER * 2;

        -- Test Case 49
        -- This is testing "10000" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10000";
        wait for gCLK_HPER * 2;

        -- Test Case 50
        -- This is testing "10001" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10001";
        wait for gCLK_HPER * 2;

        -- Test Case 51
        -- This is testing "10010" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10010";
        wait for gCLK_HPER * 2;

        -- Test Case 52
        -- This is testing "10011" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10011";
        wait for gCLK_HPER * 2;

        -- Test Case 53
        -- This is testing "10100" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10100";
        wait for gCLK_HPER * 2;

        -- Test Case 54
        -- This is testing "10101" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10101";
        wait for gCLK_HPER * 2;

        -- Test Case 55
        -- This is testing "10110" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10110";
        wait for gCLK_HPER * 2;

        -- Test Case 56
        -- This is testing "10111" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "10111";
        wait for gCLK_HPER * 2;

        -- Test Case 57
        -- This is testing "11000" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11000";
        wait for gCLK_HPER * 2;

        -- Test Case 58
        -- This is testing "11001" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11001";
        wait for gCLK_HPER * 2;

        -- Test Case 59
        -- This is testing "11010" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11010";
        wait for gCLK_HPER * 2;

        -- Test Case 60
        -- This is testing "11011" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11011";
        wait for gCLK_HPER * 2;

        -- Test Case 61
        -- This is testing "11100" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11100";
        wait for gCLK_HPER * 2;

        -- Test Case 62
        -- This is testing "11101" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11101";
        wait for gCLK_HPER * 2;

        -- Test Case 63
        -- This is testing "11110" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11110";
        wait for gCLK_HPER * 2;

        -- Test Case 64
        -- This is testing "11111" and EN = '0' should be an output of "00000000000000000000000000000000"
        s_IN <= "11111";
        wait for gCLK_HPER * 2;

    end process;

end mixed;