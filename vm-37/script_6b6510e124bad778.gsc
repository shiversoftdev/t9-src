#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_6e90e490;

/*
	Name: init
	Namespace: namespace_6e90e490
	Checksum: 0xC4D3A977
	Offset: 0x440
	Size: 0x87C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	for(i = 1; i <= 4; i++)
	{
		toks = strtok("doaGlobal.player$.hudVisible", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 1, "int");
		toks = strtok("doaGlobal.player$.bombs", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 4, "int");
		toks = strtok("doaGlobal.player$.boosts", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 4, "int");
		toks = strtok("doaGlobal.player$.keys", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 4, "int");
		toks = strtok("doaGlobal.player$.lives", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 4, "int");
		toks = strtok("doaGlobal.player$.score", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 30, "int");
		toks = strtok("doaGlobal.player$.health", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 8, "float");
		toks = strtok("doaGlobal.player$.scoreMultiplier", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 4, "int");
		toks = strtok("doaGlobal.player$.scoreMultiProgressBar", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 8, "float");
		toks = strtok("doaGlobal.player$.weaponType", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 3, "int");
		toks = strtok("doaGlobal.player$.weaponLevel", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 2, "int");
		toks = strtok("doaGlobal.player$.weaponDecayBar", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 8, "float");
		toks = strtok("doaGlobal.player$.leader", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 1, "int");
		toks = strtok("doaGlobal.player$.respawnTimer", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 8, "float");
		toks = strtok("doaGlobal.player$.respawnSeconds", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 16, "int");
		toks = strtok("doaGlobal.player$.respawnHelpers", "$");
		model = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(model, 1, 2, "int");
	}
	clientfield::register("scriptmover", "set_health_bar", 1, 8, "int");
	clientfield::register("scriptmover", "show_health_bar", 1, 1, "int");
	clientfield::register("actor", "set_health_bar", 1, 8, "int");
	clientfield::register("actor", "show_health_bar", 1, 1, "int");
	clientfield::register("scriptmover", "set_text_bubble", 1, 6, "int");
	clientfield::register("actor", "set_text_bubble", 1, 6, "int");
	clientfield::register("allplayers", "set_text_bubble", 1, 6, "int");
	clientfield::register("scriptmover", "setPlayerOwner", 1, 3, "int");
	clientfield::register("scriptmover", "set_name_bubble", 1, 1, "int");
	clientfield::register("toplayer", "showPlayerHint", 1, 4, "int");
	clientfield::register("scriptmover", "setTutorialEnt", 1, 1, "int");
	clientfield::register("toplayer", "setCompassVis", 1, 1, "counter");
}

/*
	Name: function_db945ce9
	Namespace: namespace_6e90e490
	Checksum: 0x53C0ED38
	Offset: 0xCC8
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_db945ce9()
{
	waitframe(1);
	function_fa6f7ba7();
	for(i = 1; i <= 4; i++)
	{
		toks = strtok("doaGlobal.player$.hudVisible", "$");
		model = (toks[0] + i) + toks[1];
		level clientfield::set_world_uimodel(model, 0);
	}
}

/*
	Name: initplayerhud
	Namespace: namespace_6e90e490
	Checksum: 0xC6E50E
	Offset: 0xD80
	Size: 0x61C
	Parameters: 0
	Flags: Linked
*/
function initplayerhud()
{
	toks = strtok("doaGlobal.player$.hudVisible", "$");
	self.doa.score.var_d252ca7f = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.bombs", "$");
	self.doa.score.var_37920e93 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.boosts", "$");
	self.doa.score.var_e3acbd27 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.keys", "$");
	self.doa.score.var_27660984 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.lives", "$");
	self.doa.score.var_3c0cc2d1 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.score", "$");
	self.doa.score.var_234fa0ba = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.health", "$");
	self.doa.score.var_b45b1692 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.scoreMultiplier", "$");
	self.doa.score.var_66579589 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.scoreMultiProgressBar", "$");
	self.doa.score.var_16ec5307 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.weaponType", "$");
	self.doa.score.var_52144f6f = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.weaponLevel", "$");
	self.doa.score.var_18b2a561 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.weaponDecayBar", "$");
	self.doa.score.var_a5236080 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.leader", "$");
	self.doa.score.var_68162a1e = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.respawnTimer", "$");
	self.doa.score.var_5cb9ca20 = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.respawnSeconds", "$");
	self.doa.score.var_85987bae = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	toks = strtok("doaGlobal.player$.respawnHelpers", "$");
	self.doa.score.var_ac6c4aee = (toks[0] + (self.doa.entnum + 1)) + toks[1];
	self function_7f7a069d();
}

