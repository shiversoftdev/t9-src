#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace clouds;

/*
	Name: __init__system__
	Namespace: clouds
	Checksum: 0x971FE5EF
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"clouds", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: clouds
	Checksum: 0x436314E3
	Offset: 0xD8
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.clouds = {#layers:[]};
	function_f75dd8e0("low", 6000, #"hash_3cb3a6fc9eb00337");
	callback::add_callback(#"freefall", &function_c9a18304);
	callback::add_callback(#"hash_171443902e2a22ee", &function_f99c2453);
}

/*
	Name: function_c9a18304
	Namespace: clouds
	Checksum: 0x8AA3FC8E
	Offset: 0x190
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c9a18304(eventstruct)
{
	if(!(isplayer(self) || self isplayercorpse()))
	{
		return;
	}
	if(self function_21c0fa55())
	{
		self start(eventstruct.localclientnum);
	}
}

/*
	Name: function_f99c2453
	Namespace: clouds
	Checksum: 0x6E5B10E5
	Offset: 0x210
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f99c2453(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	if(self function_21c0fa55())
	{
		self cleanup(eventstruct.localclientnum);
	}
}

/*
	Name: function_f75dd8e0
	Namespace: clouds
	Checksum: 0xF5EF63F2
	Offset: 0x278
	Size: 0x9C
	Parameters: 3
	Flags: Linked
*/
function function_f75dd8e0(name, min_height, fx)
{
	/#
		assert(!isdefined(level.clouds.layers[name]));
	#/
	level.clouds.layers[name] = {#fx:fx, #min_height:min_height, #name:name};
}

/*
	Name: function_59a04cbf
	Namespace: clouds
	Checksum: 0x9CBBDF10
	Offset: 0x320
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_59a04cbf()
{
	if(isdefined(level.var_427d6976.altimeterseaheight))
	{
		return level.var_427d6976.altimeterseaheight;
	}
	return 0;
}

/*
	Name: start
	Namespace: clouds
	Checksum: 0x5CB07D1F
	Offset: 0x360
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function start(localclientnum)
{
	if(!isdefined(self.clouds))
	{
		self.clouds = [];
	}
	height = self.origin[2];
	var_3c752058 = function_59a04cbf();
	foreach(layer in level.clouds.layers)
	{
		if(layer.min_height > height - var_3c752058)
		{
			continue;
		}
		if(isdefined(self.clouds[layer.name]))
		{
			continue;
		}
		self.clouds[layer.name] = util::playfxontag(localclientnum, layer.fx, self, "tag_origin");
	}
	self thread update(localclientnum);
}

/*
	Name: update
	Namespace: clouds
	Checksum: 0x8E9963AE
	Offset: 0x4B8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function update(localclientnum)
{
	self endon(#"death", #"hash_44d009a3793f7389");
	var_3c752058 = function_59a04cbf();
	while(true)
	{
		foreach(name, fx in self.clouds)
		{
			if(self.origin[2] < level.clouds.layers[name].min_height - var_3c752058)
			{
				self function_2baaca3c(localclientnum, name);
			}
		}
		if(self.clouds.size == 0)
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: cleanup
	Namespace: clouds
	Checksum: 0x9FAD96BE
	Offset: 0x5F8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function cleanup(localclientnum)
{
	self notify(#"hash_44d009a3793f7389");
	if(!isdefined(self.clouds))
	{
		self.clouds = [];
	}
	foreach(fx in self.clouds)
	{
		stopfx(localclientnum, self.clouds[name]);
	}
	self.clouds = [];
}

/*
	Name: function_2baaca3c
	Namespace: clouds
	Checksum: 0xA9473AAE
	Offset: 0x6D8
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_2baaca3c(localclientnum, name)
{
	if(isdefined(self.clouds[name]))
	{
		stopfx(localclientnum, self.clouds[name]);
		self.clouds[name] = undefined;
	}
}

