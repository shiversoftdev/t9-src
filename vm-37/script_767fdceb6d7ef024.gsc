#using script_1f38e4dd404966a1;
#using script_312c65d6c946308;
#using script_3d5887fc414a86fb;
#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace ammomod_electriccherry;

/*
	Name: function_4b66248d
	Namespace: ammomod_electriccherry
	Checksum: 0x6ACF1E58
	Offset: 0x140
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_4b66248d()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	aat::register("ammomod_electriccherry", #"hash_6c2c475aa887c056", "ui_icon_zombie_ammomod_deadwire");
	clientfield::register("allplayers", "ammomod_electric_cherry_explode", 1, 1, "counter", &electric_cherry_explode, 0, 0);
}

/*
	Name: electric_cherry_explode
	Namespace: ammomod_electriccherry
	Checksum: 0xE3D65D03
	Offset: 0x1E8
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function electric_cherry_explode(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"game_ended");
	electric_cherry_reload_fx = util::playfxontag(bwastimejump, "zombie/fx7_perk_electric_cherry_down", self, "tag_origin");
	wait(1);
	stopfx(bwastimejump, electric_cherry_reload_fx);
}

