#namespace namespace_8a704f81;

/*
	Name: function_101e726a
	Namespace: namespace_8a704f81
	Checksum: 0xEE8E20EF
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_101e726a()
{
	level notify(-901579912);
}

#namespace loot;

/*
	Name: function_13afbf2d
	Namespace: loot
	Checksum: 0x411B4831
	Offset: 0x80
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_13afbf2d(lootid, name)
{
	if(!isplayer(self))
	{
		return;
	}
	player = self;
	eventparams = {#pos_z:player.origin[2], #pos_y:player.origin[1], #pos_x:player.origin[0], #gametime:function_f8d53445(), #hash_ac352d59:name, #loot_id:lootid};
	function_92d1707f(#"hash_6e269493db33fcf7", eventparams);
}