/*
	Name: function_fa6f7ba7
	Namespace: namespace_6e90e490
	Checksum: 0x10CE8BCF
	Offset: 0x13A8
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_fa6f7ba7()
{
	level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_COUNTDOWN", 0);
	level notify(#"hash_4254d6c79b4ea2bc");
}

/*
	Name: function_c937e51f
	Namespace: namespace_6e90e490
	Checksum: 0x1F47B0D0
	Offset: 0x13E8
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_c937e51f(var_f40cf449)
{
	/#
		assert(var_f40cf449 < 2048, "");
	#/
	level endon(#"game_over", #"hash_4254d6c79b4ea2bc");
	self notify("25862a390086cba3");
	self endon("25862a390086cba3");
	level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_COUNTDOWN", var_f40cf449);
	while(var_f40cf449 > 0)
	{
		result = undefined;
		result = level waittilltimeout(1, #"hash_d075b46833ffc79");
		if(result._notify == #"timeout")
		{
			var_f40cf449--;
			level clientfield::set_world_uimodel("DOA_GLOBALUIMODEL_COUNTDOWN", var_f40cf449);
		}
		else
		{
			var_f40cf449 = 0;
		}
	}
	function_fa6f7ba7();
}

/*
	Name: function_7f7a069d
	Namespace: namespace_6e90e490
	Checksum: 0x7A53E562
	Offset: 0x1520
	Size: 0x6AC
	Parameters: 0
	Flags: Linked
*/
function function_7f7a069d()
{
	if(!isdefined(self.doa) || !isdefined(self.doa.score))
	{
		return;
	}
	level clientfield::set_world_uimodel(self.doa.score.var_d252ca7f, 1);
	level clientfield::set_world_uimodel(self.doa.score.var_37920e93, self.doa.score.bombs);
	level clientfield::set_world_uimodel(self.doa.score.var_e3acbd27, self.doa.score.boosts);
	level clientfield::set_world_uimodel(self.doa.score.var_27660984, self.doa.score.keys);
	level clientfield::set_world_uimodel(self.doa.score.var_3c0cc2d1, self.doa.score.lives);
	level clientfield::set_world_uimodel(self.doa.score.var_234fa0ba, self.doa.score.points);
	level clientfield::set_world_uimodel(self.doa.score.var_b45b1692, self.health / 150);
	var_194c59ae = self.doa.score.var_194c59ae;
	if(is_true(self.doa.var_3e81d24c) && level.doa.world_state == 0 && !is_true(level.doa.var_318aa67a))
	{
		if(var_194c59ae < 4)
		{
			var_194c59ae = 4;
		}
	}
	level clientfield::set_world_uimodel(self.doa.score.var_66579589, var_194c59ae);
	level clientfield::set_world_uimodel(self.doa.score.var_52144f6f, self.doa.weapontype);
	level clientfield::set_world_uimodel(self.doa.score.var_18b2a561, self.doa.weaponlevel);
	level clientfield::set_world_uimodel(self.doa.score.var_a5236080, self.doa.var_d8955419 / 1024);
	level clientfield::set_world_uimodel(self.doa.score.var_68162a1e, namespace_eccff4fb::function_f3b382da(self));
	var_20367411 = self.doa.score.gems - self.doa.score.var_6ec1ad9d;
	var_fd0181fe = self.doa.score.var_e49e3de7 - self.doa.score.var_6ec1ad9d;
	level clientfield::set_world_uimodel(self.doa.score.var_16ec5307, var_20367411 / var_fd0181fe);
	if(is_true(self.doa.respawning))
	{
		var_2e0e9ad1 = self.doa.var_ac8a92d4 / self.doa.var_22e62f63;
		var_a40917f6 = (1 - var_2e0e9ad1) * (self.doa.var_22e62f63 / 1000);
		level clientfield::set_world_uimodel(self.doa.score.var_5cb9ca20, 1 - var_2e0e9ad1);
		var_41a785dc = int(var_a40917f6);
		var_b096e444 = var_a40917f6 - var_41a785dc;
		var_be72147f = int((var_41a785dc << 8) + (var_b096e444 * 255));
		level clientfield::set_world_uimodel(self.doa.score.var_85987bae, var_be72147f);
		self.health = int(var_2e0e9ad1 * self.maxhealth);
		level clientfield::set_world_uimodel(self.doa.score.var_ac6c4aee, self.doa.var_f64d2ac0);
	}
	else
	{
		level clientfield::set_world_uimodel(self.doa.score.var_5cb9ca20, 0);
		level clientfield::set_world_uimodel(self.doa.score.var_85987bae, 0);
		level clientfield::set_world_uimodel(self.doa.score.var_ac6c4aee, 0);
	}
}

