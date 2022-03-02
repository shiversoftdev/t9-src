#using script_6c5b51f98cd04fa3;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;

#namespace namespace_8f39dfb1;

/*
	Name: function_bb4ea756
	Namespace: namespace_8f39dfb1
	Checksum: 0x909B114A
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bb4ea756()
{
	level notify(601865362);
}

/*
	Name: init
	Namespace: namespace_8f39dfb1
	Checksum: 0xDC2EC178
	Offset: 0x120
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function init()
{
	level namespace_ee206246::register(#"hash_637ceeb3bef1ea35", #"first_location", #"hash_3531cfab5aa57f4b", &function_fe4dc0ff, &function_3f739fed);
	level namespace_ee206246::start(#"hash_637ceeb3bef1ea35");
}

/*
	Name: function_fe4dc0ff
	Namespace: namespace_8f39dfb1
	Checksum: 0x3B3819D9
	Offset: 0x1B0
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_fe4dc0ff(var_a276c861)
{
	level endon(#"end_game");
	if(!isdefined(level.var_c5c448d))
	{
		level.var_c5c448d = 0;
	}
	level.var_c5c448d++;
	if(!var_a276c861)
	{
		function_9e3ff948();
		function_9310fe45();
	}
}

/*
	Name: function_3f739fed
	Namespace: namespace_8f39dfb1
	Checksum: 0xBC42745B
	Offset: 0x230
	Size: 0x34
	Parameters: 2
	Flags: Private
*/
function private function_3f739fed(var_a276c861, var_19e802fa)
{
	if(!var_a276c861)
	{
		if(var_19e802fa)
		{
			function_3b5f45c();
		}
	}
}

/*
	Name: function_9310fe45
	Namespace: namespace_8f39dfb1
	Checksum: 0xD07E000C
	Offset: 0x270
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function function_9310fe45()
{
	level util::clientnotify("sndUnlockEESong");
	level thread zm_audio::sndmusicsystem_stopandflush();
	waitframe(1);
	level thread zm_audio::sndmusicsystem_playstate("ee_song");
	if(isdefined(level.var_da00670e))
	{
		level thread [[level.var_da00670e]]();
	}
}

/*
	Name: function_9e3ff948
	Namespace: namespace_8f39dfb1
	Checksum: 0x1F2534D6
	Offset: 0x2F8
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_9e3ff948()
{
	var_2361f0ab = struct::get_array(#"hash_ef13d6f1414e0f7", "targetname");
	var_2ab51a2c = 0;
	var_97671ac1 = var_2361f0ab.size;
	foreach(var_ebacacf2 in var_2361f0ab)
	{
		var_ebacacf2 thread function_8853dd01();
		waitframe(1);
	}
	while(true)
	{
		level waittill(#"hash_5f146847260b1b46");
		var_2ab51a2c++;
		if(var_2ab51a2c >= var_97671ac1)
		{
			break;
		}
	}
}

/*
	Name: function_8853dd01
	Namespace: namespace_8f39dfb1
	Checksum: 0x2C9E2603
	Offset: 0x418
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_8853dd01()
{
	self.var_c65fa63f = util::spawn_model("p9_zm_ndu_cassette_gold", self.origin, self.angles);
	var_64c09f7f = self zm_unitrigger::function_fac87205(undefined, 75);
	var_64c09f7f playrumbleonentity(#"hash_410bd55524ae7d");
	self.var_c65fa63f playsound("evt_sq_cassette_pickup");
	level notify(#"hash_5f146847260b1b46");
	waitframe(1);
	self.var_c65fa63f delete();
	self.var_c65fa63f = undefined;
}

/*
	Name: function_3b5f45c
	Namespace: namespace_8f39dfb1
	Checksum: 0x79DF4B44
	Offset: 0x4F0
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_3b5f45c()
{
	var_2361f0ab = struct::get_array(#"hash_ef13d6f1414e0f7", "targetname");
	foreach(var_ebacacf2 in var_2361f0ab)
	{
		if(isdefined(var_ebacacf2.var_c65fa63f))
		{
			var_ebacacf2.var_c65fa63f delete();
			waitframe(1);
		}
	}
}
