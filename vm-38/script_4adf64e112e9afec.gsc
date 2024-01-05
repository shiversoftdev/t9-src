#using script_3b893ec1252cdffd;
#using script_6ac5ce345bf4213b;
#using script_5d76b3609d3af702;
#using script_15672f35157ae7ca;
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_60a2f38d6d37fd6a;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\hud_message_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_6e90e490;

/*
	Name: function_5355fcaa
	Namespace: namespace_6e90e490
	Checksum: 0x4526E066
	Offset: 0x6C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5355fcaa()
{
	level notify(1462517233);
}

/*
	Name: init
	Namespace: namespace_6e90e490
	Checksum: 0xA5E95CAD
	Offset: 0x6E0
	Size: 0xFCC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_381c8192();
	function_9d1ddcae();
	for(i = 1; i <= 4; i++)
	{
		toks = strtok("doaGlobal.player$.hudVisible", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"hash_5ac52f4c96170158", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.bombs", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"bombs", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 4, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.boosts", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"boosts", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 4, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.keys", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"keys", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 4, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.lives", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"lives", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 4, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.score", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"score", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 30, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.health", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"health", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 8, "float", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.scoreMultiplier", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"scoremultiplier", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 4, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.scoreMultiProgressBar", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"hash_595f464eb4cdcb42", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 8, "float", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.weaponType", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"weapontype", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 3, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.weaponLevel", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"weaponlevel", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 2, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.weaponDecayBar", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"hash_c41033658f37cae", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 8, "float", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.leader", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"leader", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.respawnTimer", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"hash_16018de847ee6274", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 8, "float", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.respawnSeconds", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"hash_33b3ceb63cdb8d3c", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 16, "int", undefined, 0, 0);
		toks = strtok("doaGlobal.player$.respawnHelpers", "$");
		clientfieldname = (toks[0] + i) + toks[1];
		clientfield::function_5b7d846d(clientfieldname, #"hash_365a974a1df27ef4", [1:#"hash_2c48244ed6df47d8", 0:#"player" + (isdefined(i) ? "" + i : "")], 1, 2, "int", undefined, 0, 0);
	}
	clientfield::register("scriptmover", "set_health_bar", 1, 8, "int", &function_36e44202, 0, 0);
	clientfield::register("scriptmover", "show_health_bar", 1, 1, "int", &function_f5b1f2e0, 0, 0);
	clientfield::register("actor", "set_health_bar", 1, 8, "int", &function_36e44202, 0, 0);
	clientfield::register("actor", "show_health_bar", 1, 1, "int", &function_f5b1f2e0, 0, 0);
	clientfield::register("scriptmover", "set_text_bubble", 1, 6, "int", &function_fd71fef3, 0, 0);
	clientfield::register("actor", "set_text_bubble", 1, 6, "int", &function_fd71fef3, 0, 0);
	clientfield::register("allplayers", "set_text_bubble", 1, 6, "int", &function_fd71fef3, 0, 0);
	clientfield::register("scriptmover", "setPlayerOwner", 1, 3, "int", &setplayerowner, 0, 0);
	clientfield::register("scriptmover", "set_name_bubble", 1, 1, "int", &function_f01e3809, 0, 0);
	clientfield::register("toplayer", "showPlayerHint", 1, 4, "int", &showplayerhint, 0, 0);
	clientfield::register("scriptmover", "setTutorialEnt", 1, 1, "int", &function_94c1298b, 0, 0);
	clientfield::register("toplayer", "setCompassVis", 1, 1, "counter", &function_b5afa57f, 0, 0);
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_6e90e490
	Checksum: 0xDF79473B
	Offset: 0x16B8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	function_295b0822();
	function_2c7423ff();
	function_820380e1();
}

/*
	Name: function_381c8192
	Namespace: namespace_6e90e490
	Checksum: 0x64D4BF22
	Offset: 0x1700
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_381c8192()
{
	level.doa.healthbars = [];
	for(i = 0; i < 8; i++)
	{
		obj = spawnstruct();
		obj.var_e429ef89 = luielem_entity_bar::register_clientside();
		obj.localclientnum = -1;
		obj.entitynum = -1;
		level.doa.healthbars[i] = obj;
	}
}

/*
	Name: function_295b0822
	Namespace: namespace_6e90e490
	Checksum: 0xEF0284E1
	Offset: 0x17A8
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_295b0822()
{
	foreach(obj in level.doa.healthbars)
	{
		if(obj.localclientnum != -1 && obj.var_e429ef89 luielem_entity_bar::is_open(obj.localclientnum))
		{
			obj.var_e429ef89 luielem_entity_bar::close(obj.localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
	}
	namespace_1e25ad94::debugmsg("Reset all healthBars");
}

/*
	Name: function_84f188ed
	Namespace: namespace_6e90e490
	Checksum: 0x9834647E
	Offset: 0x18C0
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_84f188ed(localclientnum, entitynum)
{
	foreach(obj in level.doa.healthbars)
	{
		if(!isdefined(obj))
		{
			continue;
		}
		if(obj.localclientnum === localclientnum && obj.entitynum === entitynum)
		{
			return obj;
		}
	}
}

/*
	Name: function_deb84496
	Namespace: namespace_6e90e490
	Checksum: 0x2C04C459
	Offset: 0x1990
	Size: 0x1A0
	Parameters: 2
	Flags: Linked
*/
function function_deb84496(localclientnum, entitynum)
{
	var_6c978e26 = function_84f188ed(localclientnum, entitynum);
	if(!isdefined(var_6c978e26))
	{
		foreach(obj in level.doa.healthbars)
		{
			if(obj.localclientnum == -1 && obj.entitynum == -1)
			{
				var_6c978e26 = obj;
				break;
			}
		}
	}
	if(isdefined(var_6c978e26))
	{
		var_6c978e26.localclientnum = localclientnum;
		var_6c978e26.entitynum = entitynum;
		if(!var_6c978e26.var_e429ef89 luielem_entity_bar::is_open(localclientnum))
		{
			var_6c978e26.var_e429ef89 luielem_entity_bar::open(localclientnum);
		}
		var_6c978e26.var_e429ef89 luielem_entity_bar::set_entnum(localclientnum, entitynum);
		namespace_1e25ad94::debugmsg((("Allocated a healthBar to localClientNum:" + localclientnum) + " Entity:") + entitynum);
		return var_6c978e26.var_e429ef89;
	}
}

