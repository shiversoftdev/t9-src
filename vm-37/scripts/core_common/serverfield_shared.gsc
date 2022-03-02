#namespace serverfield;

/*
	Name: register
	Namespace: serverfield
	Checksum: 0x57406FC8
	Offset: 0x60
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function register(str_name, n_version, n_bits, str_type, func_callback)
{
	serverfieldregister(str_name, n_version, n_bits, str_type, func_callback);
}

/*
	Name: get
	Namespace: serverfield
	Checksum: 0x78105B93
	Offset: 0xB8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get(field_name)
{
	return serverfieldgetvalue(self, field_name);
}

