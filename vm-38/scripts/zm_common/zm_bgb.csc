#using scripts\zm_common\zm_bgb_pack.csc;
#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_80677f8;

/*
	Name: function_7711b402
	Namespace: namespace_80677f8
	Checksum: 0x34D08D57
	Offset: 0x1D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7711b402()
{
	level notify(147900693);
}

#namespace bgb;

/*
	Name: __init__system__
	Namespace: bgb
	Checksum: 0x40C0B6AF
	Offset: 0x1F0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bgb", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bgb
	Checksum: 0x603C0162
	Offset: 0x248
	Size: 0x2DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
	level.weaponbgbgrab = getweapon(#"zombie_bgb_grab");
	callback::on_localclient_connect(&on_player_connect);
	level.bgb = [];
	level.bgb_pack = [];
	clientfield::register_clientuimodel("zmhud.bgb_current", #"zm_hud", #"bgb_current", 1, 8, "int", &function_d9afd5ee, 0, 0);
	clientfield::register_clientuimodel("zmhud.bgb_display", #"zm_hud", #"bgb_display", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("zmhud.bgb_timer", #"zm_hud", #"bgb_timer", 1, 8, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("zmhud.bgb_activations_remaining", #"zm_hud", #"bgb_activations_remaining", 1, 3, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("zmhud.bgb_invalid_use", #"zm_hud", #"bgb_invalid_use", 1, 1, "counter", undefined, 0, 0);
	clientfield::register_clientuimodel("zmhud.bgb_one_shot_use", #"zm_hud", #"bgb_one_shot_use", 1, 1, "counter", undefined, 0, 0);
	clientfield::register("toplayer", "bgb_blow_bubble", 1, 1, "counter", &bgb_blow_bubble, 0, 0);
	level._effect[#"bgb_blow_bubble"] = "zombie/fx_bgb_bubble_blow_zmb";
}

/*
	Name: function_8ac3bea9
	Namespace: bgb
	Checksum: 0xC344172
	Offset: 0x530
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
	force_stream();
	bgb_finalize();
}

/*
	Name: force_stream
	Namespace: bgb
	Checksum: 0x8D0B7C23
	Offset: 0x580
	Size: 0x1A0
	Parameters: 0
	Flags: Linked
*/
function force_stream()
{
	var_45c85698 = array(getweapon(#"hash_d0f29de78e218ad"), getweapon(#"hash_5e07292c519531e6"), getweapon(#"hash_305e5faa9ecb625a"), getweapon(#"hash_23cc1f9c16b375c3"), getweapon(#"hash_155cc0a9ba3c3260"), getweapon(#"hash_2394c41f048f7d2"), getweapon(#"hash_4565adf3abc61ea3"));
	foreach(weapon in var_45c85698)
	{
		forcestreamxmodel(weapon.viewmodel);
		forcestreamxmodel(weapon.worldmodel);
	}
}

/*
	Name: on_player_connect
	Namespace: bgb
	Checksum: 0xF1AA9189
	Offset: 0x728
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_connect(localclientnum)
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
	self thread bgb_player_init(localclientnum);
}

/*
	Name: bgb_player_init
	Namespace: bgb
	Checksum: 0x825BAAA7
	Offset: 0x770
	Size: 0x48
	Parameters: 1
	Flags: Linked, Private
*/
function private bgb_player_init(localclientnum)
{
	if(isdefined(level.bgb_pack[localclientnum]))
	{
		return;
	}
	level.bgb_pack[localclientnum] = getbubblegumpack(localclientnum);
}

/*
	Name: bgb_finalize
	Namespace: bgb
	Checksum: 0x15436AC0
	Offset: 0x7C0
	Size: 0x2C8
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_finalize()
{
	level.var_afb8293c = [];
	level.var_afb8293c[0] = "base";
	level.var_afb8293c[1] = "pinwheel";
	level.var_afb8293c[2] = "speckled";
	level.var_afb8293c[3] = "shiny";
	level.var_afb8293c[5] = "swirl";
	level.var_afb8293c[4] = "swirl";
	level.var_afb8293c[6] = "swirl";
	level.bgb_item_index_to_name = [];
	foreach(v in level.bgb)
	{
		v.item_index = getitemindexfromref(v.name);
		var_ddcb67f4 = getunlockableiteminfofromindex(v.item_index, 2);
		var_5415dfb9 = function_b143666d(v.item_index, 2);
		if(!isdefined(var_ddcb67f4) || !isdefined(var_5415dfb9))
		{
			/#
				println(("" + v.name) + "");
			#/
			continue;
		}
		if(!isdefined(var_5415dfb9.bgbrarity))
		{
			var_5415dfb9.bgbrarity = 0;
		}
		v.rarity = var_5415dfb9.bgbrarity;
		if(0 == v.rarity || 1 == v.rarity)
		{
			v.consumable = 0;
		}
		else
		{
			v.consumable = 1;
		}
		v.camo_index = var_5415dfb9.var_daefc551;
		v.flying_gumball_tag = "tag_gumball_" + v.limit_type;
		v.var_c0362ae9 = (("tag_gumball_" + v.limit_type) + "_") + level.var_afb8293c[v.rarity];
		level.bgb_item_index_to_name[v.item_index] = v.name;
	}
}

/*
	Name: register
	Namespace: bgb
	Checksum: 0xFFAE19C2
	Offset: 0xA90
	Size: 0x142
	Parameters: 2
	Flags: None
*/
function register(name, limit_type)
{
	/#
		assert(isdefined(name), "");
	#/
	/#
		assert(#"none" != name, ("" + #"none") + "");
	#/
	/#
		assert(!isdefined(level.bgb[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(limit_type), ("" + name) + "");
	#/
	level.bgb[name] = spawnstruct();
	level.bgb[name].name = name;
	level.bgb[name].limit_type = limit_type;
}

/*
	Name: function_5e7b3f16
	Namespace: bgb
	Checksum: 0x47F6903C
	Offset: 0xBE0
	Size: 0x19C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5e7b3f16(localclientnum, time)
{
	self endon(#"death");
	if(isdemoplaying())
	{
		return;
	}
	if(!isdefined(self.bgb) || !isdefined(level.bgb[self.bgb]))
	{
		return;
	}
	switch(level.bgb[self.bgb].limit_type)
	{
		case "activated":
		{
			color = (25, 0, 50) / 255;
			break;
		}
		case "event":
		{
			color = (100, 50, 0) / 255;
			break;
		}
		case "rounds":
		{
			color = (1, 149, 244) / 255;
			break;
		}
		case "time":
		{
			color = (19, 244, 20) / 255;
			break;
		}
		default:
		{
			return;
		}
	}
	self setcontrollerlightbarcolor(localclientnum, color);
	wait(time);
	if(isdefined(self))
	{
		self setcontrollerlightbarcolor(localclientnum);
	}
}

/*
	Name: function_d9afd5ee
	Namespace: bgb
	Checksum: 0x9D03C8B8
	Offset: 0xD88
	Size: 0x74
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d9afd5ee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.bgb = level.bgb_item_index_to_name[bwastimejump];
	self thread function_5e7b3f16(fieldname, 3);
}

/*
	Name: function_f4763ffe
	Namespace: bgb
	Checksum: 0x6E62A5C
	Offset: 0xE08
	Size: 0x6A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f4763ffe(localclientnum, fx)
{
	if(isdefined(self.var_629940ea))
	{
		deletefx(localclientnum, self.var_629940ea, 1);
	}
	if(isdefined(fx))
	{
		self.var_629940ea = playfxoncamera(localclientnum, fx);
	}
}

/*
	Name: bgb_blow_bubble
	Namespace: bgb
	Checksum: 0x7F855F6C
	Offset: 0xE80
	Size: 0x8C
	Parameters: 7
	Flags: Linked, Private
*/
function private bgb_blow_bubble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_f4763ffe(bwastimejump, level._effect[#"bgb_blow_bubble"]);
	self thread function_5e7b3f16(bwastimejump, 0.5);
}

