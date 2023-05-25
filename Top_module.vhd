----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:02:56 01/25/2023 
-- Design Name: 
-- Module Name:    Top_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_module is
		Port(
		clk, rst: in std_logic
		);
end Top_module;

architecture structure of Top_module is
		component CPU8bit is
			port ( 
					data_in: in std_logic_vector(7 downto 0);
					data_out: out std_logic_vector(7 downto 0);
					adress: out std_logic_vector(4 downto 0);
					oe: out std_logic;
					we: out std_logic; -- Asynchronous memory interface
					rst: in std_logic;
					clk: in std_logic
				);
		end component CPU8bit;
		component Ram is
		   generic (
					d : integer := 32;
					c : INTEGER := 5; 
					width : INTEGER := 8
			);
			port (
					data_in : IN std_logic_vector(width-1 downto 0); --data array
					addr : IN std_logic_vector(c-1 downto 0); --address array
					w : IN std_logic; --wite		  
					r : IN std_logic; --read
					clk : IN std_logic; --clk is rising edge
					rst : IN std_logic; -- active low

					data_out : OUT std_logic_vector(width-1 downto 0) --data array
				);
		end component Ram;
		
		signal input_signal: std_logic_vector(7 downto 0);
		signal output_signal: std_logic_vector(7 downto 0);
		signal address_signal: std_logic_vector(4 downto 0);
		signal oe_signal: std_logic;
		signal we_signal: std_logic;
begin
	cpu8bit_instance: CPU8bit port map (
										data_in => input_signal,
										data_out => output_signal,
										adress => address_signal,
										oe => oe_signal,
										we => we_signal,
										rst => rst,
										clk => clk
										);
	ram_instance: Ram port map (
										data_in => output_signal,
										data_out => input_signal,
										addr => address_signal,
										w => we_signal,
										r => oe_signal,
										rst => rst,
										clk => clk
										);

end structure;

