#namespace namespace_bc92b51a;

/*
	Name: function_d055f955
	Namespace: namespace_bc92b51a
	Checksum: 0xA42DA175
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d055f955()
{
	level notify(353768889);
}

#namespace gametype;

/*
	Name: init
	Namespace: gametype
	Checksum: 0xF1D8EA67
	Offset: 0x80
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init()
{
	bundle = function_302bd0b9();
	level.var_d1455682 = bundle;
}