/*
	Name: function_60e526c9
	Namespace: namespace_6e90e490
	Checksum: 0xB7554FFD
	Offset: 0x1B38
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_60e526c9(localclientnum, entitynum)
{
	obj = function_84f188ed(localclientnum, entitynum);
	if(isdefined(obj))
	{
		if(obj.var_e429ef89 luielem_entity_bar::is_open(localclientnum))
		{
			obj.var_e429ef89 luielem_entity_bar::close(localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
		namespace_1e25ad94::debugmsg((("Released a healthBar to localClientNum:" + localclientnum) + " Entity:") + entitynum);
	}
}

/*
	Name: function_b935ba2b
	Namespace: namespace_6e90e490
	Checksum: 0x15F31669
	Offset: 0x1C08
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_b935ba2b(localclientnum, entitynum)
{
	self notify("167e71a2e2cf95fa");
	self endon("167e71a2e2cf95fa");
	self waittill(#"death", #"disconnect");
	function_60e526c9(localclientnum, entitynum);
	function_5f71ab96(localclientnum, entitynum);
	function_651f262d(localclientnum, entitynum);
}

/*
	Name: function_f5b1f2e0
	Namespace: namespace_6e90e490
	Checksum: 0x84B6434A
	Offset: 0x1CB0
	Size: 0x1A6
	Parameters: 7
	Flags: Linked
*/
function function_f5b1f2e0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_e4f0114d))
		{
			namespace_1e25ad94::debugmsg("Entity requesting a healthBar");
			self.var_e4f0114d = function_deb84496(fieldname, self getentitynumber());
			if(!isdefined(self.var_e4f0114d))
			{
				namespace_1e25ad94::debugmsg("---> Request FAILED!!!");
				return;
			}
			self thread function_b935ba2b(fieldname, self getentitynumber());
			if(self.var_e4f0114d luielem_entity_bar::is_open(fieldname))
			{
				self.var_e4f0114d luielem_entity_bar::function_b4023f5a(fieldname, 0, 0, 90);
				self.var_e4f0114d luielem_entity_bar::set_entityscale(fieldname, 0.5);
				self function_c53f825c(fieldname);
			}
		}
	}
	else
	{
		function_60e526c9(fieldname, self getentitynumber());
		self.var_e4f0114d = undefined;
	}
}

