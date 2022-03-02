#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1b9c0b4f8da07fee;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_83eb6304;

/*
	Name: init
	Namespace: namespace_83eb6304
	Checksum: 0xCB476CA
	Offset: 0x1E8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_11c4dca4 = [];
	clientfield::register("scriptmover", "play_fx", 1, 8, "int");
	clientfield::register("allplayers", "play_fx", 1, 8, "int");
	clientfield::register("actor", "play_fx", 1, 8, "int");
	clientfield::register("vehicle", "play_fx", 1, 8, "int");
	clientfield::register("scriptmover", "stop_fx", 1, 8, "int");
	clientfield::register("allplayers", "stop_fx", 1, 8, "int");
	clientfield::register("actor", "stop_fx", 1, 8, "int");
	clientfield::register("vehicle", "stop_fx", 1, 8, "int");
	namespace_7e1ec234::function_10d1200d();
}

/*
	Name: function_4060ccb4
	Namespace: namespace_83eb6304
	Checksum: 0x1BBE34FE
	Offset: 0x398
	Size: 0x10C
	Parameters: 5
	Flags: Linked
*/
function function_4060ccb4(name, unused1, var_f80dfd0d, unused2, unused3)
{
	if(!isdefined(unused3))
	{
		unused3 = 0;
	}
	var_318e5b78 = level.doa.var_11c4dca4.size;
	/#
		assert(var_318e5b78 < 256, "");
	#/
	/#
		assert(!isdefined(level.doa.var_11c4dca4[unused2]), "");
	#/
	level.doa.var_11c4dca4[unused2] = {#clear:unused3, #id:var_318e5b78, #name:unused2};
}

/*
	Name: function_13be6e83
	Namespace: namespace_83eb6304
	Checksum: 0xA607A213
	Offset: 0x4B0
	Size: 0x25C
	Parameters: 1
	Flags: Linked
*/
function function_13be6e83(&queue)
{
	pumps = 20;
	var_dcf59f7c = 0;
	while(pumps > 0)
	{
		if(queue.size > 0)
		{
			var_9e787c74 = queue[0];
			/#
				if(queue.size > var_dcf59f7c)
				{
					var_dcf59f7c = queue.size;
				}
				namespace_1e25ad94::debugmsg(((((((("" + var_9e787c74.flag) + "") + (isdefined(self.entnum) ? self.entnum : self getentitynumber()) + "") + var_9e787c74.fx.name) + "") + queue.size) + "") + var_dcf59f7c);
			#/
			self clientfield::set(var_9e787c74.flag, var_9e787c74.fx.id);
			util::wait_network_frame();
			if(var_9e787c74.fx.clear)
			{
				self clientfield::set(var_9e787c74.flag, 0);
				util::wait_network_frame();
			}
			arrayremoveindex(queue, 0, 0);
		}
		else
		{
			self clientfield::set("play_fx", 0);
			self clientfield::set("stop_fx", 0);
			waitframe(1);
			pumps--;
		}
		if(queue.size > 0)
		{
			pumps = 20;
		}
	}
	/#
		assert(queue.size == 0);
	#/
	self clientfield::set("play_fx", 0);
	self clientfield::set("stop_fx", 0);
}

/*
	Name: function_dd47bd22
	Namespace: namespace_83eb6304
	Checksum: 0xFB9EAA9E
	Offset: 0x718
	Size: 0xF6
	Parameters: 1
	Flags: Linked
*/
function function_dd47bd22(var_e86c9812)
{
	self notify("4e04088e67b4ca0f");
	self endon("4e04088e67b4ca0f");
	self endon(#"disconnect", #"death");
	if(!isdefined(self.var_93d7fb93))
	{
		self.var_93d7fb93 = [];
	}
	if(!isdefined(self.var_93d7fb93))
	{
		self.var_93d7fb93 = [];
	}
	else if(!isarray(self.var_93d7fb93))
	{
		self.var_93d7fb93 = array(self.var_93d7fb93);
	}
	self.var_93d7fb93[self.var_93d7fb93.size] = var_e86c9812;
	self function_13be6e83(self.var_93d7fb93);
	self.var_93d7fb93 = undefined;
}

/*
	Name: turnofffx
	Namespace: namespace_83eb6304
	Checksum: 0xAB4B3D43
	Offset: 0x818
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function turnofffx(name)
{
	if(!isdefined(name) || !isdefined(self))
	{
		return;
	}
	if(!isdefined(level.doa.var_11c4dca4[name]))
	{
		namespace_1e25ad94::debugmsg((("FX OFF ERROR for entity [" + (isdefined(self.entnum) ? self.entnum : self getentitynumber())) + ("] effect UNDFINED--> [") + name) + "] ");
		return;
	}
	var_e86c9812 = {#flag:"stop_fx", #fx:level.doa.var_11c4dca4[name]};
	if(!isdefined(self.var_93d7fb93))
	{
		self thread function_dd47bd22(var_e86c9812);
	}
	else
	{
		if(!isdefined(self.var_93d7fb93))
		{
			self.var_93d7fb93 = [];
		}
		else if(!isarray(self.var_93d7fb93))
		{
			self.var_93d7fb93 = array(self.var_93d7fb93);
		}
		self.var_93d7fb93[self.var_93d7fb93.size] = var_e86c9812;
	}
	/#
		assert(self.var_93d7fb93.size < 60, "" + name);
	#/
}

/*
	Name: function_3ecfde67
	Namespace: namespace_83eb6304
	Checksum: 0xDB3C6B79
	Offset: 0x9D0
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_3ecfde67(name)
{
	if(!isdefined(name) || !isdefined(self))
	{
		return;
	}
	if(!isdefined(level.doa.var_11c4dca4[name]))
	{
		namespace_1e25ad94::debugmsg((("FX ON ERROR for entity [" + (isdefined(self.entnum) ? self.entnum : self getentitynumber())) + ("] effect UNDFINED--> [") + name) + "] ");
		return;
	}
	var_e86c9812 = {#flag:"play_fx", #fx:level.doa.var_11c4dca4[name]};
	if(!isdefined(self.var_93d7fb93))
	{
		self thread function_dd47bd22(var_e86c9812);
	}
	else
	{
		if(!isdefined(self.var_93d7fb93))
		{
			self.var_93d7fb93 = [];
		}
		else if(!isarray(self.var_93d7fb93))
		{
			self.var_93d7fb93 = array(self.var_93d7fb93);
		}
		self.var_93d7fb93[self.var_93d7fb93.size] = var_e86c9812;
	}
	/#
		assert(self.var_93d7fb93.size < 60, "" + name);
	#/
}

/*
	Name: function_8b4b9bdd
	Namespace: namespace_83eb6304
	Checksum: 0xEF635426
	Offset: 0xB88
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_8b4b9bdd()
{
	self callback::on_death(&function_de09b352);
}

/*
	Name: function_de09b352
	Namespace: namespace_83eb6304
	Checksum: 0x4DCFE95
	Offset: 0xBB8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_de09b352(eventstruct)
{
	if(isdefined(eventstruct.corpse))
	{
		eventstruct.corpse function_3ecfde67("burn_zombie");
	}
}

