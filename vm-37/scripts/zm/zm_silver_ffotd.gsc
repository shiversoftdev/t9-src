#using script_58860a35d0555f74;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_b121f976;

/*
	Name: function_89f2df9
	Namespace: namespace_b121f976
	Checksum: 0x2B1EAFC9
	Offset: 0xE0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_c5040460d9f3ee6", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b121f976
	Checksum: 0x80F724D1
	Offset: 0x138
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_b121f976
	Checksum: 0xFE2563EA
	Offset: 0x148
	Size: 0x3E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -57.25, -546.976), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -75.75, -546.976), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -57.25, -483.476), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_64x64x10", "collider", (392.963, -75.75, -483.476), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_wall_128x128x10", "collider", (383.59, -958.093, -146.533), vectorscale((0, 1, 0), 246.737));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-1012.39, 2374.6, 116.898), vectorscale((0, 1, 0), 289.716));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-1119.89, 2336.6, 116.898), vectorscale((0, 1, 0), 289.716));
	spawncollision("collision_clip_wall_64x64x10", "collider", (-1527, 1505, 164.042), vectorscale((0, 1, 0), 44.499));
	spawncollision("collision_clip_128x128x128", "collider", (551.949, -94.5506, -379.603), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_128x128x128", "collider", (543.449, -103.051, -379.603), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_128x128x128", "collider", (539.449, -90.051, -379.603), vectorscale((0, 1, 0), 315));
	spawncollision("collision_clip_wall_64x64x10", "collider", (239.812, 2123.97, 283.86), (0, 0, 0));
	spawncollision("collision_clip_128x128x128", "collider", (-200.8, 1669.01, -101.08), (0, 0, 0));
	namespace_1fd59e39::function_1376ec37((352, 733, 353), 100);
	namespace_1fd59e39::function_1376ec37((1403, 1282, 210), 200);
}

