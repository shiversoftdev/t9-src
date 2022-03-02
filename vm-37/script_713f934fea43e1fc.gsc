#using script_2d142c6d365a90a3;
#using script_7183ecf0e4bbcdf8;
#using script_7ebad89114ecedb1;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace radiation;

/*
	Name: function_89f2df9
	Namespace: radiation
	Checksum: 0x32045DA7
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"radiation", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: radiation
	Checksum: 0xD5156C92
	Offset: 0xD8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	level.var_96929d7f = [];
	callback::on_localclient_connect(&function_f45ee99d);
}

/*
	Name: function_f45ee99d
	Namespace: radiation
	Checksum: 0x140EB355
	Offset: 0x128
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_f45ee99d(localclientnum)
{
	level.var_96929d7f[localclientnum] = spawnstruct();
	level.var_96929d7f[localclientnum].var_32adf91d = 0;
	level.var_96929d7f[localclientnum].sickness = [];
}

