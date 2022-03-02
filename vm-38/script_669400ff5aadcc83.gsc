#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_af5c1c0c;

/*
	Name: function_8bbac6a
	Namespace: namespace_af5c1c0c
	Checksum: 0xCEB20AAF
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8bbac6a()
{
	level notify(1238752774);
}

/*
	Name: init
	Namespace: namespace_af5c1c0c
	Checksum: 0xEC3BFD10
	Offset: 0x158
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::function_91cd7763("string", "sr_vote_prompt.header", 1, 0);
	clientfield::function_a8bbc967("sr_vote_prompt.numPlayersNeeded", 1, 2, "int", 0);
	clientfield::function_a8bbc967("sr_vote_prompt.show", 1, 1, "int", 0);
	clientfield::function_a8bbc967("sr_vote_prompt.starter", 1, 7, "int", 0);
	clientfield::function_a8bbc967("sr_vote_prompt.status", 1, 2, "int", 0);
}

/*
	Name: function_c65468ef
	Namespace: namespace_af5c1c0c
	Checksum: 0xA2CBE38D
	Offset: 0x230
	Size: 0x434
	Parameters: 3
	Flags: Linked
*/
function function_c65468ef(var_2d1ee75a, var_5c765806, var_f965fa7)
{
	if(is_true(level.var_6f754d87))
	{
		return 0;
	}
	a_e_players = function_a1ef346b();
	arrayremovevalue(a_e_players, var_2d1ee75a);
	b_debug = 0;
	/#
		b_debug = getdvarint(#"hash_23982855c95ec06", 0) > 0;
	#/
	if(a_e_players.size > 0 || b_debug)
	{
		level.var_6f754d87 = 1;
		if(isdefined(level.var_1ea1d494))
		{
			level.var_1ea1d494 sethintstring("");
		}
		var_8b9e1fe4 = spawnstruct();
		var_8b9e1fe4.var_2d1ee75a = var_2d1ee75a;
		var_8b9e1fe4.var_96d8430e = [];
		var_8b9e1fe4.var_e6ae7b0 = [];
		var_8b9e1fe4.var_5c765806 = var_5c765806;
		var_8b9e1fe4.var_f965fa7 = var_f965fa7;
		level.var_c5beea37 = var_8b9e1fe4;
		callback::on_spawned(&function_287ce935);
		callback::on_disconnect(&function_3728d19b);
		if(!b_debug)
		{
			var_2d1ee75a thread function_287ce935(var_8b9e1fe4, 1);
		}
		else
		{
			a_e_players = getplayers();
		}
		foreach(e_player in a_e_players)
		{
			e_player thread function_287ce935(var_8b9e1fe4);
		}
		var_8b9e1fe4 thread function_e7c57e4();
		var_8e862768 = var_8b9e1fe4 function_4b4f57db();
		level.var_6f754d87 = 0;
		if(is_true(var_8e862768))
		{
			var_8b9e1fe4 notify(#"hash_2a14368bde086f2e");
		}
		else
		{
			var_8e862768 = 0;
			if(isdefined(level.var_1ea1d494))
			{
				level.var_1ea1d494 sethintstring(level.var_1ea1d494.var_9d7362a4);
			}
			level thread popups::displayteammessagetoall(var_f965fa7, var_2d1ee75a);
		}
		callback::remove_on_spawned(&function_287ce935);
		callback::remove_on_disconnect(&function_3728d19b);
		foreach(e_player in getplayers())
		{
			e_player clientfield::set_player_uimodel("sr_vote_prompt.show", 0);
		}
		level.var_c5beea37 = undefined;
		var_8b9e1fe4 struct::delete();
	}
	else
	{
		var_8e862768 = 1;
	}
	return var_8e862768;
}

/*
	Name: function_4b4f57db
	Namespace: namespace_af5c1c0c
	Checksum: 0x69BEE49E
	Offset: 0x670
	Size: 0x23A
	Parameters: 0
	Flags: Linked
*/
function function_4b4f57db()
{
	self endon(#"hash_2c37ff2ab3cc12c5");
	while(true)
	{
		var_d46eae05 = function_a1ef346b().size;
		switch(var_d46eae05)
		{
			case 2:
			{
				var_33a40292 = 2;
				break;
			}
			case 3:
			{
				var_33a40292 = 2;
				break;
			}
			case 4:
			{
				var_33a40292 = 3;
				break;
			}
			case 5:
			{
				var_33a40292 = 3;
				break;
			}
			default:
			{
				var_33a40292 = 1;
				break;
			}
		}
		function_1eaaceab(self.var_96d8430e);
		function_1eaaceab(self.var_e6ae7b0);
		var_162efdd8 = var_33a40292 - self.var_96d8430e.size;
		foreach(player in getplayers())
		{
			player clientfield::set_player_uimodel("sr_vote_prompt.numPlayersNeeded", math::clamp(var_162efdd8, 0, var_d46eae05));
		}
		if(var_162efdd8 <= 0)
		{
			wait(0.5);
			return true;
		}
		if((self.var_96d8430e.size + self.var_e6ae7b0.size) >= var_d46eae05)
		{
			wait(0.5);
			return false;
		}
		waitframe(1);
	}
}

/*
	Name: function_e7c57e4
	Namespace: namespace_af5c1c0c
	Checksum: 0xDA904837
	Offset: 0x8B8
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function function_e7c57e4()
{
	self endon(#"delete", #"death", #"hash_2a14368bde086f2e", #"hash_2c37ff2ab3cc12c5");
	wait(30);
	self notify(#"hash_2c37ff2ab3cc12c5");
}

/*
	Name: function_287ce935
	Namespace: namespace_af5c1c0c
	Checksum: 0x5A3E2009
	Offset: 0x920
	Size: 0x398
	Parameters: 2
	Flags: Linked
*/
function function_287ce935(var_8b9e1fe4, var_e058812d)
{
	if(!isdefined(var_e058812d))
	{
		var_e058812d = 0;
	}
	var_8b9e1fe4 = (isdefined(var_8b9e1fe4) ? var_8b9e1fe4 : level.var_c5beea37);
	if(!isdefined(var_8b9e1fe4))
	{
		return;
	}
	if(!isplayer(var_8b9e1fe4.var_2d1ee75a))
	{
		return;
	}
	self notify("5011fd909e6bec38");
	self endon("5011fd909e6bec38");
	var_8b9e1fe4 endon(#"hash_2a14368bde086f2e", #"hash_2c37ff2ab3cc12c5");
	self endon(#"death");
	self clientfield::set_player_uimodel("sr_vote_prompt.starter", var_8b9e1fe4.var_2d1ee75a getentitynumber());
	self clientfield::set_player_uimodel("sr_vote_prompt.header", var_8b9e1fe4.var_5c765806);
	var_f4f8379d = 0;
	if(var_e058812d || isbot(self))
	{
		var_f4f8379d = 1;
	}
	self clientfield::set_player_uimodel("sr_vote_prompt.status", var_f4f8379d);
	self clientfield::set_player_uimodel("sr_vote_prompt.show", 1);
	while(var_f4f8379d == 0)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		response = waitresult.response;
		if(response === #"hash_4555ff5843fd0c43")
		{
			var_f4f8379d = 1;
			self clientfield::set_player_uimodel("sr_vote_prompt.status", var_f4f8379d);
		}
		else if(response === #"hash_690c429815dfb9dc")
		{
			var_f4f8379d = 2;
			self clientfield::set_player_uimodel("sr_vote_prompt.status", var_f4f8379d);
		}
	}
	if(var_f4f8379d === 1)
	{
		if(!isdefined(var_8b9e1fe4.var_96d8430e))
		{
			var_8b9e1fe4.var_96d8430e = [];
		}
		else if(!isarray(var_8b9e1fe4.var_96d8430e))
		{
			var_8b9e1fe4.var_96d8430e = array(var_8b9e1fe4.var_96d8430e);
		}
		if(!isinarray(var_8b9e1fe4.var_96d8430e, self))
		{
			var_8b9e1fe4.var_96d8430e[var_8b9e1fe4.var_96d8430e.size] = self;
		}
	}
	else if(var_f4f8379d === 2)
	{
		if(!isdefined(var_8b9e1fe4.var_e6ae7b0))
		{
			var_8b9e1fe4.var_e6ae7b0 = [];
		}
		else if(!isarray(var_8b9e1fe4.var_e6ae7b0))
		{
			var_8b9e1fe4.var_e6ae7b0 = array(var_8b9e1fe4.var_e6ae7b0);
		}
		if(!isinarray(var_8b9e1fe4.var_e6ae7b0, self))
		{
			var_8b9e1fe4.var_e6ae7b0[var_8b9e1fe4.var_e6ae7b0.size] = self;
		}
	}
}

/*
	Name: function_3728d19b
	Namespace: namespace_af5c1c0c
	Checksum: 0x3A1F6DC2
	Offset: 0xCC0
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_3728d19b()
{
	var_8b9e1fe4 = level.var_c5beea37;
	var_8b9e1fe4 notify(#"hash_2c37ff2ab3cc12c5");
}

