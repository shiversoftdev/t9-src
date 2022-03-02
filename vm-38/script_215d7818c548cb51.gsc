#using script_113dd7f0ea2a1d4f;
#using script_1c65dbfc2f1c8d8f;
#using script_3751b21462a54a7d;
#using script_7963da8c5cf62922;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_77bd50da;

/*
	Name: function_78b2c532
	Namespace: namespace_77bd50da
	Checksum: 0x73909BE9
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_78b2c532()
{
	level notify(2035645732);
}

/*
	Name: function_89f2df9
	Namespace: namespace_77bd50da
	Checksum: 0xA36D6535
	Offset: 0xC8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7b30b3878fc15536", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_77bd50da
	Checksum: 0xC1910128
	Offset: 0x120
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_90456892 = sr_message_box::register();
	if(!isdefined(level.var_31028c5d))
	{
		level.var_31028c5d = prototype_hud::register();
	}
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_77bd50da
	Checksum: 0x80F724D1
	Offset: 0x190
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: on_player_spawned
	Namespace: namespace_77bd50da
	Checksum: 0xCA757C82
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self function_2778528();
}

/*
	Name: function_2778528
	Namespace: namespace_77bd50da
	Checksum: 0x70D1AD7D
	Offset: 0x1C8
	Size: 0xF2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2778528()
{
	if(!isplayer(self))
	{
		return;
	}
	if(!level.var_31028c5d prototype_hud::is_open(self))
	{
		level.var_31028c5d prototype_hud::open(self, 1);
	}
	if(isdefined(level.var_8a13c98f))
	{
		i = 1;
		foreach(s_objective in level.var_8a13c98f)
		{
			i++;
		}
	}
}

/*
	Name: function_cc8342e0
	Namespace: namespace_77bd50da
	Checksum: 0xFDD7B359
	Offset: 0x2C8
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_cc8342e0(string, opentime)
{
	if(!isdefined(string))
	{
		string = #"hash_6c919cffb550417a";
	}
	if(!isdefined(opentime))
	{
		opentime = 10;
	}
	level endon(#"game_ended");
	self endon(#"death");
	if(!isplayer(self))
	{
		return;
	}
	if(!level.var_90456892 sr_message_box::is_open(self))
	{
		level.var_90456892 sr_message_box::open(self);
		level.var_90456892 sr_message_box::function_7a690474(self, string);
	}
	else
	{
		return;
	}
	wait(opentime);
	if(level.var_90456892 sr_message_box::is_open(self))
	{
		level.var_90456892 sr_message_box::close(self);
	}
}

/*
	Name: function_81cad6d6
	Namespace: namespace_77bd50da
	Checksum: 0x490E69E2
	Offset: 0x3F8
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_81cad6d6(vector, angle)
{
	var_c575b928 = cos(angle);
	var_26c827e8 = sin(angle);
	x = (vector[0] * var_c575b928) - (vector[1] * var_26c827e8);
	y = (vector[0] * var_26c827e8) + (vector[1] * var_c575b928);
	z = vector[2];
	return (x, y, z);
}

