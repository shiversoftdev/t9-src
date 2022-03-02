#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_8c89a9e9;

/*
	Name: function_ee622b
	Namespace: namespace_8c89a9e9
	Checksum: 0xDE9DFF1C
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee622b()
{
	level notify(102266780);
}

/*
	Name: init
	Namespace: namespace_8c89a9e9
	Checksum: 0x76D17EED
	Offset: 0x98
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	ai::add_archetype_spawn_function(#"ghost", &function_e7d2a256);
}

/*
	Name: function_e7d2a256
	Namespace: namespace_8c89a9e9
	Checksum: 0x61CC402F
	Offset: 0xD8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7d2a256(localclientnum)
{
	self thread function_20705e4c(localclientnum);
}

/*
	Name: function_20705e4c
	Namespace: namespace_8c89a9e9
	Checksum: 0xFF0C5230
	Offset: 0x108
	Size: 0x106
	Parameters: 1
	Flags: Linked, Private
*/
function private function_20705e4c(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_488fe0f467820fcf", #"set_visible", #"hash_6ab654a4c018818c");
		switch(waitresult._notify)
		{
			case "hash_488fe0f467820fcf":
			{
				self fxclientutils::function_ae92446(localclientnum, self, self.fxdef);
				break;
			}
			case "set_visible":
			case "hash_6ab654a4c018818c":
			{
				self fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
				break;
			}
		}
	}
}

