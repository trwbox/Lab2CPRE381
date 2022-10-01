def countToBinary(count):
	array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	array[count] = 1
	returnString = ""
	for i in array:
		returnString = returnString + str(i)
	return returnString


count = 0
invertCount = 31
thing = "{:b}".format(count) # Gets binary like '00000'
indent = '        '
for i in range(2):
	for j in range(2):
		for k in range(2):
			for l in range(2):
				for m in range(2):



					# Prints the rough outline for the assembly we were given 
					#print(indent + '----- Loop Number ' + str(count))
					#print(indent + 's_nAdd_Sub <= \'0\';')
					#print(indent + 's_ALUSrc <= \'1\';')
					#print(indent + 's_Immediate <= "00000000000000000000000000000000";')
					#print(indent + 's_READADDR1 <= "00000";')
					#print(indent + 's_READADDR2 <= "00000";')
					#print(indent + 's_WRITEADDR <= "00000";')
					#print()

					# Prints all the registers with read1 starting at 0, and read2 starting at 31
					
					#print(indent + 's_READADDR1 <= "' + "{:b}".format(count).rjust(5, '0') + '";')
					#print(indent + 's_READADDR2 <= "' + "{:b}".format(invertCount).rjust(5, '0') + '";')
					#print(indent + 'wait for gCLK_HPER * 2;')
					#print()
					# Prints loading all the registers with with a single bit
					#print(indent + 's_D <= "' + countToBinary(count) +'";')
					#print(indent + 's_WRITEADDR <= "' + f"{i}{j}{k}{l}{m}" +'";')
					#print(indent + 'wait for gCLK_HPER * 2;')
					#print()
					
					#string = string + 'data_input' + str(count) + ', '
					# Print the values for the register file
					#print(f'                data_input{count} => registerVector({count}),')
					
					# For whole register file
					#print(f'    signal data_{count} : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";')

					# This prints the testbench for the 32 bit 32 to 1 mux
					# print(f'        -- Test Case {count+1+32}')
					# print(f'        -- This is testing "{i}{j}{k}{l}{m}" and EN = \'0\' should be an output of "0000000000000000"')
					# print(f'        s_IN <= "{i}{j}{k}{l}{m}";')
					# print("        wait for gCLK_HPER * 2;")
					# print()

					# This prints the testbench for the 32 bit 32 to 1 mux
					# print(f'        -- Test Case {count+1}')
					# print(f'        -- This is testing "{i}{j}{k}{l}{m}" should be an output of "00000000000000000000000000000000"')
					# print(f'        s_IN <= "{i}{j}{k}{l}{m}";')
					# print("        wait for gCLK_HPER * 2;")
					# print()
					
					# Print out the data input signal
					#print(f"   signal s_data_input{count} : std_logic_vector(31 downto 0) := \"00000000000000000000000000000000\";")

					# Print out the setting of data
					#print(f'        s_data_input{count} <= "00000000000000000000000000000000";')

					# Print out the data input
					#print(f"        data_input{count} => s_data_input{count},")

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

					# This prints out the process for dataflow VHDL fir 5 to 32 decoder
					#print(f'        when "{i}{j}{k}{l}{m}" => data_output({count}) <= \'1\';')
					#count = count + 1

					count = count + 1
					invertCount = invertCount - 1

