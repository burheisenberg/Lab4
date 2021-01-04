----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:26:43 12/26/2020 
-- Design Name: 
-- Module Name:    TopModule - Behavioral 
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

entity TopModule is
    Port ( MCLK : in  STD_LOGIC;
           LEFT : in  STD_LOGIC;
           RIGHT : in  STD_LOGIC;
           SEVSEG_DATA : out  STD_LOGIC_VECTOR (6 downto 0);
           SEVSEG_CONTROL : out  STD_LOGIC_VECTOR (7 downto 0);
           LED_OUT : out  STD_LOGIC_VECTOR (9 downto 0));
end TopModule;

architecture Behavioral of TopModule is

SIGNAL WIRE_HALF_HZ_CLOCK : STD_LOGIC;
SIGNAL A, B, C, D			 : STD_LOGIC_VECTOR (3 DOWNTO 0);

begin

CLOCK_GENERATOR : ENTITY WORK.CLOCK_DIVIDER PORT MAP(
	CLK => MCLK,
	HALF_HZ_CLK => WIRE_HALF_HZ_CLOCK
);

SEQUENTIAL		 : ENTITY WORK.SEQUENTIALLOGIC PORT MAP(
	CLK => WIRE_HALF_HZ_CLOCK,
	LEFT => LEFT,
	RIGHT => RIGHT,
	LED_OUT => LED_OUT,
	DATA_OUT(15 DOWNTO 12)	=> A,
	DATA_OUT(11 DOWNTO 8)	=> B,
	DATA_OUT(7 DOWNTO 4) => C,
	DATA_OUT (3 DOWNTO 0) => D
);

SEVEN_SEGMENT	:	ENTITY WORK.SSSLIB PORT MAP(
	A => A,
	B => B,
	C => C,
	D => D,
	MCLK => MCLK,
	SEVSEG_DATA => SEVSEG_DATA,
	SEVSEG_CONTROL => SEVSEG_CONTROL
);


end Behavioral;

