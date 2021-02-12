library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_with_reg is
    Port ( INA1 : in  STD_LOGIC;    -- AND gate input
           INA2 : in  STD_LOGIC;    -- AND gate input
           clk : in  STD_LOGIC;    -- AND gate input
           rst_n : in  STD_LOGIC;    -- AND gate input
           OA   : out STD_LOGIC);    -- AND gate output
end and_with_reg;

architecture Behavioral of and_with_reg is
   signal reg_input : STD_LOGIC;
begin
  reg_input <= INA1 and INA2;
  proc: process(clk)
  begin
    if rising_edge(clk) then
      if rst_n = '0' then
        OA <= '0';
      else
        OA <= reg_input;    -- 2 input AND gate
      end if;
    end if;
  end process;
end Behavioral;
