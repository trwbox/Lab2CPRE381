count = 0
for i in range(2):
	for j in range(2):
		for k in range(2):
			for l in range(2):
				for m in range(2):
					# This prints the testbench for the 32 bit 32 to 1 mux
					print(Test case and number and excpected output)
					print(Loading the inputs with stair stepping bits)
					print(Going through all the values of the i_SEL to showit runs through them)
					
					# This prints out the process for dataflow VHDL for 32 bit 32 to 1 mux
					#print(f'        when "{i}{j}{k}{l}{m}" => data_output <= data_input{count};')
					
					# Data inputs for the 32 bit mux
					#print(f'        data_input{count} : in std_logic_vector(31 downto 0);')

					# Testbech for 5 to 32 decoder when en is off
					# print(f'        -- Test Case {count+1+32}')
					# print(f'        -- This is testing "{i}{j}{k}{l}{m}" and EN = \'0\' should be an output of "0000000000000000"')
					# print(f'        s_IN <= "{i}{j}{k}{l}{m}";')
					# print("        wait for gCLK_HPER * 2;")
					# print()

					# This prints out the testbench for the 5 to 32 decoder
					# print(f'        -- Test Case {count+1}')
					# print(f'        -- This is testing "{i}{j}{k}{l}{m}" should be an output of "0000000000000000"')
					# print(f'        s_IN <= "{i}{j}{k}{l}{m}";')
					# print("        wait for gCLK_HPER * 2;")
					# print()

					count = count + 1
					# This prints out the process for dataflow VHDL fir 5 to 32 decoder
					#print(f'        when "{i}{j}{k}{l}{m}" => data_output({count}) <= \'1\';')
					#count = count + 1
