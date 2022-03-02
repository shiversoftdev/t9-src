#using script_35ae72be7b4fec10;
#using script_37f9ff47f340fbe8;
#using script_4ccd0c3512b52a10;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\bb.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\util.gsc;

#namespace prompts;

/*
	Name: function_89f2df9
	Namespace: prompts
	Checksum: 0x578B9F57
	Offset: 0x398
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"prompts", &preload, undefined, undefined, undefined);
}

/*
	Name: preload
	Namespace: prompts
	Checksum: 0x3CBB4486
	Offset: 0x3E0
	Size: 0xCDC
	Parameters: 0
	Flags: Private
*/
function private preload()
{
	level.prompts[#"use"] = {#notify_string:"trigger", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_5797cba717dc64d5"};
	level.prompts[#"hash_794885d9482cb75e"] = {#notify_string:"trigger", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_5797cba717dc64d5", #button_action:#"hash_100ec99123fe5092"};
	level.prompts[#"melee"] = {#notify_string:"damage", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_18d0a7d5aff08dd8"};
	level.prompts[#"hash_3c5c65155dfb1731"] = {#notify_string:"grab", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_18d0a7d5aff08dd8", #button_action:#"hash_2d1efe88663d0c48"};
	level.prompts[#"attack"] = {#notify_string:"attack", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_3c124085ee45de36"};
	level.prompts[#"reload"] = {#notify_string:"reload", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_27324f18b09b7a6d"};
	level.prompts[#"frag"] = {#notify_string:"frag", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_c7de853806860ce"};
	level.prompts[#"stance"] = {#hash_b753c5a5:"BUTTON_BIT_ANY_DOWN", #notify_string:"stance", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_34ccc944003048fe"};
	level.prompts[#"weapnext"] = {#notify_string:"weapnext", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_4b3f0bed118eaaf1"};
	level.prompts[#"ads"] = {#notify_string:"aim", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_41f7ff5095b74d02"};
	level.prompts[#"hash_400c7c122bc26dec"] = {#notify_string:"attack", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_99bb5bbe, #button_text:#"hash_6a2aef10bb120a0d"};
	level.prompts[#"confirm"] = {#hash_e4c7b05f:#"hash_7179662091387b23", #notify_string:"select", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_eee54dd8, #button_text:#"hash_686cc531969c8555"};
	level.prompts[#"cancel"] = {#hash_e4c7b05f:#"hash_2eb2f3b39714ea5f", #notify_string:"cancel", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_eee54dd8, #button_text:#"hash_2ac0a4c8c1d0c8d"};
	level.prompts[#"alt1"] = {#hash_b35ba5c:"MOUSE2", #hash_a4594058:7, #hash_e4c7b05f:#"hash_7179672091387cd6", #notify_string:"alt1", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_eee54dd8, #button_text:#"hash_1fb4a5c9d34c7339"};
	level.prompts[#"alt2"] = {#hash_b35ba5c:"MOUSE3", #hash_a4594058:8, #hash_e4c7b05f:#"hash_7179682091387e89", #notify_string:"alt2", #hash_9a98e590:&function_ab46a161, #hash_92bb1cb1:&function_eee54dd8, #button_text:#"hash_7b5f7a069d7cd3a"};
	level.var_a8ea96e8 = [];
	level.var_6a7fb742 = &function_c97a48c7;
	level.var_a29d8d23 = &function_a4cf2cde;
	level.var_3626dfc = &remove;
	level.var_503dffcb = [];
	callback::on_spawned(&on_player_spawned);
	util::init_dvar("cg_cpMaxHoldDurationIgnore", 0, &function_5baa8d71);
	/#
		util::init_dvar("", 0, &function_db698ba5);
		util::init_dvar("", 0, &function_db698ba5);
		util::init_dvar("", 0, &function_db698ba5);
		util::init_dvar("", 0, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", 0, &function_db698ba5);
		util::init_dvar("", "", &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
	#/
}

/*
	Name: function_5baa8d71
	Namespace: prompts
	Checksum: 0x7355C4A0
	Offset: 0x10C8
	Size: 0x28
	Parameters: 1
	Flags: Private
*/
function private function_5baa8d71(dvar)
{
	level.var_503dffcb[dvar.name] = dvar.value;
}

/*
	Name: function_db698ba5
	Namespace: prompts
	Checksum: 0xCFB78064
	Offset: 0x10F8
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_db698ba5(dvar)
{
	/#
		level.var_a48f9f79[dvar.name] = dvar.value;
	#/
}

/*
	Name: on_player_spawned
	Namespace: prompts
	Checksum: 0xE04EDAD0
	Offset: 0x1130
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self endon(#"death");
	if(!isdefined(self.var_b3c804a4))
	{
		self.var_b3c804a4 = [];
	}
	time_interval = 1;
	var_f08f2050 = pow(528 * time_interval, 2);
	while(true)
	{
		last_pos = self.origin;
		wait(time_interval);
		if(distancesquared(self.origin, last_pos) > var_f08f2050)
		{
			self notify(#"teleported");
		}
	}
}

/*
	Name: register
	Namespace: prompts
	Checksum: 0x727DB831
	Offset: 0x1208
	Size: 0x84
	Parameters: 5
	Flags: None
*/
function register(prompt, var_92bb1cb1, button_text, notify_string, var_9a98e590)
{
	level.prompts[prompt] = {#notify_string:notify_string, #hash_9a98e590:var_9a98e590, #hash_92bb1cb1:var_92bb1cb1, #button_text:button_text};
}

/*
	Name: create
	Namespace: prompts
	Checksum: 0x2583EA27
	Offset: 0x1298
	Size: 0x1D4
	Parameters: 17
	Flags: None
*/
function create(prompt, var_4d98c3ce, complete_callback, var_531201f1, notify_string, offset, tag, var_754bedbb, var_de6f0004, var_4ac77177, var_71b9f0c0, var_87c991f3, var_5e83875a, var_8ce60046, var_9a27c4ee, var_be77841a, flags)
{
	if(!isdefined(prompt))
	{
		prompt = #"use";
	}
	var_248cbbcf = {#flags:flags, #hash_be77841a:var_be77841a, #hash_9a27c4ee:var_9a27c4ee, #hash_8ce60046:var_8ce60046, #hash_5e83875a:var_5e83875a, #hash_87c991f3:var_87c991f3, #hash_71b9f0c0:var_71b9f0c0, #hash_4ac77177:var_4ac77177, #hash_de6f0004:var_de6f0004, #hash_754bedbb:var_754bedbb, #tag:tag, #offset:offset, #notify_string:notify_string, #hash_531201f1:var_531201f1, #complete_callback:complete_callback, #hash_4d98c3ce:var_4d98c3ce};
	self function_c97a48c7(prompt, var_248cbbcf);
}

/*
	Name: function_c97a48c7
	Namespace: prompts
	Checksum: 0xF087A9E1
	Offset: 0x1478
	Size: 0x62C
	Parameters: 2
	Flags: None
*/
function function_c97a48c7(prompt, var_248cbbcf)
{
	/#
		assert(isdefined(prompt), "");
	#/
	/#
		assert(isdefined(level.prompts[prompt]), "");
	#/
	/#
		assert(isentity(self) || (isstruct(self) && isdefined(self.origin) && isdefined(self.angles)), "");
	#/
	self remove(prompt, 1);
	var_a23c5e1 = !isdefined(self.var_3e95b88f);
	if(!isdefined(self.var_3e95b88f))
	{
		self.var_3e95b88f = {};
	}
	if(!isdefined(self.var_3e95b88f.prompts))
	{
		self.var_3e95b88f.prompts = [];
	}
	if(!isdefined(self.var_3e95b88f.var_294a441e))
	{
		self.var_3e95b88f.var_294a441e = [];
	}
	if(!isdefined(self.var_3e95b88f.hud))
	{
		self.var_3e95b88f.hud = isplayer(self);
	}
	if(var_248cbbcf.var_de6f0004 === 0.25)
	{
		var_248cbbcf.var_de6f0004 = undefined;
	}
	if(var_248cbbcf.var_4ac77177 === 0.1)
	{
		var_248cbbcf.var_4ac77177 = undefined;
	}
	if(var_248cbbcf.var_71b9f0c0 === 240)
	{
		var_248cbbcf.var_71b9f0c0 = undefined;
	}
	if(var_248cbbcf.var_9c89c587 === 0)
	{
		var_248cbbcf.var_9c89c587 = undefined;
	}
	if(var_248cbbcf.var_f17a78a7 === 180)
	{
		var_248cbbcf.var_f17a78a7 = undefined;
	}
	if(var_248cbbcf.var_87c991f3 === 85)
	{
		var_248cbbcf.var_87c991f3 = undefined;
	}
	if(var_248cbbcf.var_5e83875a === 30)
	{
		var_248cbbcf.var_5e83875a = undefined;
	}
	if(var_248cbbcf.var_7faab93d === 1)
	{
		var_248cbbcf.var_7faab93d = undefined;
	}
	if(var_248cbbcf.var_8ce60046 === 1)
	{
		var_248cbbcf.var_8ce60046 = undefined;
	}
	if(var_248cbbcf.var_9a27c4ee === 1)
	{
		var_248cbbcf.var_9a27c4ee = undefined;
	}
	if(var_248cbbcf.var_be77841a === 1)
	{
		var_248cbbcf.var_be77841a = undefined;
	}
	var_248cbbcf.state = 0;
	priority = (isdefined(var_248cbbcf.priority) ? var_248cbbcf.priority : 1);
	if(!isdefined(self.var_3e95b88f.var_294a441e[prompt]))
	{
		for(priority = int(priority * 10); isinarray(self.var_3e95b88f.var_294a441e, priority); priority++)
		{
		}
		self.var_3e95b88f.var_294a441e[prompt] = priority;
	}
	else
	{
		priority = self.var_3e95b88f.var_294a441e[prompt];
	}
	if(isdefined(var_248cbbcf.groups) && !isarray(var_248cbbcf.groups))
	{
		var_248cbbcf.groups = array(var_248cbbcf.groups);
	}
	self.var_3e95b88f.prompts[prompt] = function_2e532eed(var_248cbbcf);
	self.var_3e95b88f.prompts[prompt].priority = priority;
	self.var_3e95b88f.prompts[prompt].flags = 0;
	if(isdefined(var_248cbbcf.flags))
	{
		foreach(flag in var_248cbbcf.flags)
		{
			self.var_3e95b88f.prompts[prompt].flags = self.var_3e95b88f.prompts[prompt].flags | (1 << flag);
		}
	}
	if(isdefined(var_248cbbcf.image))
	{
		self.var_3e95b88f.image = var_248cbbcf.image;
		self.var_3e95b88f.prompts[prompt].image = undefined;
	}
	self function_a4cf2cde({#hash_51f93e19:var_248cbbcf.var_51f93e19, #hash_754bedbb:var_248cbbcf.var_754bedbb, #tag:var_248cbbcf.tag, #offset:var_248cbbcf.offset});
	self notify("prompt_added_" + prompt);
	if(var_a23c5e1)
	{
		self thread _think();
	}
}

/*
	Name: function_46df0bc7
	Namespace: prompts
	Checksum: 0x7077525E
	Offset: 0x1AB0
	Size: 0x132
	Parameters: 2
	Flags: None
*/
function function_46df0bc7(prompt, priority)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	priority = int(priority * 10);
	arrayremoveindex(self.var_3e95b88f.var_294a441e, prompt, 1);
	while(isinarray(self.var_3e95b88f.var_294a441e, priority))
	{
		priority++;
	}
	self.var_3e95b88f.var_294a441e[prompt] = priority;
	self.var_3e95b88f.prompts[prompt].priority = priority;
}

/*
	Name: function_a4cf2cde
	Namespace: prompts
	Checksum: 0xC5030F
	Offset: 0x1BF0
	Size: 0x1CE
	Parameters: 1
	Flags: None
*/
function function_a4cf2cde(var_50c32acd)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	var_68131ee = 0;
	offset = (0, 0, 0);
	if(!self function_5a11b8f6())
	{
		self.var_3e95b88f.local_offset = 0;
	}
	else
	{
		self.var_3e95b88f.local_offset = 1;
	}
	if(isdefined(var_50c32acd.offset))
	{
		offset = offset + var_50c32acd.offset;
	}
	else if(isplayer(self))
	{
		offset = (914.2858, 675, 0);
	}
	if(offset != (0, 0, 0))
	{
		self.var_3e95b88f.offset = offset;
		var_68131ee = 1;
	}
	if(isdefined(var_50c32acd.tag) && self haspart(var_50c32acd.tag))
	{
		self.var_3e95b88f.tag = var_50c32acd.tag;
	}
	else if(isdefined(var_50c32acd.var_754bedbb))
	{
		self.var_3e95b88f.var_754bedbb = var_50c32acd.var_754bedbb;
		var_68131ee = 1;
	}
	if(isdefined(var_50c32acd.var_51f93e19))
	{
		self.var_3e95b88f.local_offset = var_50c32acd.var_51f93e19;
		var_68131ee = 1;
	}
	if(var_68131ee)
	{
		self notify(#"hash_17cbfac9e551855a");
	}
}

/*
	Name: function_92127496
	Namespace: prompts
	Checksum: 0x6906666B
	Offset: 0x1DC8
	Size: 0x8E
	Parameters: 2
	Flags: None
*/
function function_92127496(var_80534db1, var_a5ce465f)
{
	if(!isdefined(var_a5ce465f))
	{
		var_a5ce465f = 0;
	}
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	if(!isplayer(self))
	{
		self.var_3e95b88f.hud = var_80534db1;
		self.var_3e95b88f.var_a5ce465f = var_a5ce465f;
	}
}

/*
	Name: function_d5ea17f0
	Namespace: prompts
	Checksum: 0x8F65FFF1
	Offset: 0x1E60
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_d5ea17f0(text)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.text = text;
	if(isdefined(self.var_3e95b88f.uid))
	{
		namespace_61e6d095::function_d5ea17f0(self.var_3e95b88f.uid, text);
	}
}

/*
	Name: function_309bf7c2
	Namespace: prompts
	Checksum: 0x68416A22
	Offset: 0x1EE8
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_309bf7c2(image)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.image = image;
	if(isdefined(self.var_3e95b88f.uid))
	{
		namespace_61e6d095::function_309bf7c2(self.var_3e95b88f.uid, image);
	}
}

/*
	Name: function_82cf95d9
	Namespace: prompts
	Checksum: 0xA92A7485
	Offset: 0x1F70
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_82cf95d9(image)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.var_43c33448 = image;
	if(isdefined(self.var_3e95b88f.uid))
	{
		namespace_61e6d095::function_9ade1d9b(self.var_3e95b88f.uid, "namespace_image", image);
		globallogic_ui::function_ec25f500(" ", 0);
	}
}

/*
	Name: function_b1cfa4bc
	Namespace: prompts
	Checksum: 0x5E231821
	Offset: 0x2018
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_b1cfa4bc(progress)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.var_fc01e65d = progress;
	if(isdefined(self.var_3e95b88f.uid))
	{
		namespace_61e6d095::function_b1e6d7a8(self.var_3e95b88f.uid, progress);
		globallogic_ui::function_ec25f500(" ", 0);
	}
}

/*
	Name: function_dade5b1a
	Namespace: prompts
	Checksum: 0x16E92A16
	Offset: 0x20B8
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function function_dade5b1a(name, team)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.display_name = name;
	self.var_3e95b88f.team = util::getteamindex((isdefined(team) ? team : self getteam()));
	if(isdefined(self.var_3e95b88f.uid))
	{
		globallogic_ui::function_ec25f500(name, team);
	}
}

/*
	Name: set_objective
	Namespace: prompts
	Checksum: 0xAB0C7F99
	Offset: 0x2188
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function set_objective(str_objective)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.objective = str_objective;
	if(isdefined(str_objective))
	{
		uid = self.var_3e95b88f.var_b003a020;
		if(!isdefined(uid))
		{
			uid = self.var_3e95b88f.uid;
		}
		if(isdefined(uid))
		{
			state = namespace_61e6d095::function_f7c4c669(uid, "state");
			namespace_96850e69::function_278c15e6(str_objective, self, state != 1);
		}
	}
}

/*
	Name: function_263320e2
	Namespace: prompts
	Checksum: 0xAC6A140C
	Offset: 0x2268
	Size: 0x22C
	Parameters: 2
	Flags: None
*/
function function_263320e2(prompt, var_4d98c3ce)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	if(self.var_3e95b88f.prompts[prompt].var_4d98c3ce === var_4d98c3ce)
	{
		return;
	}
	self.var_3e95b88f.prompts[prompt].var_4d98c3ce = var_4d98c3ce;
	uid = self.var_3e95b88f.uid;
	if(isdefined(uid) && namespace_61e6d095::function_cd59371c(uid, self.var_3e95b88f.var_294a441e[prompt], self.var_3e95b88f.var_db58523e) && !is_true(self.var_3e95b88f.prompts[prompt].removing))
	{
		if(isdefined(var_4d98c3ce))
		{
			namespace_61e6d095::function_f2a9266(self.var_3e95b88f.uid, self.var_3e95b88f.var_294a441e[prompt], "text", var_4d98c3ce, self.var_3e95b88f.var_db58523e);
		}
		else
		{
			namespace_61e6d095::function_f2a9266(self.var_3e95b88f.uid, self.var_3e95b88f.var_294a441e[prompt], "text", #"", self.var_3e95b88f.var_db58523e);
		}
	}
}

/*
	Name: function_75d5e526
	Namespace: prompts
	Checksum: 0x8C253F04
	Offset: 0x24A0
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function function_75d5e526(prompt, complete_callback)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].complete_callback = complete_callback;
}

/*
	Name: function_a4a9acfc
	Namespace: prompts
	Checksum: 0xDD036561
	Offset: 0x2560
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function function_a4a9acfc(prompt, var_531201f1)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_531201f1 = var_531201f1;
}

/*
	Name: function_cd2391cb
	Namespace: prompts
	Checksum: 0x641B3102
	Offset: 0x2620
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function function_cd2391cb(prompt, notify_string)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].notify_string = notify_string;
}

/*
	Name: function_b4023f5a
	Namespace: prompts
	Checksum: 0xB1239685
	Offset: 0x26E0
	Size: 0x7C
	Parameters: 4
	Flags: None
*/
function function_b4023f5a(offset, tag, var_754bedbb, var_51f93e19)
{
	self function_a4cf2cde({#hash_51f93e19:var_51f93e19, #hash_754bedbb:var_754bedbb, #tag:tag, #offset:offset});
}

/*
	Name: function_46f198
	Namespace: prompts
	Checksum: 0xDE2FE21A
	Offset: 0x2768
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function function_46f198(uid, var_db58523e)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	self.var_3e95b88f.uid = uid;
	self.var_3e95b88f.var_db58523e = var_db58523e;
}

/*
	Name: function_816ddada
	Namespace: prompts
	Checksum: 0x284554FA
	Offset: 0x27D8
	Size: 0x32
	Parameters: 2
	Flags: None
*/
function function_816ddada(prompt, var_1df3804c)
{
	self.var_3e95b88f.prompts[prompt].var_1df3804c = var_1df3804c;
}

/*
	Name: function_44d7831a
	Namespace: prompts
	Checksum: 0x67BEA0DF
	Offset: 0x2818
	Size: 0x24C
	Parameters: 3
	Flags: None
*/
function function_44d7831a(prompt, flags, var_cca4e0db)
{
	if(!isdefined(var_cca4e0db))
	{
		var_cca4e0db = 0;
	}
	if(var_cca4e0db)
	{
		self.var_3e95b88f.prompts[prompt].flags = self.var_3e95b88f.prompts[prompt].flags | flags;
	}
	else
	{
		if(!isdefined(flags))
		{
			flags = [];
		}
		else if(!isarray(flags))
		{
			flags = array(flags);
		}
		foreach(flag in flags)
		{
			self.var_3e95b88f.prompts[prompt].flags = self.var_3e95b88f.prompts[prompt].flags | (1 << flag);
		}
	}
	uid = self.var_3e95b88f.uid;
	if(isdefined(uid) && namespace_61e6d095::function_cd59371c(uid, self.var_3e95b88f.var_294a441e[prompt], self.var_3e95b88f.var_db58523e) && !is_true(self.var_3e95b88f.prompts[prompt].removing))
	{
		namespace_61e6d095::function_9bc1d2f1(uid, self.var_3e95b88f.var_294a441e[prompt], self.var_3e95b88f.prompts[prompt].flags, 1);
	}
}

/*
	Name: function_4b556f63
	Namespace: prompts
	Checksum: 0xB3777178
	Offset: 0x2A70
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function function_4b556f63(prompt, flags, var_cca4e0db)
{
	if(!isdefined(var_cca4e0db))
	{
		var_cca4e0db = 0;
	}
	if(var_cca4e0db)
	{
		self.var_3e95b88f.prompts[prompt].flags = self.var_3e95b88f.prompts[prompt].flags & (~flags);
	}
	else
	{
		if(!isdefined(flags))
		{
			flags = [];
		}
		else if(!isarray(flags))
		{
			flags = array(flags);
		}
		foreach(flag in flags)
		{
			self.var_3e95b88f.prompts[prompt].flags = self.var_3e95b88f.prompts[prompt].flags & (~flag);
		}
	}
	uid = self.var_3e95b88f.uid;
	if(isdefined(uid) && namespace_61e6d095::function_cd59371c(uid, self.var_3e95b88f.var_294a441e[prompt], self.var_3e95b88f.var_db58523e) && !is_true(self.var_3e95b88f.prompts[prompt].removing))
	{
		namespace_61e6d095::function_e8c19a33(uid, self.var_3e95b88f.var_294a441e[prompt], flags, 1);
	}
}

/*
	Name: function_d03d79d6
	Namespace: prompts
	Checksum: 0x25DBE3AB
	Offset: 0x2CB0
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_d03d79d6(prompt, var_de6f0004)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_de6f0004 = var_de6f0004;
	if(self.var_3e95b88f.prompts[prompt].var_de6f0004 === 0.25)
	{
		self.var_3e95b88f.prompts[prompt].var_de6f0004 = undefined;
	}
}

/*
	Name: function_8f5eb0a6
	Namespace: prompts
	Checksum: 0xAEB20628
	Offset: 0x2DB8
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_8f5eb0a6(prompt, var_4ac77177)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_4ac77177 = var_4ac77177;
	if(self.var_3e95b88f.prompts[prompt].var_4ac77177 === 0.1)
	{
		self.var_3e95b88f.prompts[prompt].var_4ac77177 = undefined;
	}
}

/*
	Name: function_5fe46a16
	Namespace: prompts
	Checksum: 0xDFFAED07
	Offset: 0x2EC0
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_5fe46a16(prompt, var_71b9f0c0)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_71b9f0c0 = var_71b9f0c0;
	if(self.var_3e95b88f.prompts[prompt].var_71b9f0c0 === 240)
	{
		self.var_3e95b88f.prompts[prompt].var_71b9f0c0 = undefined;
	}
}

/*
	Name: function_cf884581
	Namespace: prompts
	Checksum: 0xDC80EC6D
	Offset: 0x2FC0
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_cf884581(prompt, angle_min)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_9c89c587 = angle_min;
	if(self.var_3e95b88f.prompts[prompt].var_9c89c587 === 0)
	{
		self.var_3e95b88f.prompts[prompt].var_9c89c587 = undefined;
	}
}

/*
	Name: function_5698d1c9
	Namespace: prompts
	Checksum: 0x7346A816
	Offset: 0x30C0
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_5698d1c9(prompt, angle_max)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_f17a78a7 = angle_max;
	if(self.var_3e95b88f.prompts[prompt].var_f17a78a7 === 180)
	{
		self.var_3e95b88f.prompts[prompt].var_f17a78a7 = undefined;
	}
}

/*
	Name: function_68782902
	Namespace: prompts
	Checksum: 0x94985A92
	Offset: 0x31C0
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_68782902(prompt, var_87c991f3)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_87c991f3 = var_87c991f3;
	if(self.var_3e95b88f.prompts[prompt].var_87c991f3 === 85)
	{
		self.var_3e95b88f.prompts[prompt].var_87c991f3 = undefined;
	}
}

/*
	Name: function_2557566
	Namespace: prompts
	Checksum: 0xBE2DA5BB
	Offset: 0x32C8
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_2557566(prompt, var_7faab93d)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_7faab93d = var_7faab93d;
	if(self.var_3e95b88f.prompts[prompt].var_7faab93d === 1)
	{
		self.var_3e95b88f.prompts[prompt].var_7faab93d = undefined;
	}
}

/*
	Name: function_b95d71cd
	Namespace: prompts
	Checksum: 0xEDF667AE
	Offset: 0x33D0
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_b95d71cd(prompt, var_5e83875a)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_5e83875a = var_5e83875a;
	if(self.var_3e95b88f.prompts[prompt].var_5e83875a === 30)
	{
		self.var_3e95b88f.prompts[prompt].var_5e83875a = undefined;
	}
}

/*
	Name: function_1a5e1da6
	Namespace: prompts
	Checksum: 0xCC70518A
	Offset: 0x34D8
	Size: 0xDA
	Parameters: 3
	Flags: None
*/
function function_1a5e1da6(prompt, var_3c8a8153, var_c8a53909)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_3c8a8153 = var_3c8a8153;
	self.var_3e95b88f.prompts[prompt].var_88ceabd = var_c8a53909;
}

/*
	Name: function_4cb5d3a1
	Namespace: prompts
	Checksum: 0x450208FE
	Offset: 0x35C0
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_4cb5d3a1(prompt, var_8ce60046)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_8ce60046 = var_8ce60046;
	if(self.var_3e95b88f.prompts[prompt].var_8ce60046 === 1)
	{
		self.var_3e95b88f.prompts[prompt].var_8ce60046 = undefined;
	}
}

/*
	Name: function_dcf99fad
	Namespace: prompts
	Checksum: 0x38E69EF7
	Offset: 0x36C0
	Size: 0x11E
	Parameters: 3
	Flags: None
*/
function function_dcf99fad(prompt, var_9a27c4ee, ignore_ent)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_9a27c4ee = var_9a27c4ee;
	self.var_3e95b88f.prompts[prompt].var_1e4cbecf = ignore_ent;
	if(self.var_3e95b88f.prompts[prompt].var_9a27c4ee === 1)
	{
		self.var_3e95b88f.prompts[prompt].var_9a27c4ee = undefined;
	}
}

/*
	Name: function_2bd2431a
	Namespace: prompts
	Checksum: 0xEDA72438
	Offset: 0x37E8
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_2bd2431a(prompt, var_be77841a)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_be77841a = var_be77841a;
	if(self.var_3e95b88f.prompts[prompt].var_be77841a === 1)
	{
		self.var_3e95b88f.prompts[prompt].var_be77841a = undefined;
	}
}

/*
	Name: function_3171730f
	Namespace: prompts
	Checksum: 0xB32F1262
	Offset: 0x38E8
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_3171730f(prompt, groups)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	if(!isdefined(groups))
	{
		groups = [];
	}
	else if(!isarray(groups))
	{
		groups = array(groups);
	}
	self.var_3e95b88f.prompts[prompt].groups = groups;
}

/*
	Name: function_e79f51ec
	Namespace: prompts
	Checksum: 0x37592476
	Offset: 0x39E8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_e79f51ec(groups)
{
	if(!isdefined(groups))
	{
		groups = [];
	}
	else if(!isarray(groups))
	{
		groups = array(groups);
	}
	level.var_a8ea96e8 = groups;
}

/*
	Name: function_398ab9eb
	Namespace: prompts
	Checksum: 0xAB4A08AB
	Offset: 0x3A50
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_398ab9eb()
{
	level.var_a8ea96e8 = [];
}

/*
	Name: function_2e6d74f5
	Namespace: prompts
	Checksum: 0x16DFABB8
	Offset: 0x3A68
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function function_2e6d74f5(prompt, pause)
{
	/#
		assert(isdefined(self.var_3e95b88f), "");
	#/
	/#
		/#
			assert(isdefined(self.var_3e95b88f.prompts[prompt]), ("" + function_9e72a96(prompt)) + "");
		#/
	#/
	self.var_3e95b88f.prompts[prompt].var_f14d06ca = pause;
}

/*
	Name: remove
	Namespace: prompts
	Checksum: 0x5E434BD8
	Offset: 0x3B28
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function remove(prompt, immediate)
{
	if(isdefined(self.var_3e95b88f) && isdefined(self.var_3e95b88f.prompts[prompt]) && !is_true(self.var_3e95b88f.prompts[prompt].removing))
	{
		self notify(#"hash_6c3a780a574076a8", {#prompt:prompt});
		self notify("prompt_removed_" + prompt);
		if(isdefined(self.var_3e95b88f.uid) && isdefined(self.var_3e95b88f.var_294a441e[prompt]))
		{
			function_17578ab7(prompt, self.var_3e95b88f);
			namespace_61e6d095::function_7239e030(self.var_3e95b88f.uid, self.var_3e95b88f.var_294a441e[prompt], self.var_3e95b88f.var_db58523e);
		}
		self.var_3e95b88f.prompts[prompt].removing = 1;
		self thread function_660c618b(prompt, immediate);
	}
}

/*
	Name: function_660c618b
	Namespace: prompts
	Checksum: 0x3E1A77F9
	Offset: 0x3CB0
	Size: 0x256
	Parameters: 2
	Flags: Private
*/
function private function_660c618b(prompt, immediate)
{
	self endon(#"all_prompts_removed", "prompt_added_" + prompt, #"death");
	if(!is_true(immediate))
	{
		waittillframeend();
	}
	if(isdefined(self.var_3e95b88f) && isdefined(self.var_3e95b88f.prompts[prompt]))
	{
		arrayremoveindex(self.var_3e95b88f.prompts, prompt, 1);
		arrayremoveindex(self.var_3e95b88f.var_294a441e, prompt, 1);
		player = getplayers()[0];
		if(player.var_b3c804a4[prompt] === self)
		{
			player.var_b3c804a4[prompt] = undefined;
		}
		if(self.var_3e95b88f.prompts.size == 0)
		{
			if(isdefined(self.var_3e95b88f.uid))
			{
				if(!isdefined(self.var_3e95b88f.var_db58523e))
				{
					self function_8de9a77a();
				}
				else if(isdefined(self.var_3e95b88f.var_294a441e))
				{
					foreach(index in self.var_3e95b88f.var_294a441e)
					{
						namespace_61e6d095::function_7239e030(self.var_3e95b88f.uid, index, self.var_3e95b88f.var_db58523e);
					}
				}
			}
			self.var_3e95b88f = undefined;
			self notify(#"all_prompts_removed");
		}
	}
}

/*
	Name: function_ee7adae5
	Namespace: prompts
	Checksum: 0x4996EEA
	Offset: 0x3F10
	Size: 0x160
	Parameters: 1
	Flags: None
*/
function function_ee7adae5(group)
{
	if(isdefined(self.var_3e95b88f.prompts))
	{
		var_c94d18f6 = [];
		foreach(var_248cbbcf in self.var_3e95b88f.prompts)
		{
			if(isdefined(var_248cbbcf.groups) && isinarray(var_248cbbcf.groups, group))
			{
				var_c94d18f6[var_c94d18f6.size] = prompt;
			}
		}
		foreach(prompt in var_c94d18f6)
		{
			self thread remove(prompt, 1);
		}
	}
}

/*
	Name: function_334e020
	Namespace: prompts
	Checksum: 0x4D41E82D
	Offset: 0x4078
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function function_334e020()
{
	if(isdefined(self.var_3e95b88f))
	{
		var_393b6e18 = self.origin;
		if(isentity(self))
		{
			if(isdefined(self.var_3e95b88f.tag))
			{
				var_393b6e18 = self gettagorigin(self.var_3e95b88f.tag);
			}
			else
			{
				if(iscorpse(self))
				{
					var_393b6e18 = self getcorpsephysicsorigin() + vectorscale((0, 0, 1), 6);
				}
				else if(is_true(self.var_3e95b88f.var_754bedbb))
				{
					var_393b6e18 = var_393b6e18 + rotatepoint(self getboundsmidpoint(), self.angles);
				}
			}
		}
		if(isdefined(self.var_3e95b88f.offset) && self.var_3e95b88f.offset != (0, 0, 0))
		{
			if(is_true(self.var_3e95b88f.local_offset))
			{
				var_393b6e18 = var_393b6e18 + rotatepoint(self.var_3e95b88f.offset, self.angles);
			}
			else
			{
				var_393b6e18 = var_393b6e18 + self.var_3e95b88f.offset;
			}
		}
		return var_393b6e18;
	}
	return undefined;
}

/*
	Name: function_86eedc
	Namespace: prompts
	Checksum: 0xCBB74F49
	Offset: 0x4238
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_86eedc()
{
	self flag::set("prompts_disabled");
}

/*
	Name: function_d675f5a4
	Namespace: prompts
	Checksum: 0xD444F971
	Offset: 0x4268
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_d675f5a4()
{
	self flag::clear("prompts_disabled");
}

/*
	Name: function_d626d354
	Namespace: prompts
	Checksum: 0x99392B28
	Offset: 0x4298
	Size: 0x33A
	Parameters: 3
	Flags: Private
*/
function private function_d626d354(prompt, player, dist)
{
	var_62bce5b6 = self.var_3e95b88f.prompts[prompt];
	if(self flag::get("prompts_disabled") || level flag::get("prompts_disabled"))
	{
		return false;
	}
	if(level.var_a8ea96e8.size > 0)
	{
		if(!isdefined(var_62bce5b6.groups))
		{
			return false;
		}
		var_a4d18ab4 = 0;
		foreach(var_405c2a4c in level.var_a8ea96e8)
		{
			if(isinarray(var_62bce5b6.groups, var_405c2a4c))
			{
				var_a4d18ab4 = 1;
				break;
			}
		}
		if(!var_a4d18ab4)
		{
			return false;
		}
	}
	if(self != player)
	{
		var_71b9f0c0 = (isdefined(var_62bce5b6.var_71b9f0c0) ? var_62bce5b6.var_71b9f0c0 : 240);
		/#
			if(level.var_a48f9f79[#"hash_648d8b504449ecd3"] > 0)
			{
				var_71b9f0c0 = level.var_a48f9f79[#"hash_648d8b504449ecd3"];
			}
		#/
		if(dist > var_71b9f0c0)
		{
			return false;
		}
		self.var_3e95b88f.var_98fa5077 = 1;
		require_los = (isdefined(var_62bce5b6.var_8ce60046) ? var_62bce5b6.var_8ce60046 : 1);
		/#
			if(level.var_a48f9f79[#"hash_3cdd945161669bf5"] >= 0)
			{
				require_los = level.var_a48f9f79[#"hash_3cdd945161669bf5"] > 0;
			}
		#/
		if(require_los)
		{
			var_393b6e18 = self function_334e020();
			var_27a7ecaa = (isdefined(var_62bce5b6.var_27a7ecaa) ? var_62bce5b6.var_27a7ecaa : player);
			if(!sighttracepassed(player getplayercamerapos(), var_393b6e18, 1, self, var_27a7ecaa))
			{
				return false;
			}
		}
	}
	if(isdefined(var_62bce5b6.var_531201f1) && !self [[var_62bce5b6.var_531201f1]]({#player:player, #prompt:prompt}))
	{
		return false;
	}
	return true;
}

/*
	Name: function_12186571
	Namespace: prompts
	Checksum: 0x4E1E27BB
	Offset: 0x45E0
	Size: 0x5F2
	Parameters: 6
	Flags: Private
*/
function private function_12186571(prompt, var_62bce5b6, player, dist, var_393b6e18, var_693a4fcf)
{
	if(self != player)
	{
		if(isdefined(player.var_b3c804a4[prompt]) && player.var_b3c804a4[prompt] != self)
		{
			return false;
		}
		hud = self.var_3e95b88f.hud;
		var_343e3ef2 = 0;
		/#
			if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] > 0)
			{
				hud = 1;
				var_343e3ef2 = 1;
			}
			else if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] < 0)
			{
				hud = 0;
			}
		#/
		if(hud)
		{
			foreach(var_3388fe0e in player.var_b3c804a4)
			{
				if(isdefined(var_3388fe0e) && var_3388fe0e != self && (var_3388fe0e == player || var_343e3ef2 || var_3388fe0e.var_3e95b88f.hud))
				{
					return false;
				}
			}
		}
		var_87c991f3 = (isdefined(var_62bce5b6.var_87c991f3) ? var_62bce5b6.var_87c991f3 : 85);
		/#
			if(level.var_a48f9f79[#"hash_5188f09d68ab049b"] > 0)
			{
				var_87c991f3 = level.var_a48f9f79[#"hash_5188f09d68ab049b"];
			}
		#/
		if(dist > var_87c991f3)
		{
			return false;
		}
		var_45913153 = is_true(var_62bce5b6.var_3c8a8153) && level.var_7315ba31 === (isdefined(var_62bce5b6.var_88ceabd) ? var_62bce5b6.var_88ceabd : self);
		var_b0cb5e43 = undefined;
		if(!var_45913153 && var_693a4fcf < 180)
		{
			var_b0cb5e43 = vectornormalize(var_393b6e18 - player getplayercamerapos());
			angle_delta = acos(vectordot(anglestoforward(player getplayerangles()), var_b0cb5e43));
			/#
				if(level.var_a48f9f79[#"hash_4415d97cf206beca"] > 0)
				{
					var_693a4fcf = level.var_a48f9f79[#"hash_4415d97cf206beca"];
				}
			#/
			if(angle_delta > var_693a4fcf)
			{
				return false;
			}
		}
		if(isdefined(self.angles))
		{
			var_9c89c587 = (isdefined(var_62bce5b6.var_9c89c587) ? var_62bce5b6.var_9c89c587 : 0);
			var_f17a78a7 = (isdefined(var_62bce5b6.var_f17a78a7) ? var_62bce5b6.var_f17a78a7 : 180);
			/#
				if(level.var_a48f9f79[#"hash_2665c3284c087179"] >= 0)
				{
					var_9c89c587 = level.var_a48f9f79[#"hash_2665c3284c087179"];
				}
				if(level.var_a48f9f79[#"hash_264ad5284bf1c857"] > 0)
				{
					var_f17a78a7 = level.var_a48f9f79[#"hash_264ad5284bf1c857"];
				}
			#/
			if(var_9c89c587 > 0 || var_f17a78a7 < 180)
			{
				if(!isdefined(var_b0cb5e43))
				{
					var_b0cb5e43 = vectornormalize(var_393b6e18 - player getplayercamerapos());
				}
				angle_delta = acos(vectordot(anglestoforward(self.angles), var_b0cb5e43));
				if(angle_delta < var_9c89c587 || angle_delta > var_f17a78a7)
				{
					return false;
				}
			}
		}
		var_9a27c4ee = (isdefined(var_62bce5b6.var_9a27c4ee) ? var_62bce5b6.var_9a27c4ee : 1) || var_45913153;
		/#
			if(level.var_a48f9f79[#"hash_d71edc1fface7ff"] >= 0)
			{
				var_9a27c4ee = level.var_a48f9f79[#"hash_d71edc1fface7ff"] > 0;
			}
		#/
		var_1e4cbecf = (isdefined(var_62bce5b6.var_1e4cbecf) ? var_62bce5b6.var_1e4cbecf : player);
		if(!var_9a27c4ee && !bullettracepassed(player getplayercamerapos(), var_393b6e18, 1, self, var_1e4cbecf))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_99bb5bbe
	Namespace: prompts
	Checksum: 0x5857C72E
	Offset: 0x4BE0
	Size: 0x224
	Parameters: 1
	Flags: Private
*/
function private function_99bb5bbe(var_248cbbcf)
{
	if(!var_248cbbcf.player gamepadusedlast() && isdefined(level.prompts[var_248cbbcf.prompt].var_b753c5a5))
	{
		return var_248cbbcf.player buttonbitstate(level.prompts[var_248cbbcf.prompt].var_b753c5a5);
	}
	switch(var_248cbbcf.prompt)
	{
		case "use":
		case "hash_794885d9482cb75e":
		{
			return var_248cbbcf.player usebuttonpressed();
		}
		case "hash_3c5c65155dfb1731":
		case "melee":
		{
			return var_248cbbcf.player meleebuttonpressed();
		}
		case "attack":
		{
			return var_248cbbcf.player attackbuttonpressed();
		}
		case "reload":
		{
			return var_248cbbcf.player reloadbuttonpressed();
		}
		case "frag":
		{
			return var_248cbbcf.player fragbuttonpressed();
		}
		case "stance":
		{
			return var_248cbbcf.player stancebuttonpressed();
		}
		case "weapnext":
		{
			return var_248cbbcf.player weaponswitchbuttonpressed();
		}
		case "ads":
		{
			return var_248cbbcf.player adsbuttonpressed();
		}
		case "hash_400c7c122bc26dec":
		{
			return var_248cbbcf.player vehicleattackbuttonpressed();
		}
	}
	return 0;
}

/*
	Name: function_eee54dd8
	Namespace: prompts
	Checksum: 0x607582D1
	Offset: 0x4E10
	Size: 0x374
	Parameters: 1
	Flags: Private
*/
function private function_eee54dd8(var_248cbbcf)
{
	switch(var_248cbbcf.prompt)
	{
		case "confirm":
		{
			return var_248cbbcf.player namespace_61e6d095::function_affb1af1();
		}
		case "cancel":
		{
			return var_248cbbcf.player namespace_61e6d095::function_57fbd346();
		}
		case "alt1":
		{
			return var_248cbbcf.player namespace_61e6d095::function_e4d62f9a();
		}
		case "alt2":
		{
			return var_248cbbcf.player namespace_61e6d095::function_728aec47();
		}
		default:
		{
			model = undefined;
			if(var_248cbbcf.player gamepadusedlast())
			{
				/#
					/#
						assert(isdefined(level.prompts[var_248cbbcf.prompt].var_a4594058), "" + function_9e72a96(var_248cbbcf.prompt));
					#/
				#/
				var_d75b2384 = function_90d058e8(#"buttons");
				model = getuimodel(var_d75b2384, string(level.prompts[var_248cbbcf.prompt].var_a4594058));
				/#
					/#
						assert(isdefined(model), (("" + level.prompts[var_248cbbcf.prompt].var_a4594058) + "") + function_9e72a96(var_248cbbcf.prompt));
					#/
				#/
			}
			else
			{
				/#
					assert(isdefined(level.prompts[var_248cbbcf.prompt].var_b35ba5c), "" + function_9e72a96(var_248cbbcf.prompt));
				#/
				/#
				#/
				var_31a34837 = function_90d058e8(#"hash_48b37823078b5999");
				model = getuimodel(var_31a34837, level.prompts[var_248cbbcf.prompt].var_b35ba5c);
				/#
					/#
						assert(isdefined(model), (("" + level.prompts[var_248cbbcf.prompt].var_b35ba5c) + "") + function_9e72a96(var_248cbbcf.prompt));
					#/
				#/
			}
			return getuimodelvalue(model) > 0;
		}
	}
	return 0;
}

/*
	Name: function_cd5cbae1
	Namespace: prompts
	Checksum: 0xA33B973
	Offset: 0x5190
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private function_cd5cbae1(player)
{
	player endon(#"death");
	self endon(#"all_prompts_removed");
	level endon(#"level_restarting");
	self waittill(#"death");
	if(isdefined(self.var_3e95b88f.uid))
	{
		function_17578ab7(undefined, self.var_3e95b88f);
	}
	arrayremovevalue(player.var_b3c804a4, self, 1);
}

/*
	Name: _think
	Namespace: prompts
	Checksum: 0x44455B52
	Offset: 0x5250
	Size: 0x398
	Parameters: 0
	Flags: Private
*/
function private _think()
{
	self endon(#"death", #"all_prompts_removed");
	level endon(#"level_restarting");
	player = getplayers()[0];
	while(!isdefined(player))
	{
		waitframe(1);
		player = getplayers()[0];
	}
	if(self != player)
	{
		player endon(#"death");
		self thread function_cd5cbae1(player);
	}
	waittillframeend();
	while(isdefined(self.var_3e95b88f))
	{
		dist = 0;
		if(self != player)
		{
			dist = distance(player getplayercamerapos(), (isdefined(self function_334e020()) ? self function_334e020() : self.origin));
		}
		var_3808d0ab = 0;
		foreach(var_62bce5b6 in self.var_3e95b88f.prompts)
		{
			if(self function_d626d354(prompt, player, dist))
			{
				var_3808d0ab = 1;
				break;
			}
		}
		if(var_3808d0ab)
		{
			self function_e8006b47();
			if(isdefined(player.var_b3c804a4))
			{
				arrayremovevalue(player.var_b3c804a4, self, 1);
			}
			if(isdefined(self.var_3e95b88f.uid))
			{
				if(!isdefined(self.var_3e95b88f.var_db58523e))
				{
					self function_8de9a77a();
				}
				else
				{
					foreach(index in self.var_3e95b88f.var_294a441e)
					{
						namespace_61e6d095::function_7239e030(self.var_3e95b88f.uid, index, self.var_3e95b88f.var_db58523e);
					}
				}
			}
		}
		else
		{
			player waittilltimeout(max(float(function_60d95f53()) / 1000, dist / 528), #"teleported");
		}
	}
}

/*
	Name: function_e8006b47
	Namespace: prompts
	Checksum: 0x789A8233
	Offset: 0x55F0
	Size: 0xB9E
	Parameters: 0
	Flags: Private
*/
function private function_e8006b47()
{
	self endon(#"death", #"all_prompts_removed", #"hash_17cbfac9e551855a");
	level endon(#"level_restarting");
	player = getplayers()[0];
	if(self != player)
	{
		player endon(#"death");
	}
	if(!isdefined(self.var_3e95b88f.var_db58523e))
	{
		self function_a6104953();
	}
	waitframe(1);
	uid = self.var_3e95b88f.uid;
	state = 0;
	var_c6668915 = undefined;
	var_6dbb4310 = 0;
	self.var_3e95b88f.var_98fa5077 = 1;
	while(self.var_3e95b88f.var_98fa5077)
	{
		var_bc26f34b = 0;
		var_e24c19de = 0;
		old_state = state;
		dist = 0;
		var_b48ce78 = 0;
		var_3714e9ea = 0;
		var_4921a894 = 0;
		var_b6a8b668 = 0;
		if(self != player)
		{
			var_393b6e18 = self function_334e020();
			player_camera = player getplayercamerapos();
			dist = distance(player_camera, var_393b6e18);
			self.var_3e95b88f.var_98fa5077 = 0;
			/#
				if(level.var_a48f9f79[#"hash_a1f059a85f5bed3"] != 0)
				{
					print3d(var_393b6e18, "", (0, 0, 1), undefined, undefined, undefined, 1);
				}
			#/
		}
		foreach(prompt, var_62bce5b6 in self.var_3e95b88f.prompts)
		{
			self function_263b3850(uid, prompt);
			var_b48ce78 = max(var_b48ce78, (isdefined(var_62bce5b6.var_71b9f0c0) ? var_62bce5b6.var_71b9f0c0 : 240) + 12);
			var_3714e9ea = max(var_3714e9ea, (isdefined(var_62bce5b6.var_87c991f3) ? var_62bce5b6.var_87c991f3 : 85));
			var_62bce5b6.old_state = var_62bce5b6.state;
			reset_interaction = 1;
			if(self function_d626d354(prompt, player, dist - 12))
			{
				var_bc26f34b = 1;
				if(var_62bce5b6.state == 3)
				{
					var_e24c19de = 1;
					continue;
				}
				var_5e83875a = (isdefined(var_62bce5b6.var_5e83875a) ? var_62bce5b6.var_5e83875a : 30);
				if(var_62bce5b6.state != 0 && var_62bce5b6.state != 4)
				{
					var_5e83875a = var_5e83875a + (isdefined(var_62bce5b6.var_7faab93d) ? var_62bce5b6.var_7faab93d : 1);
				}
				if(function_12186571(prompt, var_62bce5b6, player, dist, var_393b6e18, var_5e83875a))
				{
					var_e24c19de = 1;
					var_a33acc5d = self function_6b2492cb(prompt, var_62bce5b6, player);
					reset_interaction = !var_a33acc5d.interacted;
					var_4921a894 = var_4921a894 || var_a33acc5d.var_4921a894;
					var_b6a8b668 = var_b6a8b668 || var_a33acc5d.var_b6a8b668;
				}
				else
				{
					if(var_62bce5b6.flags & 2)
					{
						var_62bce5b6.state = 4;
					}
					else
					{
						var_62bce5b6.state = 0;
					}
				}
			}
			else
			{
				if(var_62bce5b6.state == 0 || var_62bce5b6.state == 4)
				{
					reset_interaction = 0;
				}
				var_62bce5b6.state = 0;
			}
			if(var_62bce5b6.state == 0 || var_62bce5b6.state == 4 && player.var_b3c804a4[prompt] === self)
			{
				player.var_b3c804a4[prompt] = undefined;
			}
			if(reset_interaction)
			{
				self function_9309081b(uid, prompt);
			}
			if(var_62bce5b6.old_state != var_62bce5b6.state)
			{
				self function_f4bf235a(uid, prompt, self.var_3e95b88f.prompts[prompt].state);
			}
		}
		if(var_e24c19de)
		{
			state = 3;
		}
		else
		{
			if(var_bc26f34b)
			{
				state = 2;
			}
			else
			{
				if(self.var_3e95b88f.var_98fa5077)
				{
					state = 1;
				}
				else
				{
					break;
				}
			}
		}
		var_4ca73085 = #"hash_2de1684e2167ada4";
		var_7cbb9c6a = 1;
		var_1e24f51b = 1;
		var_249ae409 = 10;
		min_alpha = 0;
		max_alpha = 1;
		/#
			if(level.var_a48f9f79[#"hash_6958ea0555e58a17"] != "" && isdefined(level.var_b649495c[level.var_a48f9f79[#"hash_6958ea0555e58a17"]]))
			{
				var_4ca73085 = level.var_a48f9f79[#"hash_6958ea0555e58a17"];
			}
			if(level.var_a48f9f79[#"hash_428f189debeb7b94"] != -1)
			{
				var_7cbb9c6a = level.var_a48f9f79[#"hash_428f189debeb7b94"] != 0;
			}
			if(level.var_a48f9f79[#"hash_51a8d457c48c4901"] != -1)
			{
				var_1e24f51b = level.var_a48f9f79[#"hash_51a8d457c48c4901"] != 0;
			}
			if(level.var_a48f9f79[#"hash_2fae9ec41625639c"] != -1)
			{
				var_249ae409 = level.var_a48f9f79[#"hash_2fae9ec41625639c"];
			}
			if(level.var_a48f9f79[#"hash_72b9e1d573cf513c"] != -1)
			{
				min_alpha = level.var_a48f9f79[#"hash_72b9e1d573cf513c"];
			}
			if(level.var_a48f9f79[#"hash_729ecfd573b86aee"] != -1)
			{
				max_alpha = level.var_a48f9f79[#"hash_729ecfd573b86aee"];
			}
		#/
		alpha = 1;
		if(var_b48ce78 > var_3714e9ea)
		{
			dist_pct = math::clamp((var_b48ce78 - dist) / (var_b48ce78 - var_3714e9ea), 0, 1);
			if(var_4ca73085 == #"power" || var_4ca73085 == #"exponential" || var_4ca73085 == #"hash_2de1684e2167ada4")
			{
				alpha = [[level.var_b649495c[var_4ca73085]]](min_alpha, max_alpha, dist_pct, var_7cbb9c6a, var_1e24f51b, var_249ae409);
			}
			else
			{
				alpha = [[level.var_b649495c[var_4ca73085]]](min_alpha, max_alpha, dist_pct, var_7cbb9c6a, var_1e24f51b);
			}
			alpha = (ceil(alpha * 1000)) / 1000;
		}
		if(var_c6668915 !== alpha)
		{
			namespace_61e6d095::function_aa5c711d((isdefined(self.var_3e95b88f.var_b003a020) ? self.var_3e95b88f.var_b003a020 : uid), alpha);
			var_c6668915 = alpha;
		}
		if(old_state != state)
		{
			namespace_61e6d095::set_state(uid, state);
			if(isdefined(self.var_3e95b88f.var_b003a020))
			{
				namespace_61e6d095::set_state(self.var_3e95b88f.var_b003a020, state);
			}
			if(isdefined(self.var_3e95b88f.objective))
			{
				namespace_96850e69::function_278c15e6(self.var_3e95b88f.objective, self, state != 1);
			}
		}
		if(var_6dbb4310 != var_4921a894)
		{
			var_6dbb4310 = var_4921a894;
			self notify(#"hash_5ede0284920c4c56", {#interactable:var_4921a894});
		}
		if(self flag::get(#"hash_305ce4d5b74a637a") != var_b6a8b668)
		{
			if(var_b6a8b668)
			{
				player val::set(#"hash_599ec0eee77657ef", "disable_usability", 1);
				player flag::set(#"hash_599ec0eee77657ef");
				self flag::set(#"hash_305ce4d5b74a637a");
			}
			else
			{
				player val::reset_all(#"hash_599ec0eee77657ef");
				player flag::clear(#"hash_599ec0eee77657ef");
				self flag::clear(#"hash_305ce4d5b74a637a");
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_6b2492cb
	Namespace: prompts
	Checksum: 0x7A4ACD09
	Offset: 0x6198
	Size: 0x204
	Parameters: 3
	Flags: Private
*/
function private function_6b2492cb(prompt, var_62bce5b6, player)
{
	player.var_b3c804a4[prompt] = self;
	var_62bce5b6.state = 1;
	lower = 0;
	hud = self.var_3e95b88f.hud;
	/#
		if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] > 0)
		{
			hud = 1;
		}
		else if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] < 0)
		{
			hud = 0;
		}
	#/
	if(hud)
	{
		lower = var_62bce5b6.flags & 1;
		/#
			if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] == 2)
			{
				lower = 0;
			}
			else if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] == 3)
			{
				lower = 1;
			}
		#/
	}
	interacted = 0;
	if(self [[level.prompts[prompt].var_92bb1cb1]]({#player:player, #hash_62bce5b6:var_62bce5b6, #prompt:prompt}) && !is_true(var_62bce5b6.var_5a8a10f2))
	{
		self function_fcef5f5b(prompt, var_62bce5b6, player);
		interacted = 1;
	}
	return {#hash_4921a894:hud && !lower, #hash_b6a8b668:lower, #interacted:interacted};
}

/*
	Name: function_fcef5f5b
	Namespace: prompts
	Checksum: 0xB000093
	Offset: 0x63A8
	Size: 0x2E4
	Parameters: 3
	Flags: Private
*/
function private function_fcef5f5b(prompt, var_62bce5b6, player)
{
	if(is_true(var_62bce5b6.var_f14d06ca))
	{
		if(isdefined(var_62bce5b6.var_c570a6f9))
		{
			var_62bce5b6.var_c570a6f9 = var_62bce5b6.var_c570a6f9 + (float(function_60d95f53()) / 1000);
		}
	}
	else
	{
		var_62bce5b6.var_5a8a10f2 = undefined;
		if(!isdefined(var_62bce5b6.var_c570a6f9))
		{
			var_62bce5b6.var_c570a6f9 = gettime();
		}
		var_de6f0004 = int((isdefined(var_62bce5b6.var_de6f0004) ? var_62bce5b6.var_de6f0004 : 0.25) * 1000);
		var_4ac77177 = int((isdefined(var_62bce5b6.var_4ac77177) ? var_62bce5b6.var_4ac77177 : 0.1) * 1000);
		if(!player gamepadusedlast() && !player function_5c0f244() && var_de6f0004 <= level.var_503dffcb[#"cg_cpmaxholddurationignore"])
		{
			var_62bce5b6.state = 2;
			self function_efb98d80(prompt, var_62bce5b6, player);
		}
		else if((gettime() - var_62bce5b6.var_c570a6f9) >= var_4ac77177)
		{
			var_62bce5b6.state = 2;
			pct = (var_de6f0004 > 0 ? 0 : 1);
			if(pct < 1)
			{
				pct = math::clamp(((gettime() - var_62bce5b6.var_c570a6f9) - var_4ac77177) / var_de6f0004, 0, 1);
			}
			namespace_61e6d095::function_f2a9266(self.var_3e95b88f.uid, self.var_3e95b88f.var_294a441e[prompt], "fraction", pct, self.var_3e95b88f.var_db58523e);
			if(pct >= 1)
			{
				self function_efb98d80(prompt, var_62bce5b6, player);
			}
		}
	}
}

/*
	Name: function_efb98d80
	Namespace: prompts
	Checksum: 0x7CEECD70
	Offset: 0x6698
	Size: 0x2EC
	Parameters: 3
	Flags: Private
*/
function private function_efb98d80(prompt, var_62bce5b6, player)
{
	var_1df3804c = (isdefined(var_62bce5b6.var_1df3804c) ? var_62bce5b6.var_1df3804c : self);
	var_1df3804c notify("interactive_prompt_" + prompt);
	var_1df3804c notify(#"interact", {#player:player, #prompt:prompt});
	bb::function_a0d15803(var_62bce5b6.var_4d98c3ce, self function_334e020(), player);
	if(prompt == #"use" || prompt == #"hash_794885d9482cb75e")
	{
		player function_58b29f4f();
	}
	if(isdefined(level.prompts[prompt].notify_string))
	{
		var_1df3804c notify(level.prompts[prompt].notify_string, {#prompt:prompt, #activator:player});
	}
	if(isdefined(var_62bce5b6.notify_string))
	{
		var_1df3804c notify(var_62bce5b6.notify_string);
	}
	if(isdefined(var_62bce5b6.complete_callback))
	{
		var_1df3804c thread [[var_62bce5b6.complete_callback]]({#player:player, #prompt:prompt});
	}
	if(!is_true(var_62bce5b6.removing))
	{
		var_62bce5b6.state = 3;
		endons = [1:"death", 0:"all_prompts_removed"];
		if((isdefined(var_62bce5b6.var_be77841a) ? var_62bce5b6.var_be77841a : 1))
		{
			self thread util::delay(0.25, endons, &remove, prompt);
		}
		else
		{
			var_62bce5b6.var_5a8a10f2 = 1;
			endons[endons.size] = "prompt_removed_" + prompt;
			self thread util::delay(0.25, endons, &function_f4bf235a, self.var_3e95b88f.uid, prompt, 0);
		}
	}
}

/*
	Name: function_f4bf235a
	Namespace: prompts
	Checksum: 0xC591DB73
	Offset: 0x6990
	Size: 0x13C
	Parameters: 3
	Flags: Private
*/
function private function_f4bf235a(uid, prompt, state)
{
	if(is_true(self.var_3e95b88f.prompts[prompt].removing))
	{
		return;
	}
	if(isdefined(self.var_3e95b88f.prompts[prompt]))
	{
		self.var_3e95b88f.prompts[prompt].state = state;
	}
	self notify(#"hash_4de92efaa3e2025e", {#state:state, #prompt:prompt});
	if(isdefined(self.var_3e95b88f.var_294a441e[prompt]) && isdefined(self.var_3e95b88f.uid))
	{
		namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "state", state, self.var_3e95b88f.var_db58523e);
	}
}

/*
	Name: function_9309081b
	Namespace: prompts
	Checksum: 0xD366C46E
	Offset: 0x6AD8
	Size: 0xBC
	Parameters: 2
	Flags: Private
*/
function private function_9309081b(uid, prompt)
{
	if(isdefined(self.var_3e95b88f.prompts[prompt].var_c570a6f9))
	{
		self.var_3e95b88f.prompts[prompt].var_5a8a10f2 = undefined;
		self.var_3e95b88f.prompts[prompt].var_c570a6f9 = undefined;
		namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "fraction", 0, self.var_3e95b88f.var_db58523e);
	}
}

/*
	Name: function_ab46a161
	Namespace: prompts
	Checksum: 0xB250B701
	Offset: 0x6BA0
	Size: 0x364
	Parameters: 2
	Flags: Private
*/
function private function_ab46a161(prompt, var_62bce5b6)
{
	self endon(#"death", "prompt_removed_" + prompt);
	player = getplayers()[0];
	player endon(#"death");
	gamepad = player gamepadusedlast();
	var_1ea21098 = undefined;
	var_34fc0bda = undefined;
	uid = var_62bce5b6.uid;
	while(isdefined(var_62bce5b6.uid))
	{
		is_disabled = isdefined(var_62bce5b6.prompts[prompt].state) && (var_62bce5b6.prompts[prompt].state == 0 || var_62bce5b6.prompts[prompt].state == 4);
		if(self [[level.prompts[prompt].var_92bb1cb1]]({#player:player, #hash_62bce5b6:var_62bce5b6, #prompt:prompt}) && (is_true(var_62bce5b6.prompts[prompt].var_f14d06ca) || is_disabled))
		{
			self function_2e6d74f5(prompt, 1);
		}
		else
		{
			self function_2e6d74f5(prompt, 0);
		}
		var_57f18593 = gamepad != player gamepadusedlast();
		if(var_57f18593)
		{
			gamepad = !gamepad;
			player val::reset_all(uid);
		}
		var_dc231c8e = 1;
		var_7a529262 = var_62bce5b6.prompts[prompt].var_8cff8c16;
		if(isdefined(var_7a529262))
		{
			var_dc231c8e = self [[var_7a529262]]({#player:player, #hash_62bce5b6:var_62bce5b6, #prompt:prompt});
		}
		if(var_1ea21098 !== is_disabled || var_34fc0bda !== var_dc231c8e || var_57f18593)
		{
			if(var_dc231c8e && !is_disabled)
			{
				function_f619081c(prompt, var_62bce5b6);
			}
			else
			{
				function_17578ab7(prompt, var_62bce5b6);
			}
			var_34fc0bda = var_dc231c8e;
			var_1ea21098 = is_disabled;
		}
		waitframe(1);
	}
	if(isdefined(uid) && !is_true(var_1ea21098))
	{
		function_17578ab7(prompt, var_62bce5b6, uid);
	}
}

/*
	Name: function_6d9e6b7d
	Namespace: prompts
	Checksum: 0xF7E0FD5D
	Offset: 0x6F10
	Size: 0x138
	Parameters: 3
	Flags: Private
*/
function private function_6d9e6b7d(player, prompt, uid)
{
	player endon(#"death");
	self endon(#"hash_1316225507a4f1bb", "reset_button_inputs_" + prompt);
	while(true)
	{
		player waittill(#"weapon_fired");
		weapon = player getcurrentweapon();
		if(is_true(weapon.isboltaction) || (player getweaponammoclip(weapon) == 0 && player getweaponammostock(weapon) > 0))
		{
			player val::reset(uid, "disable_weapon_reload");
			wait(0.5);
			player val::set(uid, "disable_weapon_reload", 1);
		}
	}
}

/*
	Name: function_f619081c
	Namespace: prompts
	Checksum: 0x8A2B3FEA
	Offset: 0x7050
	Size: 0x4FA
	Parameters: 2
	Flags: Private
*/
function private function_f619081c(prompt, var_62bce5b6)
{
	player = getplayers()[0];
	switch(prompt)
	{
		case "use":
		case "hash_794885d9482cb75e":
		{
			player val::set(var_62bce5b6.uid, "disable_usability", 1);
			player val::set(var_62bce5b6.uid, "disable_weapon_pickup", 1);
			if(player gamepadusedlast())
			{
				player val::set(var_62bce5b6.uid, "disable_weapon_reload", 1);
				self thread function_6d9e6b7d(player, prompt, var_62bce5b6.uid);
			}
			break;
		}
		case "hash_3c5c65155dfb1731":
		case "melee":
		{
			player val::set(var_62bce5b6.uid, "allow_melee", 0);
			break;
		}
		case "attack":
		{
			player val::set(var_62bce5b6.uid, "disable_weapon_fire", 1);
			break;
		}
		case "reload":
		{
			player val::set(var_62bce5b6.uid, "disable_weapon_reload", 1);
			self thread function_6d9e6b7d(player, prompt, var_62bce5b6.uid);
			if(player gamepadusedlast())
			{
				player val::set(var_62bce5b6.uid, "disable_usability", 1);
				player val::set(var_62bce5b6.uid, "disable_weapon_pickup", 1);
			}
			break;
		}
		case "frag":
		{
			player val::set(var_62bce5b6.uid, "disable_offhand_weapons", 1);
			break;
		}
		case "stance":
		{
			stance = player getstance();
			if(stance == "stand")
			{
				player val::set(var_62bce5b6.uid, "allow_stand", 1);
				player val::set(var_62bce5b6.uid, "allow_crouch", 0);
				player val::set(var_62bce5b6.uid, "allow_prone", 0);
			}
			else
			{
				if(stance == "crouch")
				{
					player val::set(var_62bce5b6.uid, "allow_stand", 0);
					player val::set(var_62bce5b6.uid, "allow_crouch", 1);
					player val::set(var_62bce5b6.uid, "allow_prone", 0);
				}
				else if(stance == "prone")
				{
					player val::set(var_62bce5b6.uid, "allow_stand", 0);
					player val::set(var_62bce5b6.uid, "allow_crouch", 0);
					player val::set(var_62bce5b6.uid, "allow_prone", 1);
				}
			}
			break;
		}
		case "weapnext":
		{
			player val::set(var_62bce5b6.uid, "disable_weapon_cycling", 1);
			break;
		}
		case "ads":
		{
			player val::set(var_62bce5b6.uid, "allow_ads", 0);
			break;
		}
	}
}

/*
	Name: function_17578ab7
	Namespace: prompts
	Checksum: 0xA7D86E2E
	Offset: 0x7558
	Size: 0x464
	Parameters: 3
	Flags: Private
*/
function private function_17578ab7(prompt, var_62bce5b6, uid)
{
	if(!isdefined(uid))
	{
		uid = var_62bce5b6.uid;
	}
	player = getplayers()[0];
	if(isdefined(uid) && isdefined(player))
	{
		if(!isdefined(prompt))
		{
			player val::reset_all(uid);
			self notify(#"hash_1316225507a4f1bb");
		}
		else
		{
			switch(prompt)
			{
				case "use":
				case "hash_794885d9482cb75e":
				{
					player val::reset(uid, "disable_usability");
					player val::reset(uid, "disable_weapon_pickup");
					if(player gamepadusedlast())
					{
						player val::reset(uid, "disable_weapon_reload");
					}
					break;
				}
				case "hash_3c5c65155dfb1731":
				case "melee":
				{
					player val::reset(uid, "allow_melee");
					break;
				}
				case "attack":
				{
					player val::reset(uid, "disable_weapon_fire");
					break;
				}
				case "reload":
				{
					player val::reset(uid, "disable_weapon_reload");
					if(player gamepadusedlast())
					{
						player val::reset(uid, "disable_usability");
						player val::reset(uid, "disable_weapon_pickup");
					}
					break;
				}
				case "frag":
				{
					player val::reset(uid, "disable_offhand_weapons");
					break;
				}
				case "stance":
				{
					stance = player getstance();
					if(stance == "stand")
					{
						player val::reset(uid, "allow_stand");
						player val::reset(uid, "allow_crouch");
						player val::reset(uid, "allow_prone");
					}
					else
					{
						if(stance == "crouch")
						{
							player val::reset(uid, "allow_stand");
							player val::reset(uid, "allow_crouch");
							player val::reset(uid, "allow_prone");
						}
						else if(stance == "prone")
						{
							player val::reset(uid, "allow_stand");
							player val::reset(uid, "allow_crouch");
							player val::reset(uid, "allow_prone");
						}
					}
					break;
				}
				case "weapnext":
				{
					player val::reset(uid, "disable_weapon_cycling");
					break;
				}
				case "ads":
				{
					player val::reset(uid, "allow_ads");
					break;
				}
			}
			self notify("reset_button_inputs_" + prompt);
		}
	}
}

/*
	Name: function_a6104953
	Namespace: prompts
	Checksum: 0x79585162
	Offset: 0x79C8
	Size: 0x596
	Parameters: 0
	Flags: Private
*/
function private function_a6104953()
{
	if(!isdefined(level.var_f4f784c9))
	{
		level.var_f4f784c9 = 0;
	}
	if(!isdefined(self.var_3e95b88f.var_9215353e))
	{
		self.var_3e95b88f.var_9215353e = "prompt_" + level.var_f4f784c9;
		level.var_f4f784c9++;
	}
	self.var_3e95b88f.uid = self.var_3e95b88f.var_9215353e;
	uid = self.var_3e95b88f.uid;
	var_3a6b0af4 = undefined;
	clamp = 1;
	hud = self.var_3e95b88f.hud;
	/#
		if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] > 0)
		{
			hud = 1;
		}
		else if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] < 0)
		{
			hud = 0;
		}
	#/
	if(hud)
	{
		namespace_61e6d095::create(uid, #"hash_2a9f8d08dadef41e");
		self thread function_17533001(uid);
		if(isentity(self))
		{
			self thread namespace_61e6d095::delete_on_death(uid);
		}
		if(!is_true(self.var_3e95b88f.var_a5ce465f) && !isplayer(self) && (!isactor(self) || isdefined(self.var_3e95b88f.prompts[#"use"])))
		{
			self.var_3e95b88f.var_b003a020 = uid + "_circle";
			var_3a6b0af4 = self.var_3e95b88f.var_b003a020;
			clamp = 0;
			namespace_61e6d095::create(var_3a6b0af4, #"hash_115c63d4ac6a1d5f");
		}
	}
	else
	{
		var_3a6b0af4 = uid;
		namespace_61e6d095::create(uid, #"hash_57fd5ecbc8126b21");
	}
	if(isdefined(var_3a6b0af4))
	{
		if(isdefined(self.var_3e95b88f.text))
		{
			namespace_61e6d095::function_d5ea17f0(var_3a6b0af4, self.var_3e95b88f.text);
		}
		if(isdefined(self.var_3e95b88f.image))
		{
			namespace_61e6d095::function_309bf7c2(var_3a6b0af4, self.var_3e95b88f.image);
		}
		namespace_61e6d095::function_aa5c711d(var_3a6b0af4, 0);
		namespace_61e6d095::function_6e0fad3b(var_3a6b0af4, self);
		offset = (isdefined(self.var_3e95b88f.offset) ? self.var_3e95b88f.offset : (0, 0, 0));
		if(!self function_5a11b8f6())
		{
			offset = offset + self.origin;
			self.var_3e95b88f.local_offset = 0;
		}
		if(offset != (0, 0, 0))
		{
			if(offset[0] != 0)
			{
				namespace_61e6d095::function_4d9fbc9d(var_3a6b0af4, offset[0]);
			}
			if(offset[1] != 0)
			{
				namespace_61e6d095::function_52dbc715(var_3a6b0af4, offset[1]);
			}
			if(offset[2] != 0)
			{
				namespace_61e6d095::function_60856268(var_3a6b0af4, offset[2]);
			}
		}
		if(isdefined(self.var_3e95b88f.tag))
		{
			namespace_61e6d095::function_8aa0007(var_3a6b0af4, self.var_3e95b88f.tag);
		}
		else
		{
			namespace_61e6d095::function_e648abd8(var_3a6b0af4, is_true(self.var_3e95b88f.var_754bedbb));
		}
		namespace_61e6d095::function_9c3ced73(var_3a6b0af4, self.var_3e95b88f.local_offset);
		namespace_61e6d095::function_eb16868b(var_3a6b0af4, 1);
		namespace_61e6d095::function_4ef79fca(var_3a6b0af4, clamp);
		namespace_61e6d095::set_state(var_3a6b0af4, 0);
	}
	namespace_61e6d095::function_b1e6d7a8(uid, 0);
	namespace_61e6d095::set_state(uid, 0);
	namespace_61e6d095::function_330981ed(uid);
	self notify(#"hash_6bf192c39a59f343");
}

/*
	Name: function_263b3850
	Namespace: prompts
	Checksum: 0x55A34549
	Offset: 0x7F68
	Size: 0x46C
	Parameters: 2
	Flags: Private
*/
function private function_263b3850(uid, prompt)
{
	if(!namespace_61e6d095::function_cd59371c(uid, self.var_3e95b88f.var_294a441e[prompt], self.var_3e95b88f.var_db58523e) && !is_true(self.var_3e95b88f.prompts[prompt].removing))
	{
		var_7125b341 = 0;
		if(isdefined(self.var_3e95b88f.prompts[prompt].var_4d98c3ce))
		{
			namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "text", self.var_3e95b88f.prompts[prompt].var_4d98c3ce, self.var_3e95b88f.var_db58523e);
			var_7125b341 = 1;
		}
		if(isdefined(level.prompts[prompt].button_text))
		{
			if(isdefined(level.prompts[prompt].var_e4c7b05f))
			{
				self thread function_93551c9a(uid, prompt);
			}
			else
			{
				namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "button_text", level.prompts[prompt].button_text, self.var_3e95b88f.var_db58523e);
			}
			var_7125b341 = 1;
		}
		if(isdefined(level.prompts[prompt].button_action))
		{
			namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "button_action", level.prompts[prompt].button_action, self.var_3e95b88f.var_db58523e);
			var_7125b341 = 1;
		}
		if((isdefined(self.var_62bce5b6.var_de6f0004) ? self.var_62bce5b6.var_de6f0004 : 0.25) > 0)
		{
			namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "fraction", 0, self.var_3e95b88f.var_db58523e);
		}
		if(var_7125b341)
		{
			namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "state", self.var_3e95b88f.prompts[prompt].state, self.var_3e95b88f.var_db58523e);
		}
		flags = self.var_3e95b88f.prompts[prompt].flags;
		/#
			if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] == 2)
			{
				flags = flags & (~1);
			}
			else if(level.var_a48f9f79[#"hash_464a6e9e035a826e"] == 3)
			{
				flags = flags | 1;
			}
		#/
		namespace_61e6d095::function_9bc1d2f1(uid, self.var_3e95b88f.var_294a441e[prompt], flags, 1, "flags", self.var_3e95b88f.var_db58523e);
		if(isdefined(level.prompts[prompt].var_9a98e590))
		{
			self thread [[level.prompts[prompt].var_9a98e590]](prompt, self.var_3e95b88f);
		}
	}
}

/*
	Name: function_8de9a77a
	Namespace: prompts
	Checksum: 0xE16D546D
	Offset: 0x83E0
	Size: 0x16E
	Parameters: 0
	Flags: Private
*/
function private function_8de9a77a()
{
	namespace_61e6d095::remove(self.var_3e95b88f.uid);
	if(isdefined(self.var_3e95b88f.var_b003a020))
	{
		namespace_61e6d095::remove(self.var_3e95b88f.var_b003a020);
		self.var_3e95b88f.var_b003a020 = undefined;
	}
	if(isdefined(self.var_3e95b88f.objective))
	{
		namespace_96850e69::function_278c15e6(self.var_3e95b88f.objective, self, 0);
	}
	if(self flag::get(#"hash_305ce4d5b74a637a"))
	{
		self flag::clear(#"hash_305ce4d5b74a637a");
		player = getplayers()[0];
		player flag::clear(#"hash_599ec0eee77657ef");
		player val::reset_all(#"hash_599ec0eee77657ef");
	}
	self notify(#"hash_7d3af7cbbc793b23");
	self.var_3e95b88f.uid = undefined;
}

/*
	Name: function_93551c9a
	Namespace: prompts
	Checksum: 0xEC2D7599
	Offset: 0x8558
	Size: 0x1A0
	Parameters: 2
	Flags: Private
*/
function private function_93551c9a(uid, prompt)
{
	self endon(#"death", "prompt_removed_" + prompt, #"hash_7d3af7cbbc793b23");
	player = getplayers()[0];
	player endon(#"death");
	gamepad = player gamepadusedlast();
	button_text[0] = level.prompts[prompt].var_e4c7b05f;
	button_text[1] = level.prompts[prompt].button_text;
	namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "button_text", button_text[gamepad], self.var_3e95b88f.var_db58523e);
	while(true)
	{
		waitframe(1);
		if(gamepad != player gamepadusedlast())
		{
			gamepad = !gamepad;
			namespace_61e6d095::function_f2a9266(uid, self.var_3e95b88f.var_294a441e[prompt], "button_text", button_text[gamepad], self.var_3e95b88f.var_db58523e);
		}
	}
}

/*
	Name: function_17533001
	Namespace: prompts
	Checksum: 0xBA59A267
	Offset: 0x8700
	Size: 0x2D8
	Parameters: 1
	Flags: Private
*/
function private function_17533001(uid)
{
	self endoncallback(&function_74f42405, #"death", #"all_prompts_removed", #"hash_7d3af7cbbc793b23");
	level endon(#"level_restarting");
	var_66c1748e = (isdefined(self.var_3e95b88f.display_name) ? self.var_3e95b88f.display_name : self function_7f0363e8());
	var_2d3f59fc = (isdefined(self.var_3e95b88f.team) ? self.var_3e95b88f.team : util::getteamindex(self getteam()));
	if(var_66c1748e === "")
	{
		var_66c1748e = undefined;
	}
	while(true)
	{
		ret = undefined;
		ret = self waittill(#"hash_5ede0284920c4c56");
		if(ret.interactable || isdefined(self.var_3e95b88f.var_fc01e65d))
		{
			if(isdefined(self.var_3e95b88f.var_43c33448))
			{
				namespace_61e6d095::function_9ade1d9b(uid, "namespace_image", self.var_3e95b88f.var_43c33448);
				namespace_61e6d095::function_b1e6d7a8(uid, (isdefined(self.var_3e95b88f.var_fc01e65d) ? self.var_3e95b88f.var_fc01e65d : 0));
				self globallogic_ui::function_ec25f500(" ", 0);
			}
			else if(isdefined(var_66c1748e))
			{
				self globallogic_ui::function_ec25f500(var_66c1748e, var_2d3f59fc);
			}
		}
		else
		{
			if(isdefined(self.var_3e95b88f.var_43c33448))
			{
				namespace_61e6d095::function_9ade1d9b(uid, "namespace_image", #"");
				namespace_61e6d095::function_b1e6d7a8(uid, 0);
				self globallogic_ui::function_109202c3();
			}
			else if(isdefined(var_66c1748e))
			{
				self globallogic_ui::function_109202c3();
			}
		}
	}
}

/*
	Name: function_74f42405
	Namespace: prompts
	Checksum: 0xFBF4C3A2
	Offset: 0x89E0
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_74f42405(end_on)
{
	self globallogic_ui::function_109202c3();
}

/*
	Name: function_5a11b8f6
	Namespace: prompts
	Checksum: 0xC7582ECA
	Offset: 0x8A10
	Size: 0x58
	Parameters: 0
	Flags: Private
*/
function private function_5a11b8f6()
{
	if(isstruct(self) || self.classname === "script_origin" || isplayer(self))
	{
		return false;
	}
	return true;
}

