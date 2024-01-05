#using script_34e46b51ae28401d;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
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

#namespace namespace_e32bb68;

/*
	Name: function_bf320854
	Namespace: namespace_e32bb68
	Checksum: 0xD5BA35A7
	Offset: 0x1F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bf320854()
{
	level notify(505014485);
}

/*
	Name: init
	Namespace: namespace_e32bb68
	Checksum: 0xA34000B5
	Offset: 0x218
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_9e132ad0 = [];
	clientfield::register("scriptmover", "play_sfx", 1, 9, "int");
	clientfield::register("allplayers", "play_sfx", 1, 9, "int");
	clientfield::register("actor", "play_sfx", 1, 9, "int");
	clientfield::register("vehicle", "play_sfx", 1, 9, "int");
	clientfield::register("scriptmover", "stop_sfx", 1, 9, "int");
	clientfield::register("allplayers", "stop_sfx", 1, 9, "int");
	clientfield::register("actor", "stop_sfx", 1, 9, "int");
	clientfield::register("vehicle", "stop_sfx", 1, 9, "int");
	namespace_9bef0a98::function_fd4107e4();
}

/*
	Name: function_c1e0cc87
	Namespace: namespace_e32bb68
	Checksum: 0xDF89AEAF
	Offset: 0x3C8
	Size: 0x12C
	Parameters: 4
	Flags: Linked
*/
function function_c1e0cc87(name, unused1, unused2, var_f80dfd0d)
{
	if(!isdefined(var_f80dfd0d))
	{
		var_f80dfd0d = 0;
	}
	if(!isdefined(level.doa.var_9e132ad0))
	{
		level.doa.var_9e132ad0 = [];
	}
	var_318e5b78 = level.doa.var_9e132ad0.size + 1;
	/#
		assert(var_318e5b78 < 512, "");
	#/
	/#
		assert(!isdefined(level.doa.var_9e132ad0[unused2]), "");
	#/
	level.doa.var_9e132ad0[unused2] = {#clear:var_f80dfd0d, #id:var_318e5b78, #name:unused2};
}

/*
	Name: function_593b9cbb
	Namespace: namespace_e32bb68
	Checksum: 0x29A98E14
	Offset: 0x500
	Size: 0x150
	Parameters: 2
	Flags: Linked
*/
function function_593b9cbb(&queue, flag)
{
	pumps = 20;
	while(pumps > 0)
	{
		if(queue.size > 0)
		{
			var_8d3272cf = queue[0];
			self clientfield::set(flag, var_8d3272cf.id);
			util::wait_network_frame();
			arrayremoveindex(queue, 0, 0);
			if(var_8d3272cf.clear)
			{
				self clientfield::set(flag, 0);
				util::wait_network_frame();
			}
		}
		else
		{
			self clientfield::set(flag, 0);
			waitframe(1);
		}
		if(queue.size > 0)
		{
			pumps = 20;
		}
		else
		{
			pumps--;
		}
	}
	/#
		assert(queue.size == 0);
	#/
	self clientfield::set(flag, 0);
	return true;
}

/*
	Name: function_10e0969b
	Namespace: namespace_e32bb68
	Checksum: 0x7F6BC570
	Offset: 0x658
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function function_10e0969b(sfx)
{
	self notify("76cc606f7e2ec7ba");
	self endon("76cc606f7e2ec7ba");
	self endon(#"disconnect", #"death");
	/#
		assert(isdefined(sfx));
	#/
	if(!isdefined(self.var_a045580f))
	{
		self.var_a045580f = array(sfx);
	}
	var_f5a8d3a4 = self function_593b9cbb(self.var_a045580f, "stop_sfx");
	if(is_true(var_f5a8d3a4))
	{
		self.var_a045580f = undefined;
	}
}

/*
	Name: function_8dc5fbf8
	Namespace: namespace_e32bb68
	Checksum: 0x86A79230
	Offset: 0x738
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function function_8dc5fbf8(sfx)
{
	self notify("6492906d29e15e4f");
	self endon("6492906d29e15e4f");
	self endon(#"disconnect", #"death");
	/#
		assert(isdefined(sfx));
	#/
	if(!isdefined(self.var_17618ff9))
	{
		self.var_17618ff9 = array(sfx);
	}
	var_f5a8d3a4 = self function_593b9cbb(self.var_17618ff9, "play_sfx");
	if(is_true(var_f5a8d3a4))
	{
		self.var_17618ff9 = undefined;
	}
}

/*
	Name: function_ae271c0b
	Namespace: namespace_e32bb68
	Checksum: 0x91D13E90
	Offset: 0x818
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_ae271c0b(name)
{
	if(!isdefined(name) || !isdefined(self))
	{
		return;
	}
	/#
		assert(self != level, "" + name);
	#/
	if(!isdefined(level.doa.var_9e132ad0[name]))
	{
		namespace_1e25ad94::debugmsg((("SFX OFF ERROR for entity [" + (isdefined(self.entnum) ? self.entnum : self getentitynumber())) + ("] effect UNDFINED--> [") + name) + "] ");
		return;
	}
	if(!isdefined(self.var_a045580f))
	{
		self thread function_10e0969b(level.doa.var_9e132ad0[name]);
	}
	else if(!isinarray(self.var_a045580f, level.doa.var_9e132ad0[name]))
	{
		if(!isdefined(self.var_a045580f))
		{
			self.var_a045580f = [];
		}
		else if(!isarray(self.var_a045580f))
		{
			self.var_a045580f = array(self.var_a045580f);
		}
		self.var_a045580f[self.var_a045580f.size] = level.doa.var_9e132ad0[name];
	}
	/#
		assert(self.var_a045580f.size < 24, "" + name);
	#/
}

/*
	Name: function_3a59ec34
	Namespace: namespace_e32bb68
	Checksum: 0x9AF3C07D
	Offset: 0xA08
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_3a59ec34(name)
{
	if(!isdefined(name) || !isdefined(self))
	{
		return;
	}
	/#
		assert(self != level, "" + name);
	#/
	if(!isdefined(level.doa.var_9e132ad0[name]))
	{
		namespace_1e25ad94::debugmsg((("SFX ON ERROR for entity [" + (isdefined(self.entnum) ? self.entnum : self getentitynumber())) + ("] effect UNDFINED--> [") + name) + "] ");
		return;
	}
	if(!isdefined(self.var_17618ff9))
	{
		self thread function_8dc5fbf8(level.doa.var_9e132ad0[name]);
	}
	else if(!isinarray(self.var_17618ff9, level.doa.var_9e132ad0[name]))
	{
		if(!isdefined(self.var_17618ff9))
		{
			self.var_17618ff9 = [];
		}
		else if(!isarray(self.var_17618ff9))
		{
			self.var_17618ff9 = array(self.var_17618ff9);
		}
		self.var_17618ff9[self.var_17618ff9.size] = level.doa.var_9e132ad0[name];
	}
	/#
		assert(self.var_17618ff9.size < 24, "" + name);
	#/
}