/*
	Name: function_c53f825c
	Namespace: namespace_6e90e490
	Checksum: 0x34FDC936
	Offset: 0x1E60
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_c53f825c(localclientnum)
{
	if(!self.var_e4f0114d luielem_entity_bar::is_open(localclientnum))
	{
		return;
	}
	if(!isdefined(self.health_percent))
	{
		self.health_percent = 1;
	}
	state = "Green";
	if(self.health_percent < 0.65)
	{
		state = "Yellow";
	}
	if(self.health_percent < 0.25)
	{
		state = "Red";
	}
	namespace_1e25ad94::debugmsg((("Setting healthBar to progress: " + self.health_percent) + " State is: ") + state);
	self.var_e4f0114d luielem_entity_bar::set_progress_percent(localclientnum, self.health_percent);
	self.var_e4f0114d luielem_entity_bar::set_state(localclientnum, hash(state));
}

/*
	Name: function_36e44202
	Namespace: namespace_6e90e490
	Checksum: 0x56BF16B2
	Offset: 0x1F88
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_36e44202(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.health_percent = bwastimejump / ((1 << 8) - 1);
	if(!isdefined(self.var_e4f0114d))
	{
		return;
	}
	if(self.health_percent == 0)
	{
		function_60e526c9(fieldname, self getentitynumber());
		self.var_e4f0114d = undefined;
	}
	else
	{
		self function_c53f825c(fieldname);
	}
}

/*
	Name: function_9d1ddcae
	Namespace: namespace_6e90e490
	Checksum: 0x60FEEA10
	Offset: 0x2060
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_9d1ddcae()
{
	level.doa.var_b1d82287 = [];
	for(i = 0; i < 8; i++)
	{
		obj = spawnstruct();
		obj.var_e429ef89 = doa_textbubble::register_clientside();
		obj.localclientnum = -1;
		obj.entitynum = -1;
		level.doa.var_b1d82287[i] = obj;
	}
	level.doa.var_96dc6b3b = [];
	for(i = 0; i < 4; i++)
	{
		obj = spawnstruct();
		obj.var_e429ef89 = doa_textbubble_playername::register_clientside();
		obj.localclientnum = -1;
		obj.entitynum = -1;
		level.doa.var_96dc6b3b[i] = obj;
	}
	init_skits();
}

/*
	Name: init_skits
	Namespace: namespace_6e90e490
	Checksum: 0xC7D4FC54
	Offset: 0x21A8
	Size: 0x1EA2
	Parameters: 0
	Flags: Linked
*/
function init_skits()
{
	level.doa.var_d0bdbf5a = array({#audio:#"hash_b66182b7f4ee8aa", #msg:#"hash_3761709e45ee7413"}, {#audio:#"hash_34db577b2720cb9e", #msg:#"hash_4ecbcdaa4f28745"}, {#audio:#"hash_6649a4c8ed23ba9a", #msg:#"hash_25eef8d329ff6fd7"}, {#audio:#"hash_12e78a32ea420eeb", #msg:#"hash_10451626ccad1124"}, {#audio:#"hash_6ad099fda49eee77", #msg:#"hash_218a8d7fa7f5e39c"}, {#audio:#"hash_5e8abe7af6535450", #msg:#"hash_2e511dda73e51a4b"}, {#audio:#"hash_2425e4770a6b94", #msg:#"hash_1ddfbb6e0754abed"}, {#audio:#"hash_5c88e30612571c9b", #msg:#"hash_2f2a6f14813f8f08"}, {#audio:#"hash_3f23a8fe0490f53a", #msg:#"hash_36685757a129358d"}, {#audio:#"hash_c49e8df639c4571", #msg:#"hash_4f5b737a2a2cffaa"}, {#audio:#"hash_6f026b669926e19d", #msg:#"hash_796174f50e8666a4"}, {#audio:#"hash_514d8021dcc34170", #msg:#"hash_6997adb579bc7105"}, {#audio:#"hash_6c7395dd95739008", #msg:#"hash_244b5ba978c0718d"}, {#audio:#"hash_c0480fde7da2a06", #msg:#"hash_3645f57848983a1"}, {#audio:#"hash_bbc28cba3a8b024", #msg:#"hash_62ceb179fb3b5373"}, {#audio:#"hash_1fcc6f6b09fa86a4", #msg:#"hash_77b0706e32838c3f"}, {#audio:#"hash_62809f3dcbc7dfe5", #msg:#"hash_29ef8da8bf525634"}, {#audio:#"hash_1c4736524d26b3c3", #msg:#"hash_2288ddd0835ecfae"});
	level.doa.var_5127d579 = array({#audio:#"hash_13ab64f55760eef8", #msg:#"hash_5ee26388ce7eaaf"}, {#audio:#"hash_13ab67f55760f411", #msg:#"hash_5ee27388ce7ec62"}, {#audio:#"hash_13ab66f55760f25e", #msg:#"hash_5ee28388ce7ee15"}, {#audio:#"hash_13ab69f55760f777", #msg:#"hash_5ee21388ce7e230"}, {#audio:#"hash_13ab68f55760f5c4", #msg:#"hash_5ee22388ce7e3e3"});
	level.doa.var_49bb35e6 = array({#audio:#"hash_56be8789e638763d", #msg:#"hash_6f6d7c35437f4086"});
	level.doa.var_1d7871ce = array({#audio:#"hash_56be8789e638763d", #msg:#"hash_6f6d7c35437f4086"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_271049f29ea6ade2"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_140b25d079b4c26f"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_48357e670e5aad39"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_4d97f0bcf392ed56"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_25e6dfbe3727c43d"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_5e4040ce198ca3c5"});
	level.doa.var_e4e89788 = array({#audio:#"hash_607b2f00c28e3d09", #msg:#"hash_5d480559ac63e5de"}, {#audio:#"hash_607b2f00c28e3d09", #msg:#"hash_5d480459ac63e42b"}, {#audio:#"hash_607b2f00c28e3d09", #msg:#"hash_5d480359ac63e278"}, {#audio:#"hash_607b2f00c28e3d09", #msg:#"hash_5d480a59ac63ee5d"});
	level.doa.var_df795bcd = array({#audio:#"hash_7d2d226b6deade0", #msg:#"hash_329650149792bb13"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_329651149792bcc6"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_329652149792be79"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_329653149792c02c"});
	level.doa.var_a95ba945 = array({#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_48dac65666a5a325"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_48dac35666a59e0c"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_48dac45666a59fbf"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_48dac15666a59aa6"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_48dac25666a59c59"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_48dabf5666a59740"});
	level.doa.var_2804d50f = array({#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4f107ad82b007"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4f207ad82b1ba"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4f307ad82b36d"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ec07ad82a788"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ed07ad82a93b"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ee07ad82aaee"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ef07ad82aca1"});
	level.doa.var_a3e9257b = array({#audio:#"hash_aae0b544c967937", #msg:#"hash_28ab03458686738b"}, {#audio:#"hash_aae0b544c967937", #msg:#"hash_28ab04458686753e"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_28ab0545868676f1"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_28ab0645868678a4"});
	level.doa.var_aa304f76 = array({#audio:#"hash_22113791bada1a9d", #msg:#"hash_3504bde956ec54ac"}, {#audio:#"hash_22113791bada1a9d", #msg:#"hash_3504c0e956ec59c5"}, {#audio:#"hash_22113791bada1a9d", #msg:#"hash_3504bfe956ec5812"}, {#audio:#"hash_22113791bada1a9d", #msg:#"hash_3504bae956ec4f93"});
	level.doa.var_6a49d224 = array({#audio:#"hash_7d2d226b6deade0", #msg:#"hash_2c31d0c4dfaaded9"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_2c31cdc4dfaad9c0"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_2c31cec4dfaadb73"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_2c31d3c4dfaae3f2"});
	level.doa.var_4adfb3a5 = array({#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_137127b92c93e171"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_137124b92c93dc58"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_137125b92c93de0b"}, {#audio:#"hash_c8b6e45529ecc06", #msg:#"hash_13712ab92c93e68a"});
	level.doa.var_888445c3 = array({#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a7ecafa0b774"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514aaecafa0bc8d"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a9ecafa0bada"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a4ecafa0b25b"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a3ecafa0b0a8"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a6ecafa0b5c1"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a5ecafa0b40e"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_514a0ecafa0ab8f"});
	level.doa.var_aeba1185 = array({#audio:#"hash_77696e3c6755b83c", #msg:#"hash_58397227dab633c1"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_58396f27dab62ea8"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_58397027dab6305b"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_58397527dab638da"});
	level.doa.var_2ccc7019 = array({#audio:#"hash_607b2f00c28e3d09", #msg:#"hash_3ca5b94fff4b4e02"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_3ca5b84fff4b4c4f"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_3ca5b74fff4b4a9c"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_3ca5b64fff4b48e9"}, {#audio:#"hash_22113791bada1a9d", #msg:#"hash_3ca5b54fff4b4736"});
	level.doa.var_71a8d91b = array({#audio:#"hash_1af6f1a195265272", #msg:#"hash_4d32ffbead665ebf"}, {#audio:#"hash_1af6f1a195265272", #msg:#"hash_4d3300bead666072"}, {#audio:#"hash_1af6f1a195265272", #msg:#"hash_4d32fcbead6659a6"}, {#audio:#"hash_1af6f1a195265272", #msg:#"hash_4d32fdbead665b59"}, {#audio:#"hash_1af6f1a195265272", #msg:#"hash_4d3306bead666aa4"});
	level.doa.var_b07d7943 = array({#audio:undefined, #msg:#"hash_5f9bea3b3617e5bf"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_5f9beb3b3617e772"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_5f9be53b3617dd40"}, {#audio:#"hash_7d2d226b6deade0", #msg:#"hash_5f9be63b3617def3"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_5f9be73b3617e0a6"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_5f9be83b3617e259"});
	level.doa.var_1ad422d4 = array({#audio:undefined, #msg:#"hash_19bfbdce8ae8e874"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_19bfbfce8ae8ebda"}, {#audio:#"hash_77c20123c6693e3c", #msg:#"hash_19bfbcce8ae8e6c1"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_19bfbbce8ae8e50e"}, {#audio:#"hash_56be8789e638763d", #msg:#"hash_19bfb6ce8ae8dc8f"});
	level.doa.var_f754a08d = array({#audio:#"hash_d5bce1134823fca", #msg:#"hash_2c42c6f704aaf047"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_2c42c7f704aaf1fa"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_2c42c8f704aaf3ad"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_2c42c2f704aae97b"}, {#audio:#"hash_d5bce1134823fca", #msg:#"hash_2c42c3f704aaeb2e"});
	level.doa.var_d8541610 = array({#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ed07ad82a93b"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4f107ad82b007"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4f207ad82b1ba"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4f307ad82b36d"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ec07ad82a788"}, {#audio:#"hash_77696e3c6755b83c", #msg:#"hash_1ca4ee07ad82aaee"});
	level.doa.skits = array(11, 10, 43, 44, 45, 46, 47);
}

/*
	Name: function_2c7423ff
	Namespace: namespace_6e90e490
	Checksum: 0xFEA47880
	Offset: 0x4058
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_2c7423ff()
{
	foreach(obj in level.doa.var_b1d82287)
	{
		if(obj.localclientnum != -1 && obj.var_e429ef89 doa_textbubble::is_open(obj.localclientnum))
		{
			obj.var_e429ef89 doa_textbubble::close(obj.localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
	}
	foreach(obj in level.doa.var_96dc6b3b)
	{
		if(obj.localclientnum != -1 && obj.var_e429ef89 doa_textbubble_playername::is_open(obj.localclientnum))
		{
			obj.var_e429ef89 doa_textbubble_playername::close(obj.localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
	}
	namespace_1e25ad94::debugmsg("Reset all text bubbles");
}

/*
	Name: function_9e67af
	Namespace: namespace_6e90e490
	Checksum: 0xB8EC3410
	Offset: 0x4258
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_9e67af(localclientnum, entitynum)
{
	foreach(obj in level.doa.var_b1d82287)
	{
		if(!isdefined(obj))
		{
			continue;
		}
		if(obj.localclientnum === localclientnum && obj.entitynum === entitynum)
		{
			return obj;
		}
	}
}

/*
	Name: function_530c3685
	Namespace: namespace_6e90e490
	Checksum: 0xC775A9FA
	Offset: 0x4328
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function function_530c3685(localclientnum, entitynum)
{
	var_6c978e26 = function_9e67af(localclientnum, entitynum);
	if(!isdefined(var_6c978e26))
	{
		foreach(obj in level.doa.var_b1d82287)
		{
			if(obj.localclientnum == -1 && obj.entitynum == -1)
			{
				var_6c978e26 = obj;
				break;
			}
		}
	}
	if(isdefined(var_6c978e26))
	{
		var_6c978e26.entitynum = entitynum;
		var_6c978e26.localclientnum = localclientnum;
		namespace_1e25ad94::debugmsg((("Allocated a textBubble to localClientNum:" + localclientnum) + " Entity:") + entitynum);
		return var_6c978e26.var_e429ef89;
	}
}

/*
	Name: function_5f71ab96
	Namespace: namespace_6e90e490
	Checksum: 0x1950F0C0
	Offset: 0x4470
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_5f71ab96(localclientnum, entitynum)
{
	obj = function_9e67af(localclientnum, entitynum);
	if(isdefined(obj))
	{
		if(obj.var_e429ef89 doa_textbubble::is_open(localclientnum))
		{
			obj.var_e429ef89 doa_textbubble::close(localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
		namespace_1e25ad94::debugmsg((("Released a textBubble to localClientNum:" + localclientnum) + " Entity:") + entitynum);
	}
}

/*
	Name: function_a789b576
	Namespace: namespace_6e90e490
	Checksum: 0xA208DEC8
	Offset: 0x4540
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_a789b576()
{
	if(isdefined(self gettagorigin("tag_eye")))
	{
		return "tag_eye";
	}
	return "tag_origin";
}

/*
	Name: function_80317cee
	Namespace: namespace_6e90e490
	Checksum: 0xF5B99ACF
	Offset: 0x4580
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_80317cee()
{
	if(isdefined(self gettagorigin("tag_eye")))
	{
		return (0, 0, 0);
	}
	return vectorscale((0, 0, 1), 24);
}

/*
	Name: function_15158f84
	Namespace: namespace_6e90e490
	Checksum: 0x7F9B1862
	Offset: 0x45C8
	Size: 0x1C8
	Parameters: 1
	Flags: Linked
*/
function function_15158f84(localclientnum)
{
	/#
		assert(!isdefined(self.var_de98eb73));
	#/
	namespace_1e25ad94::debugmsg("Entity requesting a textBubble");
	if(!isdefined(self.entnum))
	{
		self.entnum = self getentitynumber();
	}
	self.var_de98eb73 = function_530c3685(localclientnum, self.entnum);
	if(!isdefined(self.var_de98eb73))
	{
		namespace_1e25ad94::debugmsg("---> Request FAILED!!!");
		return false;
	}
	if(self.var_de98eb73 doa_textbubble::is_open(localclientnum) == 0)
	{
		self.var_de98eb73 doa_textbubble::open(localclientnum);
	}
	offset = self function_80317cee();
	self.var_de98eb73 doa_textbubble::function_919052d(localclientnum, self.entnum, self function_a789b576());
	self.var_de98eb73 doa_textbubble::set_text(localclientnum, #"hash_7ee185f0146bd791");
	self.var_de98eb73 doa_textbubble::function_b4023f5a(localclientnum, offset[0], offset[1], offset[2]);
	self thread function_b935ba2b(localclientnum, self.entnum);
	return true;
}

/*
	Name: function_fd71fef3
	Namespace: namespace_6e90e490
	Checksum: 0x8713C62F
	Offset: 0x4798
	Size: 0x474
	Parameters: 7
	Flags: Linked
*/
function function_fd71fef3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		function_5f71ab96(fieldname, self.entnum);
		self.var_de98eb73 = undefined;
	}
	else
	{
		if(function_75bbb0b9(fieldname) == 0 && level.doa.world_state != 3)
		{
			return;
		}
		if(level.var_46a66896 doa_overworld::is_open(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			if(is_true(self.doa.var_3e81d24c) || is_true(level.doa.var_318aa67a))
			{
				return;
			}
		}
		else if(is_true(self.var_fb30ba57) && !function_f682116f(fieldname))
		{
			return;
		}
		if(!isdefined(self.var_de98eb73))
		{
			if(self function_15158f84(fieldname) == 0)
			{
				return;
			}
		}
		var_a793c1e1 = function_aae7840a(bwastimejump);
		if(is_true(var_a793c1e1))
		{
			max = function_38e2f5a0(bwastimejump);
			if(!isdefined(self.skits))
			{
				self.skits = [];
			}
			if(!isdefined(self.skits[bwastimejump]))
			{
				self.skits[bwastimejump] = 0;
			}
			var_a6e8b35b = self.skits[bwastimejump];
			self.skits[bwastimejump]++;
			if(self.skits[bwastimejump] >= max)
			{
				self.skits[bwastimejump] = max - 1;
			}
		}
		val = self function_d47b1ac(bwastimejump, var_a793c1e1, var_a6e8b35b);
		if(isdefined(val.msg))
		{
			self.var_de98eb73 doa_textbubble::set_text(fieldname, val.msg);
		}
		else
		{
			function_5f71ab96(fieldname, self.entnum);
			self.var_de98eb73 = undefined;
		}
		if(isdefined(val.audio))
		{
			if(isdefined(val.cooldown))
			{
				time = gettime();
				if(!isdefined(self.var_17e527d8))
				{
					self.var_17e527d8 = [];
				}
				if(isdefined(self.var_17e527d8[bwastimejump]) && time < self.var_17e527d8[bwastimejump])
				{
					skip = 1;
				}
				else
				{
					self.var_17e527d8[bwastimejump] = time + val.cooldown;
				}
			}
			if(!is_true(skip))
			{
				if(isarray(val.audio))
				{
					alias = val.audio[randomint(val.audio.size)];
				}
				else
				{
					alias = val.audio;
				}
				if(is_true(val.q))
				{
					namespace_9fc66ac::function_9a237f2f(fieldname, alias, self);
				}
				else
				{
					self playsound(fieldname, alias);
				}
			}
		}
	}
}

/*
	Name: function_820380e1
	Namespace: namespace_6e90e490
	Checksum: 0x7CC0D1C2
	Offset: 0x4C18
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_820380e1()
{
	foreach(obj in level.doa.var_96dc6b3b)
	{
		if(obj.localclientnum != -1 && obj.var_e429ef89 doa_textbubble_playername::is_open(obj.localclientnum))
		{
			obj.var_e429ef89 doa_textbubble_playername::close(obj.localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
	}
	namespace_1e25ad94::debugmsg("Reset all name bubbles");
}

/*
	Name: function_53edd73d
	Namespace: namespace_6e90e490
	Checksum: 0xC8422583
	Offset: 0x4D30
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_53edd73d(localclientnum, entitynum)
{
	foreach(obj in level.doa.var_96dc6b3b)
	{
		if(!isdefined(obj))
		{
			continue;
		}
		if(obj.localclientnum === localclientnum && obj.entitynum === entitynum)
		{
			return obj;
		}
	}
}

/*
	Name: function_9d28bdf3
	Namespace: namespace_6e90e490
	Checksum: 0xE8C05080
	Offset: 0x4E00
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function function_9d28bdf3(localclientnum, entitynum)
{
	var_6c978e26 = function_53edd73d(localclientnum, entitynum);
	if(!isdefined(var_6c978e26))
	{
		foreach(obj in level.doa.var_96dc6b3b)
		{
			if(obj.localclientnum == -1 && obj.entitynum == -1)
			{
				var_6c978e26 = obj;
				break;
			}
		}
	}
	if(isdefined(var_6c978e26))
	{
		var_6c978e26.entitynum = entitynum;
		var_6c978e26.localclientnum = localclientnum;
		namespace_1e25ad94::debugmsg((("Allocated a nameBubble to localClientNum:" + localclientnum) + " Entity:") + entitynum);
		return var_6c978e26.var_e429ef89;
	}
}

/*
	Name: function_651f262d
	Namespace: namespace_6e90e490
	Checksum: 0xCD0130FC
	Offset: 0x4F48
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_651f262d(localclientnum, entitynum)
{
	obj = function_53edd73d(localclientnum, entitynum);
	if(isdefined(obj))
	{
		if(obj.var_e429ef89 doa_textbubble_playername::is_open(localclientnum))
		{
			obj.var_e429ef89 doa_textbubble_playername::close(localclientnum);
		}
		obj.localclientnum = -1;
		obj.entitynum = -1;
		namespace_1e25ad94::debugmsg((("Released a nameBubble to localClientNum:" + localclientnum) + " Entity:") + entitynum);
	}
}

/*
	Name: function_8394bc71
	Namespace: namespace_6e90e490
	Checksum: 0x687BBC70
	Offset: 0x5018
	Size: 0x228
	Parameters: 1
	Flags: Linked
*/
function function_8394bc71(localclientnum)
{
	/#
		assert(!isdefined(self.var_7488bfe4));
	#/
	namespace_1e25ad94::debugmsg("Entity requesting a nameBubble");
	if(!isdefined(self.entnum))
	{
		self.entnum = self getentitynumber();
	}
	if(!isdefined(self.player))
	{
		namespace_1e25ad94::debugmsg("---> Request FAILED [Player Disconnect]");
		return false;
	}
	clientnum = self.player getentitynumber();
	self.var_7488bfe4 = function_9d28bdf3(localclientnum, self.entnum);
	if(!isdefined(self.var_7488bfe4))
	{
		namespace_1e25ad94::debugmsg("---> Request FAILED!!!");
		return false;
	}
	if(self.var_7488bfe4 doa_textbubble_playername::is_open(localclientnum) == 0)
	{
		self.var_7488bfe4 doa_textbubble_playername::open(localclientnum);
		self playsound(localclientnum, #"hash_1af6f1a195265272");
	}
	offset = (-16, 0, 58);
	self.var_7488bfe4 doa_textbubble_playername::set_entnum(localclientnum, self.entnum);
	self.var_7488bfe4 doa_textbubble_playername::set_clientnum(localclientnum, clientnum);
	self.var_7488bfe4 doa_textbubble_playername::function_b4023f5a(localclientnum, offset[0], offset[1], offset[2]);
	self thread function_b935ba2b(localclientnum, self.entnum);
	return true;
}

/*
	Name: function_f01e3809
	Namespace: namespace_6e90e490
	Checksum: 0x57F5883E
	Offset: 0x5248
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function function_f01e3809(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		function_651f262d(fieldname, self.entnum);
		self.var_7488bfe4 = undefined;
	}
	else
	{
		if(level.var_46a66896 doa_overworld::is_open(fieldname))
		{
			return;
		}
		if(!isdefined(self.var_7488bfe4))
		{
			if(self function_8394bc71(fieldname) == 0)
			{
				return;
			}
		}
	}
}

/*
	Name: function_aae7840a
	Namespace: namespace_6e90e490
	Checksum: 0xF5A9EDDD
	Offset: 0x5310
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_aae7840a(id)
{
	return isinarray(level.doa.skits, id);
}

/*
	Name: function_38e2f5a0
	Namespace: namespace_6e90e490
	Checksum: 0xACCDC930
	Offset: 0x5350
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function function_38e2f5a0(id)
{
	if(id === 11)
	{
		return level.doa.var_aeba1185.size;
	}
	if(id === 10)
	{
		return level.doa.var_2ccc7019.size;
	}
	if(id === 43)
	{
		return level.doa.var_71a8d91b.size;
	}
	if(id === 44)
	{
		return level.doa.var_b07d7943.size;
	}
	if(id === 45)
	{
		return level.doa.var_1ad422d4.size;
	}
	if(id === 46)
	{
		return level.doa.var_f754a08d.size;
	}
	if(id === 47)
	{
		return level.doa.var_d8541610.size;
	}
	return 0;
}

/*
	Name: function_d47b1ac
	Namespace: namespace_6e90e490
	Checksum: 0xC1434EAF
	Offset: 0x5460
	Size: 0xCDE
	Parameters: 3
	Flags: Linked
*/
function function_d47b1ac(id, var_a793c1e1, var_a6e8b35b)
{
	if(!isdefined(var_a793c1e1))
	{
		var_a793c1e1 = 0;
	}
	val = {};
	if(var_a793c1e1)
	{
		switch(id)
		{
			case 11:
			{
				if(var_a6e8b35b < level.doa.var_aeba1185.size)
				{
					val = level.doa.var_aeba1185[var_a6e8b35b];
				}
				break;
			}
			case 10:
			{
				if(var_a6e8b35b < level.doa.var_2ccc7019.size)
				{
					val = level.doa.var_2ccc7019[var_a6e8b35b];
				}
				break;
			}
			case 43:
			{
				if(var_a6e8b35b < level.doa.var_71a8d91b.size)
				{
					val = level.doa.var_71a8d91b[var_a6e8b35b];
				}
				break;
			}
			case 44:
			{
				if(var_a6e8b35b < level.doa.var_b07d7943.size)
				{
					val = level.doa.var_b07d7943[var_a6e8b35b];
				}
				break;
			}
			case 45:
			{
				if(var_a6e8b35b < level.doa.var_1ad422d4.size)
				{
					val = level.doa.var_1ad422d4[var_a6e8b35b];
				}
				break;
			}
			case 46:
			{
				if(var_a6e8b35b < level.doa.var_f754a08d.size)
				{
					val = level.doa.var_f754a08d[var_a6e8b35b];
				}
				break;
			}
			case 47:
			{
				if(var_a6e8b35b < level.doa.var_d8541610.size)
				{
					val = level.doa.var_d8541610[var_a6e8b35b];
				}
				break;
			}
		}
	}
	else
	{
		val.msg = #"hash_4bec7ac65a15bb06";
		switch(id)
		{
			case 1:
			{
				val = level.doa.var_49bb35e6[randomint(level.doa.var_49bb35e6.size)];
				break;
			}
			case 2:
			{
				val = level.doa.var_1d7871ce[randomint(level.doa.var_1d7871ce.size)];
				break;
			}
			case 3:
			{
				val = level.doa.var_e4e89788[randomint(level.doa.var_e4e89788.size)];
				break;
			}
			case 4:
			{
				val = level.doa.var_df795bcd[randomint(level.doa.var_df795bcd.size)];
				break;
			}
			case 5:
			{
				val = level.doa.var_a95ba945[randomint(level.doa.var_a95ba945.size)];
				break;
			}
			case 6:
			{
				val = level.doa.var_2804d50f[randomint(level.doa.var_2804d50f.size)];
				break;
			}
			case 16:
			{
				val = level.doa.var_a3e9257b[randomint(level.doa.var_a3e9257b.size)];
				break;
			}
			case 17:
			{
				val = level.doa.var_aa304f76[randomint(level.doa.var_aa304f76.size)];
				break;
			}
			case 18:
			{
				val = level.doa.var_6a49d224[randomint(level.doa.var_6a49d224.size)];
				break;
			}
			case 19:
			{
				val = level.doa.var_4adfb3a5[randomint(level.doa.var_4adfb3a5.size)];
				break;
			}
			case 20:
			{
				val = level.doa.var_888445c3[randomint(level.doa.var_888445c3.size)];
				break;
			}
			case 7:
			{
				val = level.doa.var_d0bdbf5a[randomint(level.doa.var_d0bdbf5a.size)];
				val.q = 1;
				break;
			}
			case 8:
			{
				val = level.doa.var_5127d579[randomint(level.doa.var_5127d579.size)];
				val.q = 1;
				break;
			}
			case 21:
			{
				val.msg = #"hash_9d56a2e5a17db7d";
				val.audio = #"hash_1896db69557c5e11";
				val.q = 1;
				break;
			}
			case 22:
			{
				val.msg = #"hash_284ba6bcad0fa011";
				val.audio = #"hash_3e81803ccb560d6a";
				val.q = 1;
				break;
			}
			case 23:
			{
				val.msg = #"hash_7f4cffc1031f00b5";
				val.audio = #"hash_960c838d32b0e8c";
				val.cooldown = 60000;
				val.q = 1;
				break;
			}
			case 24:
			{
				val.msg = #"hash_3b4bad43aa759f1f";
				val.audio = #"hash_77239a5e66ecb44e";
				val.q = 1;
				break;
			}
			case 25:
			{
				val.msg = #"hash_7645e95bcead3896";
				val.audio = #"hash_4755fe2ee3054075";
				val.q = 1;
				break;
			}
			case 26:
			{
				val.msg = #"hash_609187824bab8f8c";
				val.audio = #"hash_1ff8f63b3359b055";
				val.q = 1;
				break;
			}
			case 27:
			{
				val.msg = #"hash_55f7d13453910be6";
				val.audio = #"hash_5f5539a0f0a1cec9";
				val.q = 1;
				break;
			}
			case 28:
			{
				val.msg = #"hash_54810c69b1e10296";
				val.audio = #"hash_1c7d3da2f3f4766b";
				val.q = 1;
				break;
			}
			case 29:
			{
				val.msg = #"hash_4785a63a664e7e55";
				val.audio = #"hash_7fe1ef05f43ee976";
				val.q = 1;
				break;
			}
			case 30:
			{
				val.msg = #"hash_61eedbd5833223cd";
				val.audio = #"hash_6b032800e231f06c";
				val.q = 1;
				break;
			}
			case 31:
			{
				val.msg = #"hash_6cfbe5e38a154902";
				val.audio = #"hash_1a3ed45b1f0c08e1";
				val.q = 1;
				break;
			}
			case 32:
			{
				val.msg = #"hash_7069bbfd2df0b9d5";
				val.audio = #"hash_378c7a0d252fe332";
				val.q = 1;
				break;
			}
			case 33:
			{
				val.msg = #"hash_19083756004a8d81";
				val.audio = #"hash_6e94595ca610130";
				val.q = 1;
				break;
			}
			case 34:
			{
				val.msg = #"hash_35dabf0d1049ba8d";
				val.audio = #"hash_22426692f607a5e";
				val.q = 1;
				break;
			}
			case 40:
			{
				val.msg = (randomint(100) > 50 ? #"hash_67f52b43a04c1e55" : #"hash_61b1168e92e80ba5");
				val.audio = #"hash_6298fe3f8c45ac9f";
				break;
			}
			case 41:
			{
				val.msg = #"hash_146f885685f54d05";
				val.audio = #"hash_8c6429df541c34c";
				break;
			}
			case 42:
			{
				val.msg = #"hash_17532668544a90bb";
				val.audio = #"hash_8c6429df541c34c";
				break;
			}
			case 48:
			{
				rnd = randomint(3);
				if(rnd == 0)
				{
					val.msg = #"hash_3d7f0f4a1c902cc";
				}
				else
				{
					if(rnd == 1)
					{
						val.msg = #"hash_50f16daee890159a";
					}
					else if(rnd == 2)
					{
						val.msg = #"hash_50f16eaee890174d";
					}
				}
				val.audio = #"hash_3551d2b408fff8cb";
				break;
			}
		}
	}
	return val;
}

/*
	Name: setplayerowner
	Namespace: namespace_6e90e490
	Checksum: 0xB29C8070
	Offset: 0x6148
	Size: 0x118
	Parameters: 7
	Flags: Linked
*/
function setplayerowner(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		return;
	}
	entnum = bwastimejump - 1;
	players = getplayers(fieldname);
	foreach(player in players)
	{
		if(player getentitynumber() == entnum)
		{
			self.player = player;
			return;
		}
	}
}

/*
	Name: function_3d3e551
	Namespace: namespace_6e90e490
	Checksum: 0x610197D9
	Offset: 0x6268
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function function_3d3e551(var_9ba84610)
{
	switch(var_9ba84610)
	{
		case 2:
		{
			msg = #"hash_4fac620ccd173768";
			break;
		}
		case 3:
		{
			msg = #"hash_3226d445d31f0b78";
			break;
		}
		case 4:
		{
			msg = #"hash_69a3dcbe573f702d";
			break;
		}
		case 5:
		{
			msg = #"hash_25cb04bb12d240c2";
			break;
		}
		case 6:
		{
			msg = #"hash_1a782e95144c944a";
			break;
		}
		case 7:
		{
			msg = #"hash_5308cbbdab4e1267";
			break;
		}
		case 8:
		{
			msg = #"hash_10cdd3fcab044ece";
			break;
		}
		case 9:
		{
			msg = #"hash_70ff900f36417489";
			break;
		}
		case 10:
		{
			msg = #"hash_3495d70dcc1dfce0";
			break;
		}
		case 11:
		{
			msg = #"hash_70abbd3574b572f5";
			break;
		}
		case 12:
		{
			msg = #"hash_50a737d9aecb6d57";
			break;
		}
		case 13:
		{
			msg = #"hash_605483745ef5b07e";
			break;
		}
		case 14:
		{
			msg = #"hash_528a7ccb64d23b67";
			break;
		}
	}
	return msg;
}

/*
	Name: function_5abfd945
	Namespace: namespace_6e90e490
	Checksum: 0xAE60BAAE
	Offset: 0x64A0
	Size: 0x86
	Parameters: 3
	Flags: Linked, Private
*/
function private function_5abfd945(localclientnum, text, var_d9d263a1)
{
	self.doa.var_5f165a77 = 1;
	self hud_message::setlowermessage(localclientnum, text);
	wait(var_d9d263a1);
	if(isdefined(self))
	{
		self hud_message::clearlowermessage(localclientnum);
		self.doa.var_5f165a77 = 0;
	}
}

/*
	Name: message
	Namespace: namespace_6e90e490
	Checksum: 0x7EE95381
	Offset: 0x6530
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function message(localclientnum, text, var_d9d263a1)
{
	if(!isdefined(var_d9d263a1))
	{
		var_d9d263a1 = 8;
	}
	stalled = 0;
	while(is_true(self.doa.var_5f165a77))
	{
		stalled = 1;
		wait(1);
	}
	if(stalled)
	{
		wait(1);
	}
	if(isdefined(self))
	{
		self thread function_5abfd945(localclientnum, text, var_d9d263a1);
	}
}

/*
	Name: function_1bcb9b42
	Namespace: namespace_6e90e490
	Checksum: 0x2F11EECC
	Offset: 0x65E0
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_1bcb9b42(var_9ba84610)
{
	if(!isdefined(self.doa))
	{
		return 0;
	}
	return self.doa.var_25f4de97 & (1 << var_9ba84610);
}

/*
	Name: showplayerhint
	Namespace: namespace_6e90e490
	Checksum: 0xAB260555
	Offset: 0x6620
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function showplayerhint(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_f457ec42(fieldname) == 0)
	{
		return;
	}
	if(bwastimejump == 0)
	{
		return;
	}
	if(bwastimejump == 1)
	{
		self hud_message::clearlowermessage(fieldname);
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	if(!function_f457ec42(fieldname))
	{
		return;
	}
	self.doa.var_25f4de97 = self.doa.var_25f4de97 | (1 << bwastimejump);
	msg = function_3d3e551(bwastimejump);
	if(isdefined(msg))
	{
		self thread message(fieldname, msg);
	}
}

/*
	Name: function_94c1298b
	Namespace: namespace_6e90e490
	Checksum: 0x8D5203D0
	Offset: 0x6750
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function function_94c1298b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_fb30ba57 = bwastimejump;
}

/*
	Name: function_9ed77fee
	Namespace: namespace_6e90e490
	Checksum: 0xF6FF56C8
	Offset: 0x67A8
	Size: 0xD4
	Parameters: 3
	Flags: None
*/
function function_9ed77fee(entnum, localclientnum, on)
{
	if(!isdefined(on))
	{
		on = 0;
	}
	var_dd2c6e79 = function_5f72e972(#"hash_365a974a1df27ef4");
	playermodel = getuimodel(var_dd2c6e79, hash("player" + (localclientnum + 1)));
	uimodel = getuimodel(playermodel, #"hash_5ac52f4c96170158");
	setuimodelvalue(uimodel, on);
}

/*
	Name: function_9c238883
	Namespace: namespace_6e90e490
	Checksum: 0x4D20DA16
	Offset: 0x6888
	Size: 0xD4
	Parameters: 3
	Flags: Linked
*/
function function_9c238883(entnum, localclientnum, on)
{
	if(!isdefined(on))
	{
		on = 0;
	}
	var_dd2c6e79 = function_5f72e972(#"hash_365a974a1df27ef4");
	playermodel = getuimodel(var_dd2c6e79, hash("player" + (localclientnum + 1)));
	uimodel = getuimodel(playermodel, #"hash_78aaeb246b2751b3");
	setuimodelvalue(uimodel, on);
}

/*
	Name: function_b5afa57f
	Namespace: namespace_6e90e490
	Checksum: 0xB520CE40
	Offset: 0x6968
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function function_b5afa57f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!namespace_7f5aeb59::islocalplayer(self))
	{
		value = 0;
	}
	else
	{
		value = is_true(self.doa.var_3e81d24c) || level.doa.world_state >= 4 || isdefined(level.doa.var_182fb75a);
		if(level.doa.var_938e4f08 != 0)
		{
			value = value & level.doa.var_938e4f08 == 8;
		}
	}
	function_9c238883(self getentitynumber(), bwastimejump, value);
}

