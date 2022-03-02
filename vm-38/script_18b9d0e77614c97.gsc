#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\flag_shared.csc;

#namespace namespace_51e8873d;

/*
	Name: function_b7b03252
	Namespace: namespace_51e8873d
	Checksum: 0x2BAA4D78
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b7b03252()
{
	level notify(669603755);
}

#namespace streamer;

/*
	Name: function_d46dcfc2
	Namespace: streamer
	Checksum: 0x8975B822
	Offset: 0x90
	Size: 0xD0
	Parameters: 4
	Flags: None
*/
function function_d46dcfc2(var_74f025c6, var_11a76757, var_352bdb5f, var_45269c45)
{
	if(!isdefined(level.var_80747947))
	{
		level.var_80747947 = [];
	}
	level.var_80747947[var_74f025c6] = {#hash_45269c45:var_45269c45, #hash_352bdb5f:var_352bdb5f, #hash_11a76757:var_11a76757};
	/#
		assert(!level flag::get(var_74f025c6));
	#/
	[[level.var_80747947[var_74f025c6].var_45269c45]]();
}

/*
	Name: force_stream
	Namespace: streamer
	Checksum: 0x43E51D6E
	Offset: 0x168
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function force_stream(var_74f025c6)
{
	level flag::increment(var_74f025c6);
	[[level.var_80747947[var_74f025c6].var_352bdb5f]]();
	self.var_74f025c6 = var_74f025c6;
	self callback::on_shutdown(&on_shutdown);
}

/*
	Name: on_shutdown
	Namespace: streamer
	Checksum: 0xCE12916D
	Offset: 0x1E0
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_shutdown(localclientnum)
{
	if(!isdefined(self.var_74f025c6))
	{
		return;
	}
	level flag::decrement(self.var_74f025c6);
	if(!level flag::get(self.var_74f025c6))
	{
		[[level.var_80747947[self.var_74f025c6].var_45269c45]]();
		function_121f6fcf(level.var_80747947[self.var_74f025c6].var_11a76757);
	}
}

/*
	Name: function_121f6fcf
	Namespace: streamer
	Checksum: 0x6FFDD4A
	Offset: 0x288
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_121f6fcf(var_11a76757)
{
	if(!isdefined(level.var_80747947))
	{
		return;
	}
	foreach(entry in level.var_80747947)
	{
		if(var_11a76757 & entry.var_11a76757 == 0)
		{
			continue;
		}
		if(level flag::get(var_74f025c6))
		{
			[[entry.var_352bdb5f]]();
		}
	}
}

