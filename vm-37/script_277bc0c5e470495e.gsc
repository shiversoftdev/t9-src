#using scripts\wz_common\util.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace death_circle;

/*
	Name: init_vo
	Namespace: death_circle
	Checksum: 0x65061E47
	Offset: 0xF8
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function init_vo()
{
	callback::add_callback(#"hash_7ec09c8f8151205c", &function_e8c1f9d2);
	callback::add_callback(#"hash_3ab90c4405f67276", &function_a0fd3c83);
	callback::add_callback(#"hash_77fdc4459f2f1e35", &function_465ef407);
	callback::add_callback(#"hash_3cadee0b88ef66a2", &function_1bbc8595);
	callback::add_callback(#"hash_166e273d927bf6a3", &function_dce81333);
}

/*
	Name: function_e8c1f9d2
	Namespace: death_circle
	Checksum: 0xFE7A1716
	Offset: 0x1F8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_e8c1f9d2()
{
	if(!is_true(getgametypesetting(#"hash_6873fc00b59bcd39")))
	{
		util::function_8076d591("warCircleDetectedFirst");
	}
}

/*
	Name: function_a0fd3c83
	Namespace: death_circle
	Checksum: 0x59B0D28F
	Offset: 0x250
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_a0fd3c83()
{
	util::function_8076d591("warCircleDetectedLast");
}

/*
	Name: function_465ef407
	Namespace: death_circle
	Checksum: 0x80E2031D
	Offset: 0x278
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_465ef407()
{
	util::function_8076d591("warCircleDetected");
}

/*
	Name: function_1bbc8595
	Namespace: death_circle
	Checksum: 0xD3AD9490
	Offset: 0x2A0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_1bbc8595()
{
	util::function_8076d591("warCircleCollapseImminent");
}

/*
	Name: function_dce81333
	Namespace: death_circle
	Checksum: 0x5EE0021C
	Offset: 0x2C8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_dce81333()
{
	util::function_8076d591("warCircleCollapseOccurring");
}

