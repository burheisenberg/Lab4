----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:26:40 12/25/2020 
-- Design Name: 
-- Module Name:    SequentialLogic - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;


entity SequentialLogic is
    Port ( CLK 		: in  STD_LOGIC;
           LEFT 		: in  STD_LOGIC;
           RIGHT 		: in  STD_LOGIC;
			  LED_OUT	: out  STD_LOGIC_VECTOR (9 DOWNTO 0);
			  DATA_OUT	: out STD_LOGIC_VECTOR	(15 DOWNTO 0)
			  );
end SequentialLogic;

architecture Behavioral of SequentialLogic is

--CONSTANT STATE_A1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10000000001";		-- TOP LEFT LED
--CONSTANT STATE_B1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10000000010";
--CONSTANT STATE_C1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10000000100";
--CONSTANT STATE_D1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10000001000";
--CONSTANT STATE_E1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10000010000";
--CONSTANT STATE_F1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10000100000";
--CONSTANT STATE_G1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10001000000";
--CONSTANT STATE_H1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10010000000";
--CONSTANT STATE_I1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"10100000000";
--CONSTANT STATE_J1		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"01000000000";	  -- TOP RIGHT LED
--CONSTANT STATE_I2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00100000000";
--CONSTANT STATE_H2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00010000000";
--CONSTANT STATE_G2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00001000000";
--CONSTANT STATE_F2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00000100000";
--CONSTANT STATE_E2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00000010000";
--CONSTANT STATE_D2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00000001000";
--CONSTANT STATE_C2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00000000100";
--CONSTANT STATE_B2		:	STD_LOGIC_VECTOR	(10 DOWNTO 0) :=	"00000000010";


SIGNAL P_STATE, N_STATE	:	STD_LOGIC_VECTOR	(10 DOWNTO 0)  :=	(10 => '1', 0 =>'1', OTHERS => '0');
SIGNAL X, Y				:	STD_LOGIC							  := 	'0';
SIGNAL SCORE_DATA				:	STD_LOGIC_VECTOR	(15 DOWNTO 0) :=  (OTHERS => '0');

begin

		process(CLK, LEFT, RIGHT, P_STATE) is
		begin		
		
		if(rising_edge(clk)) then
				
		P_STATE <= N_STATE;
		
		IF(P_STATE(10) = '1') THEN
		
			N_STATE(10) <= NOT (P_STATE(10) AND P_STATE(8));
			N_STATE(9 DOWNTO 0) <= P_STATE(8 downto 0) & '0';
			
		
		ELSE
			N_STATE(10) <= (P_STATE(1) AND NOT P_STATE(10));
			N_STATE (9 DOWNTO 0)<= '0' & P_STATE(9 downto 1);
		
		END IF;
		
		--for the left catch
		if(p_state(9) = '1' and left = '1') then
		x <= '1';
		else x <= '0';
		end if;
		
		-- for the right catch
		if(p_state(0) = '1' and right = '1') then
		y <= '1';
		else y <= '0';
		end if;
		
		
		LED_OUT <= P_STATE(9 DOWNTO 0);

			
		end if;
			
	end process;

SCORE_COUNTER	:	process(x, y, score_data) is
						begin
					
							-- increment the left score
							if(rising_edge(x)) then
								if(score_data(11 downto 8) = "1001") then
									score_data(11 downto 8)	<= "0000";
									score_data(15 downto 12) <= score_data(15 downto 12) + '1';
								else 
									score_data(11 downto 8) <= score_data(11 downto 8) + '1';
								end if;		
							end if;
							
							-- increment the rigth score
							if(rising_edge(y)) then
								if(score_data(3 downto 0) = "1001") then
									score_data(3 downto 0)	<= "0000";
									score_data(7 downto 4) <= score_data(7 downto 4) + '1';
								else 
									score_data(3 downto 0) <= score_data(3 downto 0) + '1';
								end if;		
							end if;
					
						DATA_OUT <= SCORE_DATA;
					
						end process SCORE_COUNTER;
						
					
end Behavioral;

