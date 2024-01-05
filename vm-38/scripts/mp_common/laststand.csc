#using script_330e1a53a92b38cc;
#using script_3b8f43c68572f06;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace laststand;

/*
	Name: function_d8b6e409
	Namespace: laststand
	Checksum: 0xFE87A236
	Offset: 0x288
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d8b6e409()
{
	level notify(-328619322);
}

/*
	Name: __init__system__
	Namespace: laststand
	Checksum: 0x20FD7ED7
	Offset: 0x2A8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"laststand", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: laststand
	Checksum: 0x9FD180B4
	Offset: 0x2F0
	Size: 0x384
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	function_349ff038();
	clientfield::register_clientuimodel("hudItems.laststand.progress", #"last_stand", #"progress", 1, 5, "float", &laststand_postfx, 0, 0);
	clientfield::register_clientuimodel("hudItems.laststand.beingRevived", #"last_stand", #"beingrevived", 1, 1, "int", &being_revived, 0, 1);
	clientfield::register_clientuimodel("hudItems.laststand.cowardsWayBleedOut", #"last_stand", #"hash_a48b4657908bd19", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.laststand.revivingClientNum", #"last_stand", #"hash_2f9e57ab87302ec", 1, 7, "int", &function_6159e216, 0, 0);
	clientfield::register_clientuimodel("hudItems.laststand.reviveProgress", #"last_stand", #"reviveprogress", 1, 5, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("EnemyTeamLastLivesData.numPlayersDowned", #"hash_157814322eeb6f4f", #"hash_6c8d6f516df4acde", 1, 3, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("PlayerTeamLastLivesData.numPlayersDowned", #"hash_1c0caa4923ddc616", #"hash_6c8d6f516df4acde", 1, 3, "int", undefined, 0, 0);
	clientfield::register("allplayers", "laststand_bleed", 1, 1, "int", &laststand_bleed, 0, 0);
	clientfield::register_clientuimodel("hud_items.selfReviveAvailable", #"hud_items", #"hash_421cc80875ab27e5", 1, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "isSelfReviving", 1, 1, "int", &function_a228d7a3, 0, 1);
	level thread wait_and_set_revive_shader_constant();
	level.var_4103bf85 = [];
	level.var_7f1612a0 = [];
}

/*
	Name: function_349ff038
	Namespace: laststand
	Checksum: 0xAC702451
	Offset: 0x680
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_349ff038()
{
	var_f6784858 = 6;
	if(sessionmodeiswarzonegame())
	{
		var_f6784858 = 4;
	}
	for(i = 0; i < var_f6784858; i++)
	{
		mp_revive_prompt::register();
	}
}

/*
	Name: function_a228d7a3
	Namespace: laststand
	Checksum: 0x28AFCD9F
	Offset: 0x6E8
	Size: 0xF4
	Parameters: 7
	Flags: Private
*/
function private function_a228d7a3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdefined(level.var_7f1612a0[fieldname]))
		{
			function_d48752e(fieldname, level.var_7f1612a0[fieldname]);
		}
		level.var_7f1612a0[fieldname] = function_604c9983(fieldname, #"hash_390aa7d4252c46b5");
	}
	else if(isdefined(level.var_7f1612a0[fieldname]))
	{
		function_d48752e(fieldname, level.var_7f1612a0[fieldname]);
		level.var_7f1612a0[fieldname] = undefined;
	}
}

