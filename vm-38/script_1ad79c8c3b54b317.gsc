#using script_17a9d06bf819b2d3;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_3bb7295f;

/*
	Name: function_7188ff36
	Namespace: namespace_3bb7295f
	Checksum: 0xCFE828EB
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7188ff36()
{
	level notify(828298342);
}

/*
	Name: function_89f2df9
	Namespace: namespace_3bb7295f
	Checksum: 0x443BBFEA
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4e2289c68f35238d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3bb7295f
	Checksum: 0x841D7CF3
	Offset: 0x100
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_5b1144e::function_5ae4a10c(array(#"p8_wz_snowball_pile", #"hash_26cf4dd6af8cf570"), "snowball_pile", #"hash_34daeba184b6d103", undefined, #"hash_2236529fd654a6b9");
}

