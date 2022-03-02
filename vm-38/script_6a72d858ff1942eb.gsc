#using script_2b1dbe0f618068f7;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_234f0efc;

/*
	Name: function_8e8f839d
	Namespace: namespace_234f0efc
	Checksum: 0x140E8B10
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e8f839d()
{
	level notify(1180721212);
}

/*
	Name: function_89f2df9
	Namespace: namespace_234f0efc
	Checksum: 0xE95D20CE
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_296b16535a22f50f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_234f0efc
	Checksum: 0x49F8C18F
	Offset: 0x110
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("hudItems.radiationVestHealth", #"hud_items", #"hash_347090a9ef988900", 1, 5, "float", undefined, 0, 0);
}

/*
	Name: function_d1aaf7a4
	Namespace: namespace_234f0efc
	Checksum: 0x9247DB27
	Offset: 0x170
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function function_d1aaf7a4()
{
	/#
		assert(isplayer(self));
	#/
	return self clientfield::get_player_uimodel("hudItems.radiationVestHealth") == 1;
}

