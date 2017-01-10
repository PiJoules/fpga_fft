----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/09/2017 01:26:20 PM
-- Design Name: 
-- Module Name: fft_test_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fft_test_top is
    port(clk: in std_logic;
         input_data: in std_logic_vector(31 downto 0);  -- data from signal to be fft'd
         fft_output: out std_logic_vector(31 downto 0));
end fft_test_top;

architecture Behavioral of fft_test_top is

component fft_block
    PORT (
        aclk : IN STD_LOGIC;  -- Rising edge clock
        s_axis_config_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);  -- access configuration
        s_axis_config_tvalid : IN STD_LOGIC;
        s_axis_config_tready : OUT STD_LOGIC;
        s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_data_tvalid : IN STD_LOGIC;
        s_axis_data_tready : OUT STD_LOGIC;
        s_axis_data_tlast : IN STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tlast : OUT STD_LOGIC;
        m_axis_data_tready: in std_logic;
        event_frame_started : OUT STD_LOGIC;
        event_tlast_unexpected : OUT STD_LOGIC;
        event_tlast_missing : OUT STD_LOGIC;
        event_status_channel_halt: out std_logic;
        event_data_in_channel_halt : OUT STD_LOGIC;
        event_data_out_channel_halt: out std_logic
    );
end component;

-- Declared variables
constant FWD_INV: std_logic_vector(0 downto 0) := "1";  -- 1=forward transform, 0=inverse transform
constant SCALE_SCH: std_logic_vector(9 downto 0) := "0000000000";  -- no scaling for now
constant CONFIG_TDATA: std_logic_vector(15 downto 0) := "00000" & SCALE_SCH & FWD_INV;

begin

fft_block_inst: fft_block 
port map(
    aclk => clk,
    s_axis_config_tdata => CONFIG_TDATA,
    s_axis_config_tready => open,  -- don't care about this for now, goes high when ready
    s_axis_config_tvalid => '1',  -- signal sent by external master to signal that it is able to provide data; yes we are able tp provide data
    s_axis_data_tdata => input_data,
    s_axis_data_tvalid => '1',  -- another external assertion that the upstream master is able to provide data
    s_axis_data_tready => open,  -- indicates that the core ip is ready to receive data
    s_axis_data_tlast => '0',  -- used to generate events event_tlast_unexpected and event_tlast_missing; keep 0 for no events for now
    m_axis_data_tdata => fft_output,  -- bits 15-0 are real, 31-16 are imaginary
    m_axis_data_tlast => open,  -- ???
    m_axis_data_tready => '1', -- asserted by external slave to indicate that it is ready to accept data
    m_axis_data_tvalid => open,
    
    event_frame_started => open,
    event_tlast_unexpected => open,
    event_tlast_missing => open,
    event_status_channel_halt => open,
    event_data_in_channel_halt => open,
    event_data_out_channel_halt => open
);

end Behavioral;
