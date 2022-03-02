#namespace serverfield;

/*
	Name: register
	Namespace: serverfield
	Checksum: 0xC28A2215
	Offset: 0x60
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function register(str_name, n_version, n_bits, str_type)
{
	serverfieldregister(str_name, n_version, n_bits, str_type);
}

/*
	Name: set
	Namespace: serverfield
	Checksum: 0xD723D759
	Offset: 0xB0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function set(str_field_name, n_value)
{
	serverfieldsetval(self, str_field_name, n_value);
}

/*
	Name: get
	Namespace: serverfield
	Checksum: 0xD5D448B4
	Offset: 0xE8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get(field_name)
{
	return serverfieldgetvalue(self, field_name);
}

