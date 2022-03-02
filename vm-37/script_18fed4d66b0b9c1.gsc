#namespace loot;

/*
	Name: function_13afbf2d
	Namespace: loot
	Checksum: 0x23C23FFD
	Offset: 0x60
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
	var_aa127355 = {#pos_z:player.origin[2], #pos_y:player.origin[1], #pos_x:player.origin[0], #gametime:function_f8d53445(), #hash_ac352d59:name, #loot_id:lootid};
	function_92d1707f(#"hash_6e269493db33fcf7", var_aa127355);
}

