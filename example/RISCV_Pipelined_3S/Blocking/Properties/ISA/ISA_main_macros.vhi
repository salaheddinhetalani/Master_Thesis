--
-- GENERATED BY: SCAM TOOL
-- UPDATED BY  : SALAHEDDIN HETALANI (salaheddinhetalani@gmail.com) ON 28 Jan, 2019
--

-- CONSTRAINTS --
constraint no_reset := rst = '0';				  end constraint;
constraint no_wait  := toMemoryPort_sync and fromMemoryPort_sync; end constraint;

-- SYNC AND NOTIFY SIGNALS (1-cycle macros) --
macro fromMemoryPort_notify 		: boolean 	:= CU/MEtoCU_port_notify end macro;
macro fromMemoryPort_sync 		: boolean 	:= CU/MEtoCU_port_sync   end macro;
macro toMemoryPort_notify 		: boolean 	:= CU/CUtoME_port_notify end macro;
macro toMemoryPort_sync 		: boolean 	:= CU/CUtoME_port_sync   end macro;
macro toRegsPort_notify 		: boolean 	:= 
	if   (prev(fetch_17) and prev(getEncType(CU/MEtoCU_port.loadedData)) = ENC_I_L) then false 
	elsif(prev(execute_12)) then next(CU/CUtoRF_port_notify,2)   
	else next(CU/CUtoRF_port_notify,4) 
	end if; 
end macro;

-- STATES --
macro execute_4 	: boolean 	:= CU/section = writeDmem and CU/CUtoME_port.req = ME_WR end macro;
macro execute_5 	: boolean 	:= CU/section = readDmem and CU/CUtoME_port.req = ME_WR end macro;
macro execute_11 	: boolean 	:= CU/section = writeDmem and CU/CUtoME_port.req = ME_RD end macro;
macro execute_12 	: boolean 	:= CU/section = readDmem and CU/CUtoME_port.req = ME_RD end macro;
macro fetch_16    	: boolean 	:= CU/section = writeMem end macro;
macro fetch_17  	: boolean 	:= CU/section = readMem end macro;

-- DP SIGNALS --
macro fromMemoryPort_sig_loadedData 	: unsigned 	:= CU/MEtoCU_port.loadedData end macro;

macro fromRegsPort_sig_reg_file_01      : unsigned 	:= getRegValue(01,RF/reg_file(01)) end macro;
macro fromRegsPort_sig_reg_file_02  	: unsigned 	:= getRegValue(02,RF/reg_file(02)) end macro;
macro fromRegsPort_sig_reg_file_03  	: unsigned 	:= getRegValue(03,RF/reg_file(03)) end macro;
macro fromRegsPort_sig_reg_file_04  	: unsigned 	:= getRegValue(04,RF/reg_file(04)) end macro;
macro fromRegsPort_sig_reg_file_05  	: unsigned 	:= getRegValue(05,RF/reg_file(05)) end macro;
macro fromRegsPort_sig_reg_file_06  	: unsigned 	:= getRegValue(06,RF/reg_file(06)) end macro;
macro fromRegsPort_sig_reg_file_07  	: unsigned 	:= getRegValue(07,RF/reg_file(07)) end macro;
macro fromRegsPort_sig_reg_file_08  	: unsigned 	:= getRegValue(08,RF/reg_file(08)) end macro;
macro fromRegsPort_sig_reg_file_09  	: unsigned 	:= getRegValue(09,RF/reg_file(09)) end macro;
macro fromRegsPort_sig_reg_file_10  	: unsigned 	:= getRegValue(10,RF/reg_file(10)) end macro;
macro fromRegsPort_sig_reg_file_11  	: unsigned 	:= getRegValue(11,RF/reg_file(11)) end macro;
macro fromRegsPort_sig_reg_file_12  	: unsigned 	:= getRegValue(12,RF/reg_file(12)) end macro;
macro fromRegsPort_sig_reg_file_13  	: unsigned 	:= getRegValue(13,RF/reg_file(13)) end macro;
macro fromRegsPort_sig_reg_file_14  	: unsigned 	:= getRegValue(14,RF/reg_file(14)) end macro;
macro fromRegsPort_sig_reg_file_15  	: unsigned 	:= getRegValue(15,RF/reg_file(15)) end macro;
macro fromRegsPort_sig_reg_file_16  	: unsigned 	:= getRegValue(16,RF/reg_file(16)) end macro;
macro fromRegsPort_sig_reg_file_17  	: unsigned 	:= getRegValue(17,RF/reg_file(17)) end macro;
macro fromRegsPort_sig_reg_file_18  	: unsigned 	:= getRegValue(18,RF/reg_file(18)) end macro;
macro fromRegsPort_sig_reg_file_19  	: unsigned 	:= getRegValue(19,RF/reg_file(19)) end macro;
macro fromRegsPort_sig_reg_file_20  	: unsigned 	:= getRegValue(20,RF/reg_file(20)) end macro;
macro fromRegsPort_sig_reg_file_21  	: unsigned 	:= getRegValue(21,RF/reg_file(21)) end macro;
macro fromRegsPort_sig_reg_file_22  	: unsigned 	:= getRegValue(22,RF/reg_file(22)) end macro;
macro fromRegsPort_sig_reg_file_23  	: unsigned 	:= getRegValue(23,RF/reg_file(23)) end macro;
macro fromRegsPort_sig_reg_file_24  	: unsigned 	:= getRegValue(24,RF/reg_file(24)) end macro;
macro fromRegsPort_sig_reg_file_25  	: unsigned 	:= getRegValue(25,RF/reg_file(25)) end macro;
macro fromRegsPort_sig_reg_file_26  	: unsigned 	:= getRegValue(26,RF/reg_file(26)) end macro;
macro fromRegsPort_sig_reg_file_27  	: unsigned 	:= getRegValue(27,RF/reg_file(27)) end macro;
macro fromRegsPort_sig_reg_file_28  	: unsigned 	:= getRegValue(28,RF/reg_file(28)) end macro;
macro fromRegsPort_sig_reg_file_29  	: unsigned 	:= getRegValue(29,RF/reg_file(29)) end macro;
macro fromRegsPort_sig_reg_file_30  	: unsigned 	:= getRegValue(30,RF/reg_file(30)) end macro;
macro fromRegsPort_sig_reg_file_31  	: unsigned 	:= getRegValue(31,RF/reg_file(31)) end macro;

