-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb is
end;

architecture bench of tb is

  component and_with_reg
      Port ( INA1 : in  STD_LOGIC;
             INA2 : in  STD_LOGIC;
             clk : in  STD_LOGIC;
             rst_n : in  STD_LOGIC;
             OA   : out STD_LOGIC);
  end component;

  signal INA1: STD_LOGIC;
  signal INA2: STD_LOGIC;
  signal clk: STD_LOGIC := '0';
  signal rst_n: STD_LOGIC;
  signal OA: STD_LOGIC;

  -- constants
	-- signals
	shared variable edge_rise  	: integer    	:= -1;
	shared variable edge_fall 	: integer    	:= -1;

begin

  uut: and_with_reg port map ( INA1  => INA1,
                             INA2  => INA2,
                             clk   => clk,
                             rst_n => rst_n,
                             OA    => OA );


    -- Put initialisation code here

    ----------------    CLOCK PROCESS    ------------------------
    	simulation_clock : process
    		-- repeat the counters edge_rise & edge_fall
    		constant max_cycles    	: integer   := 300;
    	begin
    		-- set sim_clk signal
    		clk <= not(clk);
    		-- adjust
    		if (clk = '0') then
    			edge_rise := edge_rise + 1;
    		else
    			edge_fall := edge_fall + 1;
    		end if;
    		if( edge_fall = max_cycles ) then
    			edge_rise := 0;
    			edge_fall := 0;
    		end if;
    		wait for 20 ns;
    	end process simulation_clock;

      stimuli : process (clk)

    	begin
    		if(edge_rise = 0) then
    			rst_n <= '0';
    			INA1 <='0';
          INA2 <='0';
    		end if;

        if(edge_rise = 1) then
    			rst_n <= '1';
    		end if;

        if(edge_rise = 5) then
    			INA1 <='1';
          INA2 <='1';
    		end if;

    	END process;

end;
