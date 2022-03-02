#using script_54f593f5beb1464a;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_1c7b37c6;

/*
	Name: function_89f2df9
	Namespace: namespace_1c7b37c6
	Checksum: 0xC935B949
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_28a40055ae0e64e0", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_9738468f
	Namespace: namespace_1c7b37c6
	Checksum: 0xC6697819
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_9738468f()
{
	function_41453b43();
}

/*
	Name: function_70a657d8
	Namespace: namespace_1c7b37c6
	Checksum: 0x80F724D1
	Offset: 0xD8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_7860b659
	Namespace: namespace_1c7b37c6
	Checksum: 0xE88D9200
	Offset: 0xE8
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_7860b659(func1, param1)
{
	if(!isdefined(param1))
	{
		return;
	}
	if(isdefined(func1))
	{
		[[func1]](param1);
	}
}

/*
	Name: function_149cbc84
	Namespace: namespace_1c7b37c6
	Checksum: 0xA96335D
	Offset: 0x128
	Size: 0x4A
	Parameters: 3
	Flags: Linked
*/
function function_149cbc84(func1, var_f3ef555b, var_e3c89f9)
{
	if(!isdefined(var_f3ef555b) || !isdefined(var_e3c89f9))
	{
		return;
	}
	if(isdefined(func1))
	{
		[[func1]](var_f3ef555b, var_e3c89f9);
	}
}

/*
	Name: function_41453b43
	Namespace: namespace_1c7b37c6
	Checksum: 0x986D67B4
	Offset: 0x180
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_41453b43()
{
	var_87d0eef8 = &namespace_b0722f43::function_63bfe27;
	var_74257310 = &namespace_b0722f43::function_6da5e673;
	var_f8a4c541 = &namespace_b0722f43::function_6991057;
}

