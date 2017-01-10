----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2017 10:56:37 AM
-- Design Name: 
-- Module Name: fft_testbench - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fft_testbench is
--  Port ( );
end fft_testbench;

architecture Behavioral of fft_testbench is

    component fft_test_top
        port(clk: in std_logic;
             input_data: in std_logic_vector(31 downto 0);
             fft_output: out std_logic_vector(31 downto 0));
    end component;
    
    signal clk: std_logic := '0';
    signal input: std_logic_vector(31 downto 0) := (31 downto 0 => '0');
    signal output: std_logic_vector(31 downto 0);

    signal state: std_logic := '0';

begin

    FFT_TEST: fft_test_top port map(
        clk => clk, input_data => input, fft_output => output
    );
    
    -- Clock toggle
    process
        variable i: integer range 0 to 10 := 0;
    begin
        i := 0;
        while i < 10 loop
            report "marker string";
            report integer'image(i);
            --clk <= not clk;
            if clk = '0' then
                clk <= '1';
            else
                clk <= '0';
            end if;
            i := i + 1;
            wait for 50 ns;
        end loop;
        wait;
    end process;
    
    -- Pulse generator for input signal
    process(clk)
    begin
        if state = '0' then
            input(31) <= '1';
            state <= '1';
        else
            input(31) <= '0';
            state <= '0';
        end if;
    end process;

end Behavioral;
