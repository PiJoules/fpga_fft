-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Mon Jan 09 13:52:27 2017
-- Host        : ECE-BSN615-09 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/lc599.DREXEL/fft_test/fft_test.srcs/sources_1/ip/fft_block/fft_block_stub.vhdl
-- Design      : fft_block
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fft_block is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_config_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_config_tvalid : in STD_LOGIC;
    s_axis_config_tready : out STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    s_axis_data_tlast : in STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tready : in STD_LOGIC;
    m_axis_data_tlast : out STD_LOGIC;
    event_frame_started : out STD_LOGIC;
    event_tlast_unexpected : out STD_LOGIC;
    event_tlast_missing : out STD_LOGIC;
    event_status_channel_halt : out STD_LOGIC;
    event_data_in_channel_halt : out STD_LOGIC;
    event_data_out_channel_halt : out STD_LOGIC
  );

end fft_block;

architecture stub of fft_block is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_config_tdata[15:0],s_axis_config_tvalid,s_axis_config_tready,s_axis_data_tdata[31:0],s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tlast,m_axis_data_tdata[31:0],m_axis_data_tvalid,m_axis_data_tready,m_axis_data_tlast,event_frame_started,event_tlast_unexpected,event_tlast_missing,event_status_channel_halt,event_data_in_channel_halt,event_data_out_channel_halt";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xfft_v9_0_10,Vivado 2016.2";
begin
end;
