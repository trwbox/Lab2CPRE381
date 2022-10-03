-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- tb_secondDataPath.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--              
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- For logic types I/O
library std;
use std.env.all; -- For hierarchical/external signals
use std.textio.all; -- For basic I/O

-- Create a test entity
entity tb_secondDataPath is
    generic (gCLK_HPER : time := 25 ns); -- Generic for half of the clock cycle period
end tb_secondDataPath;

architecture mixed of tb_secondDataPath is 

    constant cCLK_PER : time := gCLK_HPER * 2;

    component secondDataPath is
        port(
            i_Clock : in std_logic;
            i_Reset : in std_logic;
            mem_read : in std_logic;
            mem_write : in std_logic;
            nAdd_Sub : in std_logic;
            ALUSrc : in std_logic;
            i_Immediate : in std_logic_vector;
            write_select : in std_logic_vector;
            read1_select : in std_logic_vector;
            read2_select : in std_logic_vector);
        end component;
    
    signal CLK : std_logic := '0';
    signal s_RST : std_logic := '0';
    signal s_nAdd_Sub : std_logic := '0';
    signal s_ALUSrc : std_logic := '0';
    signal s_mem_read : std_logic := '0';
    signal s_mem_write : std_logic := '0';
    signal s_Immediate : std_logic_vector(15 downto 0) := "0000000000000000";
    signal s_WRITEADDR : std_logic_vector(4 downto 0) := "00000";
    signal s_READADDR1 : std_logic_vector(4 downto 0) := "00000";
    signal s_READADDR2 : std_logic_vector(4 downto 0) := "00000";

