#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_88af4af0;

/*
	Name: function_ce74025a
	Namespace: namespace_88af4af0
	Checksum: 0xB07BF381
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ce74025a()
{
	level notify(853560288);
}

/*
	Name: function_89f2df9
	Namespace: namespace_88af4af0
	Checksum: 0xB4DDDA90
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4445e928cf1b07c0", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_88af4af0
	Checksum: 0xFF8ABFBA
	Offset: 0x100
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"no_sprint", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_88af4af0
	Checksum: 0xF9A1C2E6
	Offset: 0x168
	Size: 0xE8
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	callback::on_spawned(&function_dc856fd8);
	foreach(player in getplayers())
	{
		player allowsprint(0);
		player._allow_sprint = 0;
		player thread function_dc856fd8();
		player thread function_31f500f();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_88af4af0
	Checksum: 0xD771AF4A
	Offset: 0x258
	Size: 0xD8
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	callback::remove_on_spawned(&function_dc856fd8);
	foreach(player in getplayers())
	{
		player notify(#"allow_sprint");
		player._allow_sprint = undefined;
		player allowsprint(1);
	}
}

/*
	Name: function_dc856fd8
	Namespace: namespace_88af4af0
	Checksum: 0x7CF8D11A
	Offset: 0x338
	Size: 0xC0
	Parameters: 0
	Flags: Private
*/
function private function_dc856fd8()
{
	self notify("374b3a40e7866d07");
	self endon("374b3a40e7866d07");
	self endon(#"disconnect", #"allow_sprint");
	self allowsprint(0);
	while(true)
	{
		self waittill(#"hash_7fd32c9551894e64", #"hash_424834e6dee13bc3", #"bgb_update");
		if(isalive(self))
		{
			self allowsprint(0);
		}
	}
}

/*
	Name: function_31f500f
	Namespace: namespace_88af4af0
	Checksum: 0xDC8FD732
	Offset: 0x400
	Size: 0xA2
	Parameters: 0
	Flags: Private
*/
function private function_31f500f()
{
	self endon(#"disconnect", #"allow_sprint");
	while(true)
	{
		if(isalive(self) && self sprintbuttonpressed())
		{
			self namespace_b22c99a5::function_97444b02();
			while(self sprintbuttonpressed())
			{
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

