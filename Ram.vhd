----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:10 01/23/2023 
-- Design Name: 
-- Module Name:    Ram - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity Ram is
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
end Ram;

architecture Behavioral of Ram is
type mem IS array (d- 1 downto 0) of std_logic_vector(width - 1 downto 0);
signal memory : mem;

begin
    process(rst, r, w, addr, data_in, clk)
    begin
        if (rst = '0') then --(active low)
				memory (0) <= "00000001"; 
				memory (1) <= "11000101";
				memory (2) <= "00110111";
				memory (3) <= "10111100";
				memory (4) <= "11100011";
				memory (5) <= "10001111";
				memory (6) <= "00110000";
				memory (7) <= "01001010";
				memory (8) <= "00111011";
				memory (9) <= "11000011";
				memory (10) <= "10011100";
				memory (11) <= "01101101";
				memory (12) <= "01111110";
				memory (13) <= "00011111";
				memory (14) <= "11100000";
				memory (15) <= "00000000";
				memory (16) <= "00110011";
				memory (17) <= "11101111";
				memory (18) <= "00111100"; 
				memory (19) <= "00110011";
				memory (20) <= "01100111";
				memory (21) <= "00111001";
				memory (22) <= "01011100";
				memory (23) <= "10010010";
				memory (24) <= "00011010";
				memory (25) <= "11100101";
				memory (26) <= "10101000";
				memory (27) <= "01001100";
				memory (28) <= "01110011";
				memory (29) <= "11110001";
				memory (30) <= "11000011";
				memory (31) <= "01111000";
				data_out <= "00000000";
				
		  elsif (rising_edge(clk)) then
				if(r = '1' and w='0') then --read! 
               data_out <= memory(conv_integer(addr));
					
				elsif(w = '1' and r='0') then -- write!
               memory(conv_integer(addr)) <= data_in;
            end if;
				
        end if;
    end process;

end Behavioral;
