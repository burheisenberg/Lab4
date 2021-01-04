----------------------------------------------------------------------------------
-- COMPANY: 	KOC UNIVERSITY
-- ENGINEER: 	ONURHAN OZTURK
-- 
-- CREATE DATE:    18:21:21 04/26/2016 
-- DESIGN NAME: 	
-- MODULE NAME:    HUNDREDHERTZ_CLOCK_GENERATOR- BEHAVIORAL 
-- PROJECT NAME: 	 SSSLIB
-- TARGET DEVICES: SPARTAN 3E
-- TOOL VERSIONS: 
-- DESCRIPTION: 
--
-- DEPENDENCIES: 
--
-- REVISION: 
-- REVISION 0.01 - FILE CREATED
-- ADDITIONAL COMMENTS: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HUNDREDHZ_CLOCK_GENERATOR is
    Port ( MCLK : in  STD_LOGIC;
           HUNDREDHZCLOCK : out  STD_LOGIC);
end HUNDREDHZ_CLOCK_GENERATOR;

architecture Behavioral of HUNDREDHZ_CLOCK_GENERATOR is

SIGNAL COUNTER : STD_LOGIC_VECTOR(18 DOWNTO 0) := "0000000000000000000";

begin

CLK_PROCESS: PROCESS(MCLK)

BEGIN
	--INCREMENT COUNTER
	IF(MCLK'EVENT AND MCLK = '1') THEN
		IF(COUNTER < "0111101000010010000") THEN
			COUNTER <= COUNTER + 1;
		ELSE
			COUNTER <= "0000000000000000000";
		END IF;	
	END IF;
END PROCESS;
--END OF CLOCK PROCESS

HUNDREDHZCLOCK <= '1' WHEN COUNTER < "0011110100001001000" ELSE '0';

end Behavioral;

