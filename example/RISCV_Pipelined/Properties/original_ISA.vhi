-- SYNC AND NOTIFY SIGNALS (1-cycle macros) -- 
macro fromMemoryPort_notify :  boolean  := end macro; 
macro fromMemoryPort_sync   :  boolean  := end macro; 
macro toMemoryPort_notify :  boolean  := end macro; 
macro toMemoryPort_sync   :  boolean  := end macro; 
macro toRegfilePort_notify :  boolean  := end macro; 


-- DP SIGNALS -- 
macro fromMemoryPort_sig_loadedData : unsigned := end macro; 
macro fromRegfilePort_sig_reg_01 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_02 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_03 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_04 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_05 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_06 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_07 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_08 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_09 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_10 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_11 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_12 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_13 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_14 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_15 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_16 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_17 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_18 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_19 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_20 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_21 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_22 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_23 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_24 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_25 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_26 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_27 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_28 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_29 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_30 : unsigned := end macro; 
macro fromRegfilePort_sig_reg_31 : unsigned := end macro; 
macro toMemoryPort_sig_addrIn : unsigned := end macro; 
macro toMemoryPort_sig_dataIn : unsigned := end macro; 
macro toMemoryPort_sig_mask : ME_MaskType := end macro; 
macro toMemoryPort_sig_req : ME_AccessType := end macro; 
macro toRegfilePort_sig_dst : unsigned := end macro; 
macro toRegfilePort_sig_dstData : unsigned := end macro; 


--CONSTRAINTS-- 
constraint no_reset := rst = '0'; end constraint; 


-- VISIBLE REGISTERS --
macro memoryAccess_addrIn (location:boolean) : unsigned := end macro; 
macro memoryAccess_dataIn (location:boolean) : unsigned := end macro; 
macro memoryAccess_mask (location:boolean) : ME_MaskType := end macro; 
macro memoryAccess_req (location:boolean) : ME_AccessType := end macro; 
macro pcReg (location:boolean) : unsigned := end macro; 
macro regfileWrite_dst (location:boolean) : unsigned := end macro; 
macro regfileWrite_dstData (location:boolean) : unsigned := end macro; 


-- STATES -- 
macro execute_4(location:boolean) : boolean := true end macro;
macro execute_5(location:boolean) : boolean := true end macro;
macro execute_11(location:boolean) : boolean := true end macro;
macro execute_12(location:boolean) : boolean := true end macro;
macro fetch_16(location:boolean) : boolean := true end macro;
macro fetch_17(location:boolean) : boolean := true end macro;


--Operations -- 
property reset is
assume:
	 reset_sequence;
prove:
	 at t: fetch_16(true);
	 at t: memoryAccess_addrIn(true) = resize(0,32);
	 at t: memoryAccess_dataIn(true) = resize(0,32);
	 at t: memoryAccess_mask(true) = MT_W;
	 at t: memoryAccess_req(true) = ME_RD;
	 at t: pcReg(true) = resize(0,32);
	 at t: regfileWrite_dst(true) = resize(0,32);
	 at t: regfileWrite_dstData(true) = resize(0,32);
	 at t: toMemoryPort_sig_addrIn = resize(0,32);
	 at t: toMemoryPort_sig_dataIn = resize(0,32);
	 at t: toMemoryPort_sig_mask = MT_W;
	 at t: toMemoryPort_sig_req = ME_RD;
	 at t: fromMemoryPort_notify = false;
	 at t: toMemoryPort_notify = true;
	 at t: toRegfilePort_notify = false;
end property;


property execute_4_write_0 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_4(false);
	 at t: toMemoryPort_sync;
prove:
	 at t_end: execute_5(true);
	 at t_end: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t_end: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t_end: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t_end: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 during[t+1, t_end-1]: fromMemoryPort_notify = false;
	 at t_end: fromMemoryPort_notify = true;
	 during[t+1, t_end]: toMemoryPort_notify = false;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property execute_5_read_1 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_5(false);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property execute_11_write_2 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_11(false);
	 at t: toMemoryPort_sync;