/*
	Name: laststand_postfx
	Namespace: laststand
	Checksum: 0x6BEDF882
	Offset: 0x7E8
	Size: 0x1CC
	Parameters: 7
	Flags: None
*/
function laststand_postfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_5c10bd79(binitialsnap);
	if(bwastimejump)
	{
		if(!self postfx::function_556665f2("pstfx_drowning"))
		{
			self postfx::playpostfxbundle("pstfx_drowning");
			value = 0.99;
			self postfx::function_c8b5f318("pstfx_drowning", #"outer radius", value);
			self postfx::function_c8b5f318("pstfx_drowning", #"inner radius", value - 0.3);
			self postfx::function_c8b5f318("pstfx_drowning", #"opacity", 1);
		}
		if(bwastimejump > 0.5)
		{
			if(fieldname == 0)
			{
				fieldname = bwastimejump;
				bwastimejump = fieldname - 0.05;
			}
			player thread function_8960f852(fieldname, bwastimejump);
		}
	}
	else if(self postfx::function_556665f2("pstfx_drowning"))
	{
		postfx::stoppostfxbundle("pstfx_drowning");
	}
}

/*
	Name: being_revived
	Namespace: laststand
	Checksum: 0xF0CA453B
	Offset: 0x9C0
	Size: 0x6C
	Parameters: 7
	Flags: None
*/
function being_revived(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_4f6e7690 = bwastimejump != 0;
	function_766ed49(fieldname, var_4f6e7690);
}

/*
	Name: function_6159e216
	Namespace: laststand
	Checksum: 0xA0251F90
	Offset: 0xA38
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function function_6159e216(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_4f6e7690 = bwastimejump != (int(pow(2, 7) - 2));
	function_766ed49(fieldname, var_4f6e7690);
}

/*
	Name: function_766ed49
	Namespace: laststand
	Checksum: 0x4E0F86DD
	Offset: 0xAE0
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function function_766ed49(localclientnum, shouldplay)
{
	if(shouldplay)
	{
		if(isdefined(level.var_4103bf85[localclientnum]))
		{
			function_d48752e(localclientnum, level.var_4103bf85[localclientnum]);
		}
		level.var_4103bf85[localclientnum] = function_604c9983(localclientnum, #"hash_390aa7d4252c46b5");
	}
	else if(isdefined(level.var_4103bf85[localclientnum]))
	{
		function_d48752e(localclientnum, level.var_4103bf85[localclientnum]);
		level.var_4103bf85[localclientnum] = undefined;
	}
}

/*
	Name: laststand_bleed
	Namespace: laststand
	Checksum: 0x31C2A13A
	Offset: 0xBB8
	Size: 0xFE
	Parameters: 7
	Flags: None
*/
function laststand_bleed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death", #"hash_7698972484f247e8");
	if(bwastimejump != fieldname && bwastimejump)
	{
		self util::waittill_dobj(binitialsnap);
		self.var_63796ff0 = function_239993de(binitialsnap, "player/fx8_plyr_blood_drip_last_stand", self, "j_spine4");
	}
	else
	{
		if(isdefined(self.var_63796ff0))
		{
			stopfx(binitialsnap, self.var_63796ff0);
		}
		self notify(#"hash_7698972484f247e8");
	}
}

/*
	Name: function_8960f852
	Namespace: laststand
	Checksum: 0xFC6408D5
	Offset: 0xCC0
	Size: 0xE0
	Parameters: 2
	Flags: None
*/
function function_8960f852(oldval, newval)
{
	self endon(#"death");
	duration = 1;
	while(duration > 0)
	{
		value = oldval - (oldval - newval) * (1 - duration);
		duration = duration - 0.1;
		self postfx::function_c8b5f318("pstfx_drowning", #"outer radius", value);
		self postfx::function_c8b5f318("pstfx_drowning", #"inner radius", value - 0.8);
		wait(0.1);
	}
}

/*
	Name: wait_and_set_revive_shader_constant
	Namespace: laststand
	Checksum: 0xEA518129
	Offset: 0xDA8
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function wait_and_set_revive_shader_constant()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"notetrack");
		localclientnum = waitresult.localclientnum;
		if(waitresult.notetrack == "revive_shader_constant")
		{
			player = function_5c10bd79(localclientnum);
			player mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, 0, getservertime(localclientnum) / 1000);
		}
	}
}

