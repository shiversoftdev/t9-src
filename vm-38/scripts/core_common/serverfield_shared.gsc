#namespace serverfield_shared;

/*
	Name: function_9832fda8
	Namespace: serverfield_shared
	Checksum: 0xFEE0708E
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9832fda8()
{
	level notify(1440317845);
}

#namespace serverfield;

/*
	Name: register
	Namespace: serverfield
	Checksum: 0xB48953CC
	Offset: 0x80
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
	Checksum: 0x4E930374
	Offset: 0xD8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get(field_name)
{
	return serverfieldgetvalue(self, field_name);
}

