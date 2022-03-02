#namespace serverfield_shared;

/*
	Name: function_748b0f81
	Namespace: serverfield_shared
	Checksum: 0x5495A879
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_748b0f81()
{
	level notify(1977420064);
}

#namespace serverfield;

/*
	Name: register
	Namespace: serverfield
	Checksum: 0xD7137367
	Offset: 0x80
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
	Checksum: 0x95117DD9
	Offset: 0xD0
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function set(str_field_name, n_value)
{
	serverfieldsetval(self, str_field_name, n_value);
}

/*
	Name: get
	Namespace: serverfield
	Checksum: 0x4C1BD6AE
	Offset: 0x108
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get(field_name)
{
	return serverfieldgetvalue(self, field_name);
}

