#using script_ac6a30f1991e105;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_8c89a9e9;

/*
	Name: init
	Namespace: namespace_8c89a9e9
	Checksum: 0x6AA8C47F
	Offset: 0x78
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
	Checksum: 0x858A0467
	Offset: 0xB8
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
	Checksum: 0xDA996966
	Offset: 0xE8
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
		waitresult = self waittill(#"set_invisible", #"set_visible", #"hash_6ab654a4c018818c");
		switch(waitresult._notify)
		{
			case "set_invisible":
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

