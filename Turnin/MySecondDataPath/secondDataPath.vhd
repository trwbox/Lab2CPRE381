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
use ieee.numeric_std.all;

entity secondDataPath is 
    port (
        i_Clock : in std_logic;
        i_Reset : in std_logic;
        mem_write : in std_logic;
        mem_read : in std_logic;
        nAdd_Sub : in std_logic;
        ALUSrc : in std_logic;
        i_Immediate : in std_logic_vector(15 downto 0);
        write_select : in std_logic_vector(4 downto 0);
        read1_select : in std_logic_vector(4 downto 0);
        read2_select : in std_logic_vector(4 downto 0)
        );

end secondDataPath;

architecture structural of secondDataPath is

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
    
    component sixteenToThrityTwoExtender is
        port(
            i_value : in std_logic_vector;
            o_value : out std_logic_vector;
            i_signExtenstion : in std_logic);
        end component;
    
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

    component mux2t1_N is
        generic (N : integer := 32);
        port (
            i_D0 : in std_logic_vector;
            i_D1 : in std_logic_vector;
            i_S : in std_logic;
            o_O : out std_logic_vector);
        end component;

    signal add_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal read_port1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal read_port2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal mem_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal extender1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal extend_add : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal alu_and_mem : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

    extenderOne : sixteenToThrityTwoExtender
    port map(
        i_value => i_Immediate,
        o_value => extender1,
        i_signExtenstion => '1');

    memAdder : addSub_N
    port map(
        i_SA => read_port2,
        i_SB => extender1,
        i_Immediate => "00000000000000000000000000000000",
        nAdd_Sub => '0',
        ALUSrc => '0',
        o_Sum => extend_add);
    
    mainMem : mem
    generic map(32, 10)
    port map(
        clk => i_Clock,
        addr => extend_add(9 downto 0),
        data => read_port1,
        we => mem_write,
        q => mem_out);
    
    muxing : mux2t1_N
    generic map (32)
    port map (
        i_D0 => add_out,
        i_D1 => mem_out,
        i_S => mem_read,
        o_O => alu_and_mem);

    -- Create the adder
    mainAdder : addSub_N
    generic map(32)
    port map(
        i_SA => read_port1,
        i_SB => read_port2,
        i_Immediate => extender1,
        nAdd_Sub => nAdd_Sub,
        ALUSrc => ALUSrc,
        o_Sum => add_out);


    -- Create the register
    mainReg : mipRegister
    port map(
        i_Clock => i_Clock,
        i_Reset => i_Reset,
        i_WriteEnable => '1',
        i_Data => alu_and_mem,
        read1_select => read1_select,
        read2_select => read2_select,
        write_select => write_select,
        readPort1 => read_port1,
        readPort2 => read_port2
    );
end structural;