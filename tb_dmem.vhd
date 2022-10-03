-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_dmem.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--              
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- For logic types I/O
library std;
use std.env.all; -- For hierarchical/external signals

-- Create a test entity
entity tb_dmem is
    generic (gCLK_HPER : time := 25 ns); -- Generic for half of the clock cycle period
end tb_dmem;

architecture mixed of tb_dmem is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component mem is
        generic(
            DATA_WIDTH : natural := 32;
            ADDR_WIDTH : natural := 10);
        port(
            clk : in std_logic;
            addr : in std_logic_vector;
            data : in std_logic_vector;
            we : in std_logic;
            q : out std_logic_vector);
        end component;

    signal s_CLK : std_logic := '0';
    signal s_WE : std_logic := '0';
    signal s_OUT : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_ADDR : std_logic_vector(9 downto 0) := "0000000000";
    signal s_DATA : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal s_TEMP : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

    DUT0 : mem
    generic map(32, 10)
    port map(
        clk => s_CLK,
        addr => s_ADDR,
        data => s_DATA,
        we => s_WE,
        q => s_OUT);

    P_CLK : process
    begin
        s_CLK <= '1';
        wait for gCLK_HPER;
        s_CLK <= '0';
        wait for gCLK_HPER;
    end process;
    
    P_TEST_CASES : process
    begin
        wait for gCLK_HPER/2;

        -- Read address 0
        s_ADDR <= "0000000000";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001100100";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 1
        s_ADDR <= "0000000001";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001100101";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 2
        s_ADDR <= "0000000010";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001100110";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;
        
        -- Read address 3
        s_ADDR <= "0000000011";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001100111";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 4
        s_ADDR <= "0000000100";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101000";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 5
        s_ADDR <= "0000000101";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101001";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 6
        s_ADDR <= "0000000110";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101010";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;
        
        -- Read address 7
        s_ADDR <= "0000000111";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101011";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 8
        s_ADDR <= "0000001000";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101100";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 9
        s_ADDR <= "0000001001";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101101";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

        -- Read address 10
        s_ADDR <= "0000001010";
        wait for gCLK_HPER * 2;
        -- Save the value
        s_DATA <= s_OUT;
        s_WE <= '1';
        s_ADDR <= "0001101110";
        wait for gCLK_HPER * 2;

        s_WE <= '0';
        wait for gCLK_HPER * 2;

    end process;

end mixed;