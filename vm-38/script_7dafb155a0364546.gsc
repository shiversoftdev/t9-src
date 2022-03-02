#using script_13114d8a31c6152a;
#using script_35ae72be7b4fec10;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e3815316;

/*
	Name: function_699040d4
	Namespace: namespace_e3815316
	Checksum: 0x1301C5B0
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_699040d4()
{
	level notify(1146382357);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e3815316
	Checksum: 0xCE7F31F8
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5903f7e85045920f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e3815316
	Checksum: 0xFD8D35FD
	Offset: 0xE0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		function_5ac4dc99("", "");
		function_cd140ee9("", &function_538c9c9b);
		adddebugcommand("");
	#/
}

/*
	Name: function_538c9c9b
	Namespace: namespace_e3815316
	Checksum: 0x9837CD00
	Offset: 0x158
	Size: 0x14C
	Parameters: 1
	Flags: Private
*/
function private function_538c9c9b(params)
{
	/#
		/#
			assert(params.name == "");
		#/
		if(params.value == "")
		{
			return;
		}
		setdvar(#"hash_1809fc0397c17b91", "");
		if(namespace_61e6d095::exists(#"hash_5903f7e85045920f"))
		{
			return;
		}
		paramarray = strtok(params.value, "");
		/#
			assert(paramarray.size == 2);
		#/
		var_e662d59 = paramarray[0];
		var_ae85e32 = paramarray[1];
		player = getplayers()[0];
		player thread function_32402e29(var_e662d59, var_ae85e32);
	#/
}

/*
	Name: function_32402e29
	Namespace: namespace_e3815316
	Checksum: 0x8D358AA7
	Offset: 0x2B0
	Size: 0x14C
	Parameters: 2
	Flags: Private
*/
function private function_32402e29(var_e662d59, var_ae85e32)
{
	player = self;
	if(namespace_61e6d095::exists(#"hash_5903f7e85045920f"))
	{
		/#
			assertmsg("");
		#/
		return;
	}
	namespace_61e6d095::create(#"hash_5903f7e85045920f", #"hash_77979ca92bd3cc85");
	namespace_61e6d095::function_28027c42(#"hash_5903f7e85045920f", #"hash_5903f7e85045920f");
	namespace_c8e236da::function_ebf737f8(#"hash_1aefb4de625039be");
	level waittill(#"note_closed");
	namespace_c8e236da::function_c27f93d5();
	namespace_61e6d095::remove(#"hash_5903f7e85045920f");
	namespace_61e6d095::function_4279fd02(#"hash_5903f7e85045920f");
}

