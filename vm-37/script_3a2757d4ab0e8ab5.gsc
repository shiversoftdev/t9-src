#using script_18910f59cc847b42;
#using script_1b2f6ef7778cf920;
#using script_582965dd053f648e;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\wz_common\hud.csc;

#namespace brawl;

/*
	Name: main
	Namespace: brawl
	Checksum: 0x5D055C13
	Offset: 0xE8
	Size: 0x194
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::function_5b7d846d("Brawl.prematchCountdown", #"hash_4f957dda4b1fb14d", #"hash_4d5a06fe6fb857de", 1, 6, "int", undefined, 0, 0);
	callback::on_spawned(&on_player_spawned);
	level.var_30df1fad = "brawl";
	level.var_fb0679ad = 1;
	function_1001f0ac();
	hud::function_9b9cecdf();
	setsaveddvar(#"enable_global_wind", 1);
	setsaveddvar(#"wind_global_vector", "88 0 0");
	setsaveddvar(#"wind_global_low_altitude", 0);
	setsaveddvar(#"wind_global_hi_altitude", 10000);
	setsaveddvar(#"wind_global_low_strength_percent", 100);
	util::waitforclient(0);
}

/*
	Name: function_1001f0ac
	Namespace: brawl
	Checksum: 0x6035A3F6
	Offset: 0x288
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_1001f0ac()
{
	level thread namespace_4dae815d::init();
}

/*
	Name: on_player_spawned
	Namespace: brawl
	Checksum: 0x93F5F2CD
	Offset: 0x2B0
	Size: 0x166
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	self endon(#"death");
	if(self function_21c0fa55())
	{
		level namespace_ac2a80f5::changecamera(localclientnum, self, 6);
	}
	self util::waittill_dobj(localclientnum);
	self function_bf9d3071(#"hash_7974d58ec2b1797e");
	while(true)
	{
		var_8b8faf32 = self function_e8ef30cc();
		maxarmor = self function_a07288ec();
		var_563bbb8e = 0;
		if(var_8b8faf32 > 0)
		{
			var_563bbb8e = 1;
		}
		self function_78233d29(#"hash_7974d58ec2b1797e", "", "Alpha", var_563bbb8e);
		self function_78233d29(#"hash_7974d58ec2b1797e", "", "Brightness", var_563bbb8e);
		waitframe(1);
	}
}

