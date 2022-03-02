#namespace string;

/*
	Name: rjust
	Namespace: string
	Checksum: 0x7749E119
	Offset: 0x60
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function rjust(str_input, n_length, str_fill)
{
	/#
		if(!isdefined(str_fill))
		{
			str_fill = "";
		}
		str_input = (isdefined(str_input) ? "" + str_input : "");
		n_fill_length = n_length - str_input.size;
		str_fill = fill(n_fill_length, str_fill);
		return str_fill + str_input;
	#/
}

/*
	Name: ljust
	Namespace: string
	Checksum: 0x8D0DEE4E
	Offset: 0xF8
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function ljust(str_input, n_length, str_fill)
{
	/#
		if(!isdefined(str_fill))
		{
			str_fill = "";
		}
		str_input = (isdefined(str_input) ? "" + str_input : "");
		n_fill_length = n_length - str_input.size;
		str_fill = fill(n_fill_length, str_fill);
		return str_input + str_fill;
	#/
}

/*
	Name: fill
	Namespace: string
	Checksum: 0x4BC4A92A
	Offset: 0x190
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function fill(n_length, str_fill)
{
	/#
		if(!isdefined(str_fill) || str_fill == "")
		{
			str_fill = "";
		}
		str_return = "";
		while(n_length > 0)
		{
			str = getsubstr(str_fill, 0, n_length);
			n_length = n_length - str.size;
			str_return = str_return + str;
		}
		return str_return;
	#/
}

