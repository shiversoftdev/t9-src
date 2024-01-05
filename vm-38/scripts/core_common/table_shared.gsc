#namespace table_shared;

/*
	Name: function_f081e5d5
	Namespace: table_shared
	Checksum: 0x25792D4C
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f081e5d5()
{
	level notify(-354673376);
}

#namespace table;

/*
	Name: load
	Namespace: table
	Checksum: 0x98EAA615
	Offset: 0x98
	Size: 0x242
	Parameters: 3
	Flags: None
*/
function load(str_filename, str_table_start, b_convert_numbers)
{
	if(!isdefined(b_convert_numbers))
	{
		b_convert_numbers = 1;
	}
	a_table = [];
	n_header_row = tablelookuprownum(str_filename, 0, str_table_start);
	/#
		assert(n_header_row > -1, "");
	#/
	a_headers = tablelookuprow(str_filename, n_header_row);
	n_row = n_header_row + 1;
	do
	{
		a_row = tablelookuprow(str_filename, n_row);
		if(isdefined(a_row) && a_row.size > 0)
		{
			index = strstrip(a_row[0]);
			if(index != "")
			{
				if(index == "table_end")
				{
					break;
				}
				if(b_convert_numbers)
				{
					index = str_to_num(index);
				}
				a_table[index] = [];
				for(val = 1; val < a_row.size; val++)
				{
					if(strstrip(a_headers[val]) != "" && strstrip(a_row[val]) != "")
					{
						value = a_row[val];
						if(b_convert_numbers)
						{
							value = str_to_num(value);
						}
						a_table[index][a_headers[val]] = value;
					}
				}
			}
		}
		n_row++;
	}
	while(isdefined(a_row) && a_row.size > 0);
	return a_table;
}

/*
	Name: str_to_num
	Namespace: table
	Checksum: 0xDF896363
	Offset: 0x2E8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function str_to_num(value)
{
	if(strisint(value))
	{
		value = int(value);
	}
	else if(strisfloat(value))
	{
		value = float(value);
	}
	return value;
}