prove:
	 at t_end: execute_12(true);
	 at t_end: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t_end: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t_end: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t_end: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 during[t+1, t_end-1]: fromMemoryPort_notify = false;
	 at t_end: fromMemoryPort_notify = true;
	 during[t+1, t_end]: toMemoryPort_notify = false;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property execute_12_read_3 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_12(false);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = fromMemoryPort_sig_loadedData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegfilePort_sig_dst = regfileWrite_dst_at_t;
	 at t_end: toRegfilePort_sig_dstData = fromMemoryPort_sig_loadedData_at_t;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegfilePort_notify = false;
	 at t_end: toRegfilePort_notify = true;
end property;

property fetch_16_write_4 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_16(false);
	 at t: toMemoryPort_sync;
prove:
	 at t_end: fetch_17(true);
	 at t_end: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t_end: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t_end: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t_end: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 during[t+1, t_end-1]: fromMemoryPort_notify = false;
	 at t_end: fromMemoryPort_notify = true;
	 during[t+1, t_end]: toMemoryPort_notify = false;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property fetch_17_read_5 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_S));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_U));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_J));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_I_I));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_I_L));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_I_J));
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = pcReg_at_t;
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = pcReg_at_t;
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property fetch_17_read_6 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegfilePort_sig_reg_01_at_t = fromRegfilePort_sig_reg_01@t,
	fromRegfilePort_sig_reg_02_at_t = fromRegfilePort_sig_reg_02@t,
	fromRegfilePort_sig_reg_03_at_t = fromRegfilePort_sig_reg_03@t,
	fromRegfilePort_sig_reg_04_at_t = fromRegfilePort_sig_reg_04@t,
	fromRegfilePort_sig_reg_05_at_t = fromRegfilePort_sig_reg_05@t,
	fromRegfilePort_sig_reg_06_at_t = fromRegfilePort_sig_reg_06@t,
	fromRegfilePort_sig_reg_07_at_t = fromRegfilePort_sig_reg_07@t,
	fromRegfilePort_sig_reg_08_at_t = fromRegfilePort_sig_reg_08@t,
	fromRegfilePort_sig_reg_09_at_t = fromRegfilePort_sig_reg_09@t,
	fromRegfilePort_sig_reg_10_at_t = fromRegfilePort_sig_reg_10@t,
	fromRegfilePort_sig_reg_11_at_t = fromRegfilePort_sig_reg_11@t,
	fromRegfilePort_sig_reg_12_at_t = fromRegfilePort_sig_reg_12@t,
	fromRegfilePort_sig_reg_13_at_t = fromRegfilePort_sig_reg_13@t,
	fromRegfilePort_sig_reg_14_at_t = fromRegfilePort_sig_reg_14@t,
	fromRegfilePort_sig_reg_15_at_t = fromRegfilePort_sig_reg_15@t,
	fromRegfilePort_sig_reg_16_at_t = fromRegfilePort_sig_reg_16@t,
	fromRegfilePort_sig_reg_17_at_t = fromRegfilePort_sig_reg_17@t,
	fromRegfilePort_sig_reg_18_at_t = fromRegfilePort_sig_reg_18@t,
	fromRegfilePort_sig_reg_19_at_t = fromRegfilePort_sig_reg_19@t,
	fromRegfilePort_sig_reg_20_at_t = fromRegfilePort_sig_reg_20@t,
	fromRegfilePort_sig_reg_21_at_t = fromRegfilePort_sig_reg_21@t,
	fromRegfilePort_sig_reg_22_at_t = fromRegfilePort_sig_reg_22@t,
	fromRegfilePort_sig_reg_23_at_t = fromRegfilePort_sig_reg_23@t,
	fromRegfilePort_sig_reg_24_at_t = fromRegfilePort_sig_reg_24@t,
	fromRegfilePort_sig_reg_25_at_t = fromRegfilePort_sig_reg_25@t,
	fromRegfilePort_sig_reg_26_at_t = fromRegfilePort_sig_reg_26@t,
	fromRegfilePort_sig_reg_27_at_t = fromRegfilePort_sig_reg_27@t,
	fromRegfilePort_sig_reg_28_at_t = fromRegfilePort_sig_reg_28@t,
	fromRegfilePort_sig_reg_29_at_t = fromRegfilePort_sig_reg_29@t,
	fromRegfilePort_sig_reg_30_at_t = fromRegfilePort_sig_reg_30@t,
	fromRegfilePort_sig_reg_31_at_t = fromRegfilePort_sig_reg_31@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_R);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: regfileWrite_dstData(true) = getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegfilePort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: toRegfilePort_sig_dstData = getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t)));
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegfilePort_notify = false;
	 at t_end: toRegfilePort_notify = true;
