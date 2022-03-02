#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace dev_shared;

/*
	Name: function_ed7bf3e3
	Namespace: dev_shared
	Checksum: 0x2E07B3F1
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ed7bf3e3()
{
	level notify(594711296);
}

/*
	Name: init
	Namespace: dev_shared
	Checksum: 0xAC2AE352
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	/#
		callback::on_localclient_connect(&function_b49b1b6b);
		self function_cbe4bccb();
	#/
}

/*
	Name: function_b49b1b6b
	Namespace: dev_shared
	Checksum: 0xE8AE0FCA
	Offset: 0xE0
	Size: 0x284
	Parameters: 1
	Flags: None
*/
function function_b49b1b6b(localclientnum)
{
	/#
		var_39073e7a = undefined;
		var_b49b1b6b = undefined;
		a_effects = array("", "", "", "", "", "", "", "");
		var_767a6d22 = 0;
		while(true)
		{
			n_dist = getdvarint(#"hash_4348ec71a8b13ef1", 0);
			var_114d05f = int(min(getdvarint(#"hash_4ead99200e3cc72c", 0), a_effects.size - 1));
			if(n_dist > 0)
			{
				if(var_114d05f != var_767a6d22 && isdefined(var_b49b1b6b))
				{
					killfx(localclientnum, var_b49b1b6b);
					var_b49b1b6b = undefined;
				}
				if(!isdefined(var_39073e7a))
				{
					var_39073e7a = util::spawn_model(localclientnum, "");
				}
				if(!isdefined(var_b49b1b6b))
				{
					var_b49b1b6b = util::playfxontag(localclientnum, a_effects[var_114d05f], var_39073e7a, "");
				}
				v_pos = getcamposbylocalclientnum(localclientnum);
				v_ang = getcamanglesbylocalclientnum(localclientnum);
				v_forward = anglestoforward(v_ang);
				var_39073e7a.origin = v_pos + (v_forward * n_dist);
				var_39073e7a.angles = v_ang;
			}
			else if(isdefined(var_39073e7a))
			{
				killfx(localclientnum, var_b49b1b6b);
				var_39073e7a delete();
				var_b49b1b6b = undefined;
			}
			var_767a6d22 = var_114d05f;
			waitframe(1);
		}
	#/
}

/*
	Name: add_devgui_cmd
	Namespace: dev_shared
	Checksum: 0xFA6F5AA5
	Offset: 0x370
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function add_devgui_cmd(localclientnum, menu_path, cmds)
{
	/#
		adddebugcommand(localclientnum, ((("" + menu_path) + "") + cmds) + "");
	#/
}

/*
	Name: function_cbe4bccb
	Namespace: dev_shared
	Checksum: 0x58F31C5E
	Offset: 0x3D8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_cbe4bccb()
{
	/#
		self thread function_681e8519();
		self thread function_f3346975();
		add_devgui_cmd(0, "", "");
		add_devgui_cmd(0, "", "");
	#/
}

/*
	Name: function_f3346975
	Namespace: dev_shared
	Checksum: 0xD8D273A7
	Offset: 0x468
	Size: 0x2D0
	Parameters: 0
	Flags: None
*/
function function_f3346975()
{
	/#
		mode = currentsessionmode();
		while(mode >= 4)
		{
			mode = currentsessionmode();
			wait(1);
		}
		bodies = getallcharacterbodies(mode);
		foreach(playerbodytype in bodies)
		{
			body_name = (function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, mode))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, mode));
			add_devgui_cmd(0, ("" + body_name) + "", ("" + playerbodytype) + "");
			var_13240050 = function_d299ef16(playerbodytype, mode);
			for(outfitindex = 0; outfitindex < var_13240050; outfitindex++)
			{
				var_9cf37283 = function_d7c3cf6c(playerbodytype, outfitindex, mode);
				if(var_9cf37283.valid)
				{
					var_346660ac = function_2c6232e5(makelocalizedstring(var_9cf37283.var_74996050));
					var_1bf829f2 = ((((outfitindex + "") + var_346660ac) + "") + function_9e72a96(var_9cf37283.var_3cf2d21) + "") + outfitindex;
					add_devgui_cmd(0, (("" + body_name) + "") + var_1bf829f2, (("" + playerbodytype) + "") + outfitindex);
				}
			}
		}
	#/
}

/*
	Name: function_2c6232e5
	Namespace: dev_shared
	Checksum: 0x943D163B
	Offset: 0x740
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_2c6232e5(var_4148b6dc)
{
	/#
		var_8d9c8a5d = function_ea13f55(var_4148b6dc, "", "");
		return var_8d9c8a5d;
	#/
}

/*
	Name: function_681e8519
	Namespace: dev_shared
	Checksum: 0x4F2ED673
	Offset: 0x790
	Size: 0x214
	Parameters: 0
	Flags: None
*/
function function_681e8519()
{
	/#
		level endon(#"game_ended");
		a_weapons = enumerateweapons("");
		var_cab50ba0 = [];
		a_grenades = [];
		a_equipment = [];
		for(i = 0; i < a_weapons.size; i++)
		{
			if(strstartswith(function_a16a090d(a_weapons[i]), ""))
			{
				arrayinsert(a_equipment, a_weapons[i], 0);
				continue;
			}
			if(is_true(a_weapons[i].isprimary) && isdefined(a_weapons[i].worldmodel))
			{
				arrayinsert(var_cab50ba0, a_weapons[i], 0);
				continue;
			}
			if(is_true(a_weapons[i].isgrenadeweapon))
			{
				arrayinsert(a_grenades, a_weapons[i], 0);
			}
		}
		player_devgui_base = "";
		level thread function_30285c9c(player_devgui_base, "", var_cab50ba0, "");
		level thread function_30285c9c(player_devgui_base, "", a_grenades, "");
		level thread function_30285c9c(player_devgui_base, "", a_equipment, "");
	#/
}

/*
	Name: function_30285c9c
	Namespace: dev_shared
	Checksum: 0x8AD00599
	Offset: 0x9B0
	Size: 0x124
	Parameters: 4
	Flags: None
*/
function function_30285c9c(root, pname, a_weapons, weapon_type)
{
	/#
		level endon(#"game_ended");
		player_devgui_root = (root + pname) + "";
		if(isdefined(a_weapons))
		{
			for(i = 0; i < a_weapons.size; i++)
			{
				name = function_a16a090d(a_weapons[i]);
				displayname = a_weapons[i].displayname;
				if(displayname == #"")
				{
					displayname = "";
				}
				else
				{
					displayname = ("" + makelocalizedstring(displayname)) + "";
				}
				function_8c49f3a8(player_devgui_root, weapon_type, name, displayname);
			}
		}
	#/
}

/*
	Name: function_8c49f3a8
	Namespace: dev_shared
	Checksum: 0xB2BA5974
	Offset: 0xAE0
	Size: 0x7C
	Parameters: 4
	Flags: None
*/
function function_8c49f3a8(root, weapon_type, weap_name, displayname)
{
	/#
		command = ((((((root + weapon_type) + "") + weap_name) + displayname) + "") + weap_name) + "";
		adddebugcommand(0, command);
	#/
}

