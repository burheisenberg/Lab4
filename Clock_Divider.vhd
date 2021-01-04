----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:58:13 12/18/2020 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    Port ( CLK : in  STD_LOGIC;
           HALF_HZ_CLK : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal counter	: STD_LOGIC_VECTOR (25 downto 0) := (OTHERS => '0');
signal wire		: std_logic := '0';
--constant one_second	:	std_logic_vector := "1011111010111100001000000";
constant half_second	:	std_logic_vector := "0101111101011110000100000";

begin



divide	:	process(clk)

				begin
				
				if (rising_edge(clk)) then
								
					if (counter < half_second) then
						
							counter <= counter + '1';
							
					else
							counter <= (OTHERS => '0');
							wire <= not wire;
							
					end if;
								
				end if;
				
				end process divide;
				
			HALF_HZ_CLK <= wire; 

end Behavioral;

