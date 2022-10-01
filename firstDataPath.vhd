-------------------------------------------------------------------------
-- Trent Walraven
-- Iowa State University
-------------------------------------------------------------------------
-- mipRegister.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: 
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity firstDataPath is 
    port (
        i_Clock : in std_logic;
        i_Reset : in std_logic;
        nAdd_Sub : in std_logic;
        ALUSrc : in std_logic;
        i_Immediate : in std_logic_vector(31 downto 0);
        write_select : in std_logic_vector(4 downto 0);
        read1_select : in std_logic_vector(4 downto 0);
        read2_select : in std_logic_vector(4 downto 0)
        );

end firstDataPath;

architecture structural of firstDataPath is

    component mipRegister is
        port (
            i_Clock : in std_logic;
            i_Reset : in std_logic;
            i_WriteEnable : in std_logic;
            i_Data : in std_logic_vector;
            write_select : in std_logic_vector;
            read1_select : in std_logic_vector;
            read2_select : in std_logic_vector;
            readPort1 : out std_logic_vector;
            readPort2 : out std_logic_vector);
        end component;
    
    component addSub_N is
        generic (N : integer := 32);
        port (
            i_SA : in std_logic_vector;
            i_SB : in std_logic_vector;
            i_Immediate : in std_logic_vector;
            nAdd_Sub : in std_logic;
            ALUSrc : in std_logic;
            o_Sum : out std_logic_vector);
        end component;

    signal add_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal read_port1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal read_port2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

    -- Create the register
    mainReg : mipRegister
    port map(
        i_Clock => i_Clock,
        i_Reset => i_Reset,
        i_WriteEnable => '1',
        i_Data => add_out,
        read1_select => read1_select,
        read2_select => read2_select,
        write_select => write_select,
        readPort1 => read_port1,
        readPort2 => read_port2
    );

    -- Create the adder
    mainAdder : addSub_N
    generic map(32)
    port map(
        i_SA => read_port1,
        i_SB => read_port2,
        i_Immediate => i_Immediate,
        nAdd_Sub => nAdd_Sub,
        ALUSrc => ALUSrc,
        o_Sum => add_out
    );

end structural;