#using script_18bc13f07baf161a;
#using script_24879e3929b5b5e9;
#using script_31b23f5316d1b26d;
#using script_38635d174016f682;
#using script_4fc0ca879f81e0dc;
#using script_64e5d3ad71ce8140;
#using script_66548bb129ab65aa;
#using script_67049b48b589d81;
#using script_aa59671292d1c87;
#using script_ec3113f01f76388;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_981c1f3c;

/*
	Name: init
	Namespace: namespace_981c1f3c
	Checksum: 0x471194DF
	Offset: 0x200
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "world_dungeon_set", 1, 8, "int", &function_10d7a147, 0, 0);
	clientfield::register("world", "world_dungeon_build", 1, 1, "counter", &function_74359dc, 0, 0);
	clientfield::register("world", "world_dungeon_destroy", 1, 1, "counter", &function_3d1b6aa8, 0, 0);
	namespace_c9c45ed8::init();
	namespace_5849a337::init();
	namespace_22574328::init();
	namespace_40bb01c9::init();
	namespace_1dc364c0::init();
	level.var_3dd67d2d = &function_c153f40;
}

/*
	Name: function_3d1b6aa8
	Namespace: namespace_981c1f3c
	Checksum: 0x2DF410D0
	Offset: 0x350
	Size: 0xC0
	Parameters: 7
	Flags: Linked
*/
function function_3d1b6aa8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.doa.var_5d21548e))
	{
		return;
	}
	namespace_1e25ad94::debugmsg("Destroying Dungeon! Index: " + level.doa.var_5d21548e);
	level.doa.var_182fb75a = undefined;
	level thread namespace_95fdc800::function_b1989480();
	level notify(#"dungeon_destroyed");
}

/*
	Name: function_10d7a147
	Namespace: namespace_981c1f3c
	Checksum: 0x6BEF80DC
	Offset: 0x418
	Size: 0x72
	Parameters: 7
	Flags: Linked
*/
function function_10d7a147(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	namespace_1e25ad94::debugmsg("Setting a new Dungeon! Index: " + bwastimejump);
	level.doa.var_5d21548e = bwastimejump;
}

/*
	Name: function_74359dc
	Namespace: namespace_981c1f3c
	Checksum: 0xAD863044
	Offset: 0x498
	Size: 0x25C
	Parameters: 7
	Flags: Linked
*/
function function_74359dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level notify(#"hash_60c11a94a9191bb8");
	level endon(#"dungeon_destroyed");
	while(!isdefined(level.doa.var_5d21548e))
	{
		waitframe(1);
	}
	level.doa.var_182fb75a = level.doa.var_5d21548e;
	var_bff754c6 = struct::get(level.doa.var_4bd98f7c[level.doa.var_182fb75a].name + "_startRoom", "targetname");
	if(isdefined(var_bff754c6))
	{
		x = 0;
		y = 0;
		spot = var_bff754c6.origin + (x, y, 0);
		scale = 2;
		var_639727b6 = namespace_ec06fe4a::function_e22ae9b3(bwastimejump, spot, "tag_origin", var_bff754c6.angles, "dungeon start room");
		if(isdefined(var_639727b6))
		{
			iconname = "doa_hud_icon_dungeon_room_square_reveal";
			var_639727b6 setcompassicon(iconname);
			var_639727b6 thread namespace_ec06fe4a::function_d55f042c(level, "dungeon_destroyed");
			if(isdefined(var_bff754c6.script_noteworthy))
			{
				scale = float(var_bff754c6.script_noteworthy);
			}
			var_639727b6 function_5e00861(scale);
		}
	}
	namespace_95fdc800::function_d6e32b1b();
	namespace_95fdc800::function_1bce4bde(level.doa.var_4bd98f7c[level.doa.var_5d21548e].name);
}

/*
	Name: function_c153f40
	Namespace: namespace_981c1f3c
	Checksum: 0x7BBB0F72
	Offset: 0x700
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c153f40()
{
	if(isdefined(level.doa.var_a7ccb320))
	{
		[[level.doa.var_a7ccb320]]();
	}
}