end property;

property fetch_17_read_7 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegfilePort_sig_reg_01_at_t = fromRegfilePort_sig_reg_01@t,
	fromRegfilePort_sig_reg_02_at_t = fromRegfilePort_sig_reg_02@t,
	fromRegfilePort_sig_reg_03_at_t = fromRegfilePort_sig_reg_03@t,
	fromRegfilePort_sig_reg_04_at_t = fromRegfilePort_sig_reg_04@t,
	fromRegfilePort_sig_reg_05_at_t = fromRegfilePort_sig_reg_05@t,
	fromRegfilePort_sig_reg_06_at_t = fromRegfilePort_sig_reg_06@t,
	fromRegfilePort_sig_reg_07_at_t = fromRegfilePort_sig_reg_07@t,
	fromRegfilePort_sig_reg_08_at_t = fromRegfilePort_sig_reg_08@t,
	fromRegfilePort_sig_reg_09_at_t = fromRegfilePort_sig_reg_09@t,
	fromRegfilePort_sig_reg_10_at_t = fromRegfilePort_sig_reg_10@t,
	fromRegfilePort_sig_reg_11_at_t = fromRegfilePort_sig_reg_11@t,
	fromRegfilePort_sig_reg_12_at_t = fromRegfilePort_sig_reg_12@t,
	fromRegfilePort_sig_reg_13_at_t = fromRegfilePort_sig_reg_13@t,
	fromRegfilePort_sig_reg_14_at_t = fromRegfilePort_sig_reg_14@t,
	fromRegfilePort_sig_reg_15_at_t = fromRegfilePort_sig_reg_15@t,
	fromRegfilePort_sig_reg_16_at_t = fromRegfilePort_sig_reg_16@t,
	fromRegfilePort_sig_reg_17_at_t = fromRegfilePort_sig_reg_17@t,
	fromRegfilePort_sig_reg_18_at_t = fromRegfilePort_sig_reg_18@t,
	fromRegfilePort_sig_reg_19_at_t = fromRegfilePort_sig_reg_19@t,
	fromRegfilePort_sig_reg_20_at_t = fromRegfilePort_sig_reg_20@t,
	fromRegfilePort_sig_reg_21_at_t = fromRegfilePort_sig_reg_21@t,
	fromRegfilePort_sig_reg_22_at_t = fromRegfilePort_sig_reg_22@t,
	fromRegfilePort_sig_reg_23_at_t = fromRegfilePort_sig_reg_23@t,
	fromRegfilePort_sig_reg_24_at_t = fromRegfilePort_sig_reg_24@t,
	fromRegfilePort_sig_reg_25_at_t = fromRegfilePort_sig_reg_25@t,
	fromRegfilePort_sig_reg_26_at_t = fromRegfilePort_sig_reg_26@t,
	fromRegfilePort_sig_reg_27_at_t = fromRegfilePort_sig_reg_27@t,
	fromRegfilePort_sig_reg_28_at_t = fromRegfilePort_sig_reg_28@t,
	fromRegfilePort_sig_reg_29_at_t = fromRegfilePort_sig_reg_29@t,
	fromRegfilePort_sig_reg_30_at_t = fromRegfilePort_sig_reg_30@t,
	fromRegfilePort_sig_reg_31_at_t = fromRegfilePort_sig_reg_31@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_B);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = getPCvalue_ENC_B(getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t))),fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = getPCvalue_ENC_B(getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t))),fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = getPCvalue_ENC_B(getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t))),fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property fetch_17_read_8 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegfilePort_sig_reg_01_at_t = fromRegfilePort_sig_reg_01@t,
	fromRegfilePort_sig_reg_02_at_t = fromRegfilePort_sig_reg_02@t,
	fromRegfilePort_sig_reg_03_at_t = fromRegfilePort_sig_reg_03@t,
	fromRegfilePort_sig_reg_04_at_t = fromRegfilePort_sig_reg_04@t,
	fromRegfilePort_sig_reg_05_at_t = fromRegfilePort_sig_reg_05@t,
	fromRegfilePort_sig_reg_06_at_t = fromRegfilePort_sig_reg_06@t,
	fromRegfilePort_sig_reg_07_at_t = fromRegfilePort_sig_reg_07@t,
	fromRegfilePort_sig_reg_08_at_t = fromRegfilePort_sig_reg_08@t,
	fromRegfilePort_sig_reg_09_at_t = fromRegfilePort_sig_reg_09@t,
	fromRegfilePort_sig_reg_10_at_t = fromRegfilePort_sig_reg_10@t,
	fromRegfilePort_sig_reg_11_at_t = fromRegfilePort_sig_reg_11@t,
	fromRegfilePort_sig_reg_12_at_t = fromRegfilePort_sig_reg_12@t,
	fromRegfilePort_sig_reg_13_at_t = fromRegfilePort_sig_reg_13@t,
	fromRegfilePort_sig_reg_14_at_t = fromRegfilePort_sig_reg_14@t,
	fromRegfilePort_sig_reg_15_at_t = fromRegfilePort_sig_reg_15@t,
	fromRegfilePort_sig_reg_16_at_t = fromRegfilePort_sig_reg_16@t,
	fromRegfilePort_sig_reg_17_at_t = fromRegfilePort_sig_reg_17@t,
	fromRegfilePort_sig_reg_18_at_t = fromRegfilePort_sig_reg_18@t,
	fromRegfilePort_sig_reg_19_at_t = fromRegfilePort_sig_reg_19@t,
	fromRegfilePort_sig_reg_20_at_t = fromRegfilePort_sig_reg_20@t,
	fromRegfilePort_sig_reg_21_at_t = fromRegfilePort_sig_reg_21@t,
	fromRegfilePort_sig_reg_22_at_t = fromRegfilePort_sig_reg_22@t,
	fromRegfilePort_sig_reg_23_at_t = fromRegfilePort_sig_reg_23@t,
	fromRegfilePort_sig_reg_24_at_t = fromRegfilePort_sig_reg_24@t,
	fromRegfilePort_sig_reg_25_at_t = fromRegfilePort_sig_reg_25@t,
	fromRegfilePort_sig_reg_26_at_t = fromRegfilePort_sig_reg_26@t,
	fromRegfilePort_sig_reg_27_at_t = fromRegfilePort_sig_reg_27@t,
	fromRegfilePort_sig_reg_28_at_t = fromRegfilePort_sig_reg_28@t,
	fromRegfilePort_sig_reg_29_at_t = fromRegfilePort_sig_reg_29@t,
	fromRegfilePort_sig_reg_30_at_t = fromRegfilePort_sig_reg_30@t,
	fromRegfilePort_sig_reg_31_at_t = fromRegfilePort_sig_reg_31@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_S);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: execute_4(true);
	 at t_end: memoryAccess_addrIn(true) = getALUresult(ALU_ADD,getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getImmediate(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: memoryAccess_dataIn(true) = getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: memoryAccess_mask(true) = getMemoryMask(getInstrType(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: memoryAccess_req(true) = ME_WR;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = getALUresult(ALU_ADD,getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getImmediate(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toMemoryPort_sig_dataIn = getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toMemoryPort_sig_mask = getMemoryMask(getInstrType(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toMemoryPort_sig_req = ME_WR;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property fetch_17_read_9 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_S));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_U);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: regfileWrite_dstData(true) = getALUresult_ENC_U(fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegfilePort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: toRegfilePort_sig_dstData = getALUresult_ENC_U(fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegfilePort_notify = false;
	 at t_end: toRegfilePort_notify = true;
end property;

property fetch_17_read_10 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_S));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_U));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_J);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (pcReg_at_t + getImmediate(fromMemoryPort_sig_loadedData_at_t))(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (pcReg_at_t + getImmediate(fromMemoryPort_sig_loadedData_at_t))(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: regfileWrite_dstData(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_addrIn = (pcReg_at_t + getImmediate(fromMemoryPort_sig_loadedData_at_t))(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegfilePort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: toRegfilePort_sig_dstData = (4 + pcReg_at_t)(31 downto 0);
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegfilePort_notify = false;
	 at t_end: toRegfilePort_notify = true;
end property;

property fetch_17_read_11 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegfilePort_sig_reg_01_at_t = fromRegfilePort_sig_reg_01@t,
	fromRegfilePort_sig_reg_02_at_t = fromRegfilePort_sig_reg_02@t,
	fromRegfilePort_sig_reg_03_at_t = fromRegfilePort_sig_reg_03@t,
	fromRegfilePort_sig_reg_04_at_t = fromRegfilePort_sig_reg_04@t,
	fromRegfilePort_sig_reg_05_at_t = fromRegfilePort_sig_reg_05@t,
	fromRegfilePort_sig_reg_06_at_t = fromRegfilePort_sig_reg_06@t,
	fromRegfilePort_sig_reg_07_at_t = fromRegfilePort_sig_reg_07@t,
	fromRegfilePort_sig_reg_08_at_t = fromRegfilePort_sig_reg_08@t,
	fromRegfilePort_sig_reg_09_at_t = fromRegfilePort_sig_reg_09@t,
	fromRegfilePort_sig_reg_10_at_t = fromRegfilePort_sig_reg_10@t,
	fromRegfilePort_sig_reg_11_at_t = fromRegfilePort_sig_reg_11@t,
	fromRegfilePort_sig_reg_12_at_t = fromRegfilePort_sig_reg_12@t,
	fromRegfilePort_sig_reg_13_at_t = fromRegfilePort_sig_reg_13@t,
	fromRegfilePort_sig_reg_14_at_t = fromRegfilePort_sig_reg_14@t,
	fromRegfilePort_sig_reg_15_at_t = fromRegfilePort_sig_reg_15@t,
	fromRegfilePort_sig_reg_16_at_t = fromRegfilePort_sig_reg_16@t,
	fromRegfilePort_sig_reg_17_at_t = fromRegfilePort_sig_reg_17@t,
	fromRegfilePort_sig_reg_18_at_t = fromRegfilePort_sig_reg_18@t,
	fromRegfilePort_sig_reg_19_at_t = fromRegfilePort_sig_reg_19@t,
	fromRegfilePort_sig_reg_20_at_t = fromRegfilePort_sig_reg_20@t,
	fromRegfilePort_sig_reg_21_at_t = fromRegfilePort_sig_reg_21@t,
	fromRegfilePort_sig_reg_22_at_t = fromRegfilePort_sig_reg_22@t,
	fromRegfilePort_sig_reg_23_at_t = fromRegfilePort_sig_reg_23@t,
	fromRegfilePort_sig_reg_24_at_t = fromRegfilePort_sig_reg_24@t,
	fromRegfilePort_sig_reg_25_at_t = fromRegfilePort_sig_reg_25@t,
	fromRegfilePort_sig_reg_26_at_t = fromRegfilePort_sig_reg_26@t,
	fromRegfilePort_sig_reg_27_at_t = fromRegfilePort_sig_reg_27@t,
	fromRegfilePort_sig_reg_28_at_t = fromRegfilePort_sig_reg_28@t,
	fromRegfilePort_sig_reg_29_at_t = fromRegfilePort_sig_reg_29@t,
	fromRegfilePort_sig_reg_30_at_t = fromRegfilePort_sig_reg_30@t,
	fromRegfilePort_sig_reg_31_at_t = fromRegfilePort_sig_reg_31@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_S));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_U));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_J));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_I_I);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: regfileWrite_dstData(true) = getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getImmediate(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegfilePort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: toRegfilePort_sig_dstData = getALUresult(getALUfunc(getInstrType(fromMemoryPort_sig_loadedData_at_t)),getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getImmediate(fromMemoryPort_sig_loadedData_at_t));
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegfilePort_notify = false;
	 at t_end: toRegfilePort_notify = true;
end property;

property fetch_17_read_12 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegfilePort_sig_reg_01_at_t = fromRegfilePort_sig_reg_01@t,
	fromRegfilePort_sig_reg_02_at_t = fromRegfilePort_sig_reg_02@t,
	fromRegfilePort_sig_reg_03_at_t = fromRegfilePort_sig_reg_03@t,
	fromRegfilePort_sig_reg_04_at_t = fromRegfilePort_sig_reg_04@t,
	fromRegfilePort_sig_reg_05_at_t = fromRegfilePort_sig_reg_05@t,
	fromRegfilePort_sig_reg_06_at_t = fromRegfilePort_sig_reg_06@t,
	fromRegfilePort_sig_reg_07_at_t = fromRegfilePort_sig_reg_07@t,
	fromRegfilePort_sig_reg_08_at_t = fromRegfilePort_sig_reg_08@t,
	fromRegfilePort_sig_reg_09_at_t = fromRegfilePort_sig_reg_09@t,
	fromRegfilePort_sig_reg_10_at_t = fromRegfilePort_sig_reg_10@t,
	fromRegfilePort_sig_reg_11_at_t = fromRegfilePort_sig_reg_11@t,
	fromRegfilePort_sig_reg_12_at_t = fromRegfilePort_sig_reg_12@t,
	fromRegfilePort_sig_reg_13_at_t = fromRegfilePort_sig_reg_13@t,
	fromRegfilePort_sig_reg_14_at_t = fromRegfilePort_sig_reg_14@t,
	fromRegfilePort_sig_reg_15_at_t = fromRegfilePort_sig_reg_15@t,
	fromRegfilePort_sig_reg_16_at_t = fromRegfilePort_sig_reg_16@t,
	fromRegfilePort_sig_reg_17_at_t = fromRegfilePort_sig_reg_17@t,
	fromRegfilePort_sig_reg_18_at_t = fromRegfilePort_sig_reg_18@t,
	fromRegfilePort_sig_reg_19_at_t = fromRegfilePort_sig_reg_19@t,
	fromRegfilePort_sig_reg_20_at_t = fromRegfilePort_sig_reg_20@t,
	fromRegfilePort_sig_reg_21_at_t = fromRegfilePort_sig_reg_21@t,
	fromRegfilePort_sig_reg_22_at_t = fromRegfilePort_sig_reg_22@t,
	fromRegfilePort_sig_reg_23_at_t = fromRegfilePort_sig_reg_23@t,
	fromRegfilePort_sig_reg_24_at_t = fromRegfilePort_sig_reg_24@t,
	fromRegfilePort_sig_reg_25_at_t = fromRegfilePort_sig_reg_25@t,
	fromRegfilePort_sig_reg_26_at_t = fromRegfilePort_sig_reg_26@t,
	fromRegfilePort_sig_reg_27_at_t = fromRegfilePort_sig_reg_27@t,
	fromRegfilePort_sig_reg_28_at_t = fromRegfilePort_sig_reg_28@t,
	fromRegfilePort_sig_reg_29_at_t = fromRegfilePort_sig_reg_29@t,
	fromRegfilePort_sig_reg_30_at_t = fromRegfilePort_sig_reg_30@t,
	fromRegfilePort_sig_reg_31_at_t = fromRegfilePort_sig_reg_31@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_S));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_U));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_J));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_I_I));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_I_L);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: execute_11(true);
	 at t_end: memoryAccess_addrIn(true) = getALUresult(ALU_ADD,getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getImmediate(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = getMemoryMask(getInstrType(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = getALUresult(ALU_ADD,getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)),getImmediate(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = getMemoryMask(getInstrType(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegfilePort_notify = false;
end property;

property fetch_17_read_13 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegfilePort_sig_reg_01_at_t = fromRegfilePort_sig_reg_01@t,
	fromRegfilePort_sig_reg_02_at_t = fromRegfilePort_sig_reg_02@t,
	fromRegfilePort_sig_reg_03_at_t = fromRegfilePort_sig_reg_03@t,
	fromRegfilePort_sig_reg_04_at_t = fromRegfilePort_sig_reg_04@t,
	fromRegfilePort_sig_reg_05_at_t = fromRegfilePort_sig_reg_05@t,
	fromRegfilePort_sig_reg_06_at_t = fromRegfilePort_sig_reg_06@t,
	fromRegfilePort_sig_reg_07_at_t = fromRegfilePort_sig_reg_07@t,
	fromRegfilePort_sig_reg_08_at_t = fromRegfilePort_sig_reg_08@t,
	fromRegfilePort_sig_reg_09_at_t = fromRegfilePort_sig_reg_09@t,
	fromRegfilePort_sig_reg_10_at_t = fromRegfilePort_sig_reg_10@t,
	fromRegfilePort_sig_reg_11_at_t = fromRegfilePort_sig_reg_11@t,
	fromRegfilePort_sig_reg_12_at_t = fromRegfilePort_sig_reg_12@t,
	fromRegfilePort_sig_reg_13_at_t = fromRegfilePort_sig_reg_13@t,
	fromRegfilePort_sig_reg_14_at_t = fromRegfilePort_sig_reg_14@t,
	fromRegfilePort_sig_reg_15_at_t = fromRegfilePort_sig_reg_15@t,
	fromRegfilePort_sig_reg_16_at_t = fromRegfilePort_sig_reg_16@t,
	fromRegfilePort_sig_reg_17_at_t = fromRegfilePort_sig_reg_17@t,
	fromRegfilePort_sig_reg_18_at_t = fromRegfilePort_sig_reg_18@t,
	fromRegfilePort_sig_reg_19_at_t = fromRegfilePort_sig_reg_19@t,
	fromRegfilePort_sig_reg_20_at_t = fromRegfilePort_sig_reg_20@t,
	fromRegfilePort_sig_reg_21_at_t = fromRegfilePort_sig_reg_21@t,
	fromRegfilePort_sig_reg_22_at_t = fromRegfilePort_sig_reg_22@t,
	fromRegfilePort_sig_reg_23_at_t = fromRegfilePort_sig_reg_23@t,
	fromRegfilePort_sig_reg_24_at_t = fromRegfilePort_sig_reg_24@t,
	fromRegfilePort_sig_reg_25_at_t = fromRegfilePort_sig_reg_25@t,
	fromRegfilePort_sig_reg_26_at_t = fromRegfilePort_sig_reg_26@t,
	fromRegfilePort_sig_reg_27_at_t = fromRegfilePort_sig_reg_27@t,
	fromRegfilePort_sig_reg_28_at_t = fromRegfilePort_sig_reg_28@t,
	fromRegfilePort_sig_reg_29_at_t = fromRegfilePort_sig_reg_29@t,
	fromRegfilePort_sig_reg_30_at_t = fromRegfilePort_sig_reg_30@t,
	fromRegfilePort_sig_reg_31_at_t = fromRegfilePort_sig_reg_31@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_R));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_B));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_S));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_U));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_J));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_I_I));
	 at t: not((getEncType(fromMemoryPort_sig_loadedData) = ENC_I_L));
	 at t: (getEncType(fromMemoryPort_sig_loadedData) = ENC_I_J);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)) + getImmediate(fromMemoryPort_sig_loadedData_at_t))(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)) + getImmediate(fromMemoryPort_sig_loadedData_at_t))(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: regfileWrite_dstData(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_addrIn = (getRegContent(fromRegfilePort_sig_reg_01_at_t,fromRegfilePort_sig_reg_02_at_t,fromRegfilePort_sig_reg_03_at_t,fromRegfilePort_sig_reg_04_at_t,fromRegfilePort_sig_reg_05_at_t,fromRegfilePort_sig_reg_06_at_t,fromRegfilePort_sig_reg_07_at_t,fromRegfilePort_sig_reg_08_at_t,fromRegfilePort_sig_reg_09_at_t,fromRegfilePort_sig_reg_10_at_t,fromRegfilePort_sig_reg_11_at_t,fromRegfilePort_sig_reg_12_at_t,fromRegfilePort_sig_reg_13_at_t,fromRegfilePort_sig_reg_14_at_t,fromRegfilePort_sig_reg_15_at_t,fromRegfilePort_sig_reg_16_at_t,fromRegfilePort_sig_reg_17_at_t,fromRegfilePort_sig_reg_18_at_t,fromRegfilePort_sig_reg_19_at_t,fromRegfilePort_sig_reg_20_at_t,fromRegfilePort_sig_reg_21_at_t,fromRegfilePort_sig_reg_22_at_t,fromRegfilePort_sig_reg_23_at_t,fromRegfilePort_sig_reg_24_at_t,fromRegfilePort_sig_reg_25_at_t,fromRegfilePort_sig_reg_26_at_t,fromRegfilePort_sig_reg_27_at_t,fromRegfilePort_sig_reg_28_at_t,fromRegfilePort_sig_reg_29_at_t,fromRegfilePort_sig_reg_30_at_t,fromRegfilePort_sig_reg_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t)) + getImmediate(fromMemoryPort_sig_loadedData_at_t))(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegfilePort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t);
	 at t_end: toRegfilePort_sig_dstData = (4 + pcReg_at_t)(31 downto 0);
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegfilePort_notify = false;
	 at t_end: toRegfilePort_notify = true;
end property;

property wait_execute_4 is
dependencies: no_reset;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_4(false);
	 at t: not(toMemoryPort_sync);
prove:
	 at t+1: execute_4(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: toMemoryPort_sig_addrIn = memoryAccess_addrIn_at_t;
	 at t+1: toMemoryPort_sig_dataIn = memoryAccess_dataIn_at_t;
	 at t+1: toMemoryPort_sig_mask = memoryAccess_mask_at_t;
	 at t+1: toMemoryPort_sig_req = memoryAccess_req_at_t;
	 at t+1: fromMemoryPort_notify = false;
	 at t+1: toMemoryPort_notify = true;
	 at t+1: toRegfilePort_notify = false;
end property;

property wait_execute_5 is
dependencies: no_reset;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_5(false);
	 at t: not(fromMemoryPort_sync);
prove:
	 at t+1: execute_5(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: fromMemoryPort_notify = true;
	 at t+1: toMemoryPort_notify = false;
	 at t+1: toRegfilePort_notify = false;
end property;

property wait_execute_11 is
dependencies: no_reset;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_11(false);
	 at t: not(toMemoryPort_sync);
prove:
	 at t+1: execute_11(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: toMemoryPort_sig_addrIn = memoryAccess_addrIn_at_t;
	 at t+1: toMemoryPort_sig_dataIn = memoryAccess_dataIn_at_t;
	 at t+1: toMemoryPort_sig_mask = memoryAccess_mask_at_t;
	 at t+1: toMemoryPort_sig_req = memoryAccess_req_at_t;
	 at t+1: fromMemoryPort_notify = false;
	 at t+1: toMemoryPort_notify = true;
	 at t+1: toRegfilePort_notify = false;
end property;

property wait_execute_12 is
dependencies: no_reset;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_12(false);
	 at t: not(fromMemoryPort_sync);
prove:
	 at t+1: execute_12(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: fromMemoryPort_notify = true;
	 at t+1: toMemoryPort_notify = false;
	 at t+1: toRegfilePort_notify = false;
end property;

property wait_fetch_16 is
dependencies: no_reset;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_16(false);
	 at t: not(toMemoryPort_sync);
prove:
	 at t+1: fetch_16(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: toMemoryPort_sig_addrIn = memoryAccess_addrIn_at_t;
	 at t+1: toMemoryPort_sig_dataIn = memoryAccess_dataIn_at_t;
	 at t+1: toMemoryPort_sig_mask = memoryAccess_mask_at_t;
	 at t+1: toMemoryPort_sig_req = memoryAccess_req_at_t;
	 at t+1: fromMemoryPort_notify = false;
	 at t+1: toMemoryPort_notify = true;
	 at t+1: toRegfilePort_notify = false;
end property;

property wait_fetch_17 is
dependencies: no_reset;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not(fromMemoryPort_sync);
prove:
	 at t+1: fetch_17(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: fromMemoryPort_notify = true;
	 at t+1: toMemoryPort_notify = false;
	 at t+1: toRegfilePort_notify = false;
end property;