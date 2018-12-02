--
-- Created by deutschmann on 14.02.18
--

library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.SCAM_Model_types.all;

entity CPU_tb is
end entity CPU_tb;

architecture sim of CPU_tb is

    component Core is
        port(
            clk                : in  std_logic;
            rst                : in  std_logic;
            CUtoME_port        : out COtoME_IF;
            CUtoME_port_sync   : in  bool;
            CUtoME_port_notify : out bool;
            MEtoCU_port        : in  MEtoCO_IF;
            MEtoCU_port_sync   : in  bool;
            MEtoCU_port_notify : out bool
        );
    end component;

    component Memory is
        port(    
            clk                  : in  std_logic;
            rst                  : in  std_logic;
            CtlToMem_port        : in  COtoME_IF;
            CtlToMem_port_sync   : in  bool;
            CtlToMem_port_notify : out bool;
            MemToCtl_port        : out MEtoCO_IF;
            MemToCtl_port_sync   : in  bool;
            MemToCtl_port_notify : out bool
        );
    end component;

    signal clk : std_logic := '0';
    signal rst : std_logic;

    signal CUtoME_port        : COtoME_IF;
    signal CUtoME_port_sync   : bool;
    signal CUtoME_port_notify : bool;
    signal MEtoCU_port        : MEtoCO_IF;
    signal MEtoCU_port_sync   : bool;
    signal MEtoCU_port_notify : bool;

begin

    -- CLOCK
    clk <= not clk  after  10 ns;

    -- RESET
    rst <= '1', '0' after  20 ns;

    --------------- INSTANTIATION ----------------
    CO: Core
        port map (
            clk                => clk,
            rst                => rst,
            CUtoME_port        => CUtoME_port,
            CUtoME_port_sync   => CUtoME_port_sync,
            CUtoME_port_notify => CUtoME_port_notify,
            MEtoCU_port        => MEtoCU_port,
            MEtoCU_port_sync   => MEtoCU_port_notify,
            MEtoCU_port_notify => MEtoCU_port_sync
        );

    ME: Memory
        port map (
            clk                  => clk,
            rst                  => rst,
            CtlToMem_port        => CUtoME_port,
            CtlToMem_port_sync   => CUtoME_port_notify,
            CtlToMem_port_notify => CUtoME_port_sync,
            MemToCtl_port        => MEtoCU_port,
            MemToCtl_port_sync   => MEtoCU_port_sync,
            MemToCtl_port_notify => MEtoCU_port_notify
        );

    stimuli: process
    begin

        wait for 40 ns;

        while not (MEtoCU_port.loadedData = to_unsigned(1048691, 32)) loop
            wait for 20 ns;
        end loop;

        report "simulation finished successfully" severity FAILURE;

    end process stimuli;

end architecture;