begin
    DUT0 : secondDataPath
    port map(
        i_Clock => CLK,
        i_Reset => s_RST,
        mem_read => s_mem_read,
        mem_write => s_mem_write,
        nAdd_Sub => s_nAdd_Sub,
        ALUSrc => s_ALUSrc,
        i_Immediate => s_Immediate,
        write_select => s_WRITEADDR,
        read1_select => s_READADDR1,
        read2_select => s_READADDR2);

    P_CLK : process
    begin
        CLK <= '1';
        wait for gCLK_HPER;
        wait for gCLK_HPER;
        CLK <= '0';
        wait for gCLK_HPER;
        wait for gCLK_HPER;
    end process;

    P_TEST_CASES : process
    begin 
        wait for gCLK_HPER/2;
        -- Reset the register
        s_RST <= '1';
        wait for cCLK_PER;
        s_RST <= '0';
        wait for cCLK_PER;

        ----- Loop Number 0
        s_nAdd_Sub <= '1';
        s_mem_write <= '0';
        s_mem_read <= '0';
        s_ALUSrc <= '1';
        s_Immediate <= "0000000000000000";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "10011";
        wait for cCLK_PER * 2;

        ----- Loop Number 1
        --
        s_ALUSrc <= '1';
        s_Immediate <= "0000000100000000";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "10100";
        wait for cCLK_PER * 2;

        ----- Loop Number 2
        --
        s_ALUSrc <= '0';
        s_mem_read <= '1';

        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "00000";
        s_READADDR2 <= "10011";
        s_WRITEADDR <= "00001";
        wait for cCLK_PER * 2;

        ----- Loop Number 3
        --
        s_ALUSrc <= '0';
        s_Immediate <= "0000000000000100";

        s_READADDR1 <= "00000";
        s_READADDR2 <= "10011";
        s_WRITEADDR <= "00010";
        wait for cCLK_PER * 2;

        ----- Loop Number 4
        -- 
        s_ALUSrc <= '0';
        s_mem_read <= '0';
        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00010";
        s_WRITEADDR <= "00001";
        wait for cCLK_PER * 2;

        ----- Loop Number 5
        s_ALUSrc <= '0';
        s_mem_write <= '1';
        s_READADDR1 <= "00001";
        s_READADDR2 <= "10100";
        s_WRITEADDR <= "00001";
        wait for cCLK_PER * 2;

        ----- Loop Number 6
        -- 
        s_ALUSrc <= '0';
        s_mem_read <= '1';
        s_Immediate <= "0000000000001000";

        s_mem_write <= '0';
        s_READADDR1 <= "00000";
        s_READADDR2 <= "10011";
        s_WRITEADDR <= "00011";
        wait for cCLK_PER * 2;

        ----- Loop Number 7
        -- 
        s_ALUSrc <= '0';
        s_mem_read <= '0';
        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "00000";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "01000";
        wait for cCLK_PER * 2;

        ----- Loop Number 8
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '1';
        s_Immediate <= "0000000000000100";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "01001";
        wait for cCLK_PER * 2;

        ----- Loop Number 9
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '0';
        s_mem_read <= '1';
        s_Immediate <= "0000000000001100";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "01010";
        wait for cCLK_PER * 2;

        ----- Loop Number 10
        -- 
        s_ALUSrc <= '0';
        s_mem_read <= '0';
        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "00000";
        s_READADDR2 <= "00010";
        s_WRITEADDR <= "01011";
        wait for cCLK_PER * 2;

        ----- Loop Number 11
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '1';
        s_Immediate <= "0000000000001000";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00011";
        s_WRITEADDR <= "01100";
        wait for cCLK_PER * 2;

        ----- Loop Number 12
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '0';
        s_mem_read <= '1';
        s_Immediate <= "0000000000010000";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00100";
        s_WRITEADDR <= "01101";
        wait for cCLK_PER * 2;

        ----- Loop Number 13
        -- 
        s_ALUSrc <= '0';
        s_mem_read <= '0';
        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "00000";
        s_READADDR2 <= "00101";
        s_WRITEADDR <= "01110";
        wait for cCLK_PER * 2;

        ----- Loop Number 14
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '1';
        s_Immediate <= "0000000000001100";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00110";
        s_WRITEADDR <= "01111";
        wait for cCLK_PER * 2;

        ----- Loop Number 15
        -- 
        s_ALUSrc <= '0';
        s_Immediate <= "0000000000010100";

        s_mem_write <= '0';
        s_mem_read <= '1';

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00111";
        s_WRITEADDR <= "10000";
        wait for cCLK_PER * 2;

        ----- Loop Number 16
        -- 
        s_ALUSrc <= '0';
        s_mem_read <= '0';
        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "10000";
        s_READADDR2 <= "01000";
        s_WRITEADDR <= "10001";
        wait for cCLK_PER * 2;

        ----- Loop Number 17
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '1';
        s_Immediate <= "0000000000010000";

        s_READADDR1 <= "00000";
        s_READADDR2 <= "01001";
        s_WRITEADDR <= "10010";
        wait for cCLK_PER * 2;

        ----- Loop Number 18
        -- 
        s_ALUSrc <= '0';
        s_mem_write <= '0';
        s_mem_read <= '1';
        s_Immediate <= "0000000000011000";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "01010";
        s_WRITEADDR <= "10011";
        wait for cCLK_PER * 2;

        ----- Loop Number 19
    
        s_ALUSrc <= '0';
        s_mem_read <= '0';
        s_Immediate <= "0000000000000000";

        s_READADDR1 <= "00001";
        s_READADDR2 <= "00000";
        s_WRITEADDR <= "10100";
        wait for cCLK_PER * 2;

        ----- Loop Number 20
        -- 
        s_ALUSrc <= '1';
        s_Immediate <= "0000001000000000";
        s_READADDR1 <= "00000";
        s_READADDR2 <= "10100";
        s_WRITEADDR <= "10101";
        wait for cCLK_PER * 4;

        ----- Loop Number 21

        s_mem_write <= '1';
        s_ALUSrc <= '0';
        s_Immediate <= "1111111111111100";
        s_READADDR1 <= "10011";
        s_READADDR2 <= "10100";
        s_WRITEADDR <= "10101";
        wait for cCLK_PER * 4;

    end process;

end mixed;