macro toMemoryPort_sig_addrIn 	    	: unsigned 	:= CU/CUtoME_port.addrIn end macro;
macro toMemoryPort_sig_dataIn 	    	: unsigned 	:= CU/CUtoME_port.dataIn end macro;
macro toMemoryPort_sig_mask 	        : ME_MaskType 	:= CU/CUtoME_port.mask end macro;
macro toMemoryPort_sig_req 	        : ME_AccessType := CU/CUtoME_port.req end macro;

macro toRegsPort_sig_dst 	  	: unsigned 	:= 
	if(prev(execute_12)) then next(CU/CUtoRF_port.dst,2)
	else next(CU/CUtoRF_port.dst,4) 
	end if;
end macro;
macro toRegsPort_sig_dstData      	: unsigned 	:= 
	if(prev(execute_12)) then next(CU/CUtoRF_port.dstData,2)
	else next(CU/CUtoRF_port.dstData,4) 
	end if;
end macro;

-- VISIBLE REGISTERS --
macro memoryAccess_addrIn  	: unsigned 	:= CU/CUtoME_port.addrIn end macro;
macro memoryAccess_dataIn  	: unsigned 	:= CU/CUtoME_port.dataIn end macro;
macro memoryAccess_mask    	: ME_MaskType 	:= CU/CUtoME_port.mask end macro;
macro memoryAccess_req   	: ME_AccessType := CU/CUtoME_port.req end macro;
macro pcReg                	: unsigned 	:= CU/pc end macro;  

macro regfileWrite_dst       	: unsigned 	:= 
	if(prev(execute_12)) then next(CU/CUtoRF_port.dst,2)
	else next(CU/CUtoRF_port.dst,4) 
	end if;
end macro;
macro regfileWrite_dstData      : unsigned 	:= 
	if (prev(execute_12)) then next(CU/CUtoRF_port.dstData,2)
	else next(CU/CUtoRF_port.dstData,4) 
	end if;
end macro;

macro temp_dst : unsigned := if (execute_11 or execute_12) then CU/DS_s2.regRdAddr else 0 end if; end macro; 

-- Forwarding Unit --
macro getRegValue(reg_num: unsigned;reg_signal: unsigned) : unsigned := 
	if   ((CU/DEtoCU_port.regRs1Addr_s1 = CU/DS_s3.regRdAddr or CU/DEtoCU_port.regRs2Addr_s1 = CU/DS_s3.regRdAddr) and CU/DS_s3.regRdAddr = reg_num and CU/DS_s3.encType = ENC_I_L) then CU/loadedData
	elsif((CU/DEtoCU_port.regRs1Addr_s1 = CU/DS_s3.regRdAddr or CU/DEtoCU_port.regRs2Addr_s1 = CU/DS_s3.regRdAddr) and CU/DS_s3.regRdAddr = reg_num and not(CU/DS_s3.regRdAddr = CU/DS_s2.regRdAddr) and (CU/DS_s3.encType = ENC_I_J or CU/DS_s3.encType = ENC_J)) then unsigned(CU/DS_s3.pc + 4)(31 downto 0)
	elsif((CU/DEtoCU_port.regRs1Addr_s1 = CU/DS_s3.regRdAddr or CU/DEtoCU_port.regRs2Addr_s1 = CU/DS_s3.regRdAddr) and CU/DS_s3.regRdAddr = reg_num and not(CU/DS_s3.regRdAddr = CU/DS_s2.regRdAddr)) then CU/DS_s3.aluResult
	elsif((CU/DEtoCU_port.regRs1Addr_s1 = CU/DS_s2.regRdAddr or CU/DEtoCU_port.regRs2Addr_s1 = CU/DS_s2.regRdAddr) and CU/DS_s2.regRdAddr = reg_num and (CU/DS_s2.encType = ENC_I_J or CU/DS_s2.encType = ENC_J)) then unsigned(CU/DS_s2.pc + 4)(31 downto 0)
	elsif((CU/DEtoCU_port.regRs1Addr_s1 = CU/DS_s2.regRdAddr or CU/DEtoCU_port.regRs2Addr_s1 = CU/DS_s2.regRdAddr) and CU/DS_s2.regRdAddr = reg_num) then CU/ALtoCU_port.aluResult
	else reg_signal;
	end if;
end macro;