/*
	Name: function_9aff0a25
	Namespace: namespace_6e90e490
	Checksum: 0x38091EA5
	Offset: 0x1BD8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_9aff0a25(var_9ba84610)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("showPlayerHint", var_9ba84610);
	util::wait_network_frame();
	self clientfield::set_to_player("showPlayerHint", 0);
}

/*
	Name: showhint
	Namespace: namespace_6e90e490
	Checksum: 0xB33FFCA0
	Offset: 0x1C50
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function showhint(var_9ba84610, set)
{
	if(!isdefined(set))
	{
		set = 1;
	}
	level.doa.var_25f4de97 = level.doa.var_25f4de97 | (1 << var_9ba84610);
	if(set && isdefined(self.doa))
	{
		if(!isdefined(self.doa.var_25f4de97))
		{
			self.doa.var_25f4de97 = 0;
		}
		self.doa.var_25f4de97 = self.doa.var_25f4de97 | (1 << var_9ba84610);
	}
	self thread function_9aff0a25(var_9ba84610);
}

/*
	Name: function_c28bc3eb
	Namespace: namespace_6e90e490
	Checksum: 0xA9D92B99
	Offset: 0x1D30
	Size: 0xF0
	Parameters: 3
	Flags: Linked
*/
function function_c28bc3eb(var_9ba84610, set, delay)
{
	if(!isdefined(set))
	{
		set = 1;
	}
	if(!isdefined(delay))
	{
		delay = 0;
	}
	level endon(#"game_over");
	if(delay > 0)
	{
		wait(delay);
	}
	foreach(player in getplayers())
	{
		player showhint(var_9ba84610, set);
	}
}

/*
	Name: function_47e11416
	Namespace: namespace_6e90e490
	Checksum: 0x43FEDDDA
	Offset: 0x1E28
	Size: 0x1D2
	Parameters: 4
	Flags: Linked
*/
function function_47e11416(id, time, force, var_84f4f42e)
{
	if(!isdefined(time))
	{
		time = 4;
	}
	if(!isdefined(force))
	{
		force = 0;
	}
	if(!isdefined(var_84f4f42e))
	{
		var_84f4f42e = 0;
	}
	if(!isdefined(self.doa))
	{
		self.doa = {};
	}
	if(!isdefined(self.doa.var_578b6ad4))
	{
		self.doa.var_578b6ad4 = 0;
	}
	if(!force && is_true(self.doa.var_91fab440))
	{
		return;
	}
	if(!force && gettime() < self.doa.var_578b6ad4)
	{
		return;
	}
	while(isdefined(self) && is_true(self.doa.var_91fab440))
	{
		wait(0.5);
	}
	if(isdefined(self))
	{
		self.doa.var_91fab440 = id;
		self clientfield::set("set_text_bubble", id);
	}
	else
	{
		return;
	}
	if(!is_true(var_84f4f42e))
	{
		self.doa.var_578b6ad4 = (gettime() + 10000) + (time * 1000);
	}
	wait(time);
	if(isdefined(self))
	{
		self clientfield::set("set_text_bubble", 0);
		self.doa.var_91fab440 = undefined;
	}
}

