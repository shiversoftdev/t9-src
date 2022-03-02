#using scripts\core_common\system_shared.gsc;

#namespace namespace_e3ee7b12;

/*
	Name: function_f2996c65
	Namespace: namespace_e3ee7b12
	Checksum: 0xB69DF3E6
	Offset: 0x1A8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f2996c65()
{
	level notify(1682892256);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e3ee7b12
	Checksum: 0x29E9C604
	Offset: 0x1C8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_32d9547523810505", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e3ee7b12
	Checksum: 0x80F724D1
	Offset: 0x220
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_e3ee7b12
	Checksum: 0xC0C848AD
	Offset: 0x230
	Size: 0x92C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	spawncollision("collision_clip_64x64x256", "collider", (-48885, -20837, 733), vectorscale((0, 1, 0), 112.398));
	spawncollision("collision_clip_64x64x256", "collider", (-48849, -20837, 733), vectorscale((0, 1, 0), 69.199));
	spawncollision("collision_clip_64x64x256", "collider", (-48834, -20856, 733), vectorscale((0, 1, 0), 9.6));
	spawncollision("collision_clip_64x64x256", "collider", (-48858, -20908, 733), vectorscale((0, 1, 0), 41.4));
	spawncollision("collision_clip_64x64x256", "collider", (-48883, -20914, 733), vectorscale((0, 1, 0), 74.4));
	spawncollision("collision_clip_64x64x256", "collider", (-48907, -20894, 733), vectorscale((0, 1, 0), 25.799));
	spawncollision("collision_clip_64x64x256", "collider", (-48918, -20852, 733), (0, 0, 0));
	spawncollision("collision_clip_128x128x128", "collider", (-48874, -20866, 880), (316.026, 291.994, 53.6488));
	spawncollision("collision_clip_256x256x256", "collider", (-49635, -20069, 945), vectorscale((0, 1, 0), 353.799));
	spawncollision("collision_clip_512x512x512", "collider", (-49765, -20612, 1270), (0, 0, 0));
	spawncollision("collision_clip_ramp_64x24", "collider", (-49408, -21103, 771), (0, 129.996, 90));
	spawncollision("collision_clip_ramp_64x24", "collider", (-49405, -21101, 707), (82, 39.996, -180));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-48753, -21211, 711), vectorscale((0, 1, 0), 270));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-48753, -21211, 839), vectorscale((0, 1, 0), 270));
	spawncollision("collision_clip_ramp_64x24", "collider", (-49486, -21009, 740), (0, 129.996, 90));
	spawncollision("collision_clip_ramp_64x24", "collider", (-49486, -21009, 676), (0, 309.996, -90));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-48884, -21280, 744), vectorscale((1, 0, 0), 306.4));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-48884, -21408, 744), vectorscale((1, 0, 0), 306.4));
	spawncollision("collision_slick_ramp_64x24", "collider", (1121, -15864.7, 7382.2), vectorscale((0, 0, -1), 144.4));
	spawncollision("collision_clip_wall_128x128x10", "collider", (-48777.5, -21214.5, 839), vectorscale((0, 1, 0), 180));
	spawncollision("collision_clip_32x32x128", "collider", (-1314.96, -11389, 7491.49), (0, 0, 0));
	spawncollision("collision_clip_32x32x128", "collider", (-1314.96, -11395, 7491.49), (0, 0, 0));
	spawncollision("collision_slick_32x32x32", "collider", (-3588.5, -15397, 7351), (51.5842, 30.1996, -9.08977E-06));
	spawncollision("collision_slick_32x32x32", "collider", (-3593, -15389, 7351), (51.5842, 30.1996, -9.08977E-06));
	spawncollision("collision_slick_ramp_64x24", "collider", (-49356.7, -21134.4, 817.905), (359.582, 310.014, -3.97821));
	spawncollision("collision_slick_ramp_64x24", "collider", (-49362.7, -21126.4, 817.905), (359.582, 310.014, -3.97821));
	spawncollision("collision_slick_ramp_64x24", "collider", (-49429.7, -21048.4, 817.905), (359.582, 310.014, -3.97821));
	spawncollision("collision_slick_ramp_64x24", "collider", (-49435.7, -21040.4, 817.905), (359.582, 310.014, -3.97821));
	spawncollision("collision_clip_wall_256x256x10", "collider", (-50141.5, -20627.1, 877.464), (0, 0, 0));
	spawncollision("collision_clip_wall_128x128x10", "collider", (867, -15571.5, 7389.98), vectorscale((0, 1, 0), 270));
	spawncollision("collision_clip_wall_128x128x10", "collider", (867, -15571.5, 7516.48), vectorscale((0, 1, 0), 270));
	spawncollision("collision_clip_wall_128x128x10", "collider", (867, -15571.5, 7643.98), vectorscale((0, 1, 0), 270));
	spawncollision("collision_clip_32x32x128", "collider", (829.383, -15578.5, 7657.44), (0, 0, 0));
	spawncollision("collision_clip_32x32x128", "collider", (829.383, -15610.5, 7657.44), (0, 0, 0));
	spawncollision("collision_clip_32x32x128", "collider", (797.383, -15610.5, 7657.44), (0, 0, 0));
	spawncollision("collision_clip_32x32x128", "collider", (765.383, -15610.5, 7657.44), (0, 0, 0));
}

