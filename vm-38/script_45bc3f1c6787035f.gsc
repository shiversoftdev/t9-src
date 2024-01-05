#using script_113dd7f0ea2a1d4f;
#using scripts\zm_common\zm_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_7eea54d0;

/*
	Name: function_c60deb41
	Namespace: namespace_7eea54d0
	Checksum: 0xDED89AD1
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c60deb41()
{
	level notify(-1707895693);
}

/*
	Name: init
	Namespace: namespace_7eea54d0
	Checksum: 0x89795B35
	Offset: 0xB0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function init()
{
	callback::on_connect(&on_player_connect);
	callback::on_item_pickup(&on_item_pickup);
	callback::on_ai_damage(&on_ai_damage);
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: on_player_connect
	Namespace: namespace_7eea54d0
	Checksum: 0x18F26B80
	Offset: 0x140
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self.var_47eb9d8e = 0;
}

/*
	Name: on_item_pickup
	Namespace: namespace_7eea54d0
	Checksum: 0x8C4C5157
	Offset: 0x158
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function on_item_pickup(s_params)
{
	var_a6762160 = s_params.item.var_a6762160;
	if(var_a6762160.itemtype === #"hash_910bf9605abbcea")
	{
		if(isplayer(self))
		{
			e_player = self;
		}
		else
		{
			e_player = s_params.player;
		}
		var_b25755cf = 50 * var_a6762160.amount;
		e_player thread function_d9365a20(var_b25755cf, 0);
	}
}

/*
	Name: on_ai_damage
	Namespace: namespace_7eea54d0
	Checksum: 0xFF8EBDD2
	Offset: 0x218
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function on_ai_damage(s_params)
{
	e_player = s_params.eattacker;
	if(!isplayer(e_player))
	{
		return;
	}
	if(!isdefined(self.var_d7d6cced))
	{
		self.var_d7d6cced = [];
	}
	else if(!isarray(self.var_d7d6cced))
	{
		self.var_d7d6cced = array(self.var_d7d6cced);
	}
	if(!isinarray(self.var_d7d6cced, e_player))
	{
		self.var_d7d6cced[self.var_d7d6cced.size] = e_player;
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_7eea54d0
	Checksum: 0x943D111F
	Offset: 0x2E0
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function on_ai_killed(s_params)
{
	e_player = s_params.eattacker;
	if(!isplayer(e_player))
	{
		return;
	}
	if(isdefined(level.var_138fad10))
	{
		var_b25755cf = self [[level.var_138fad10]](s_params);
	}
	if(!isdefined(var_b25755cf))
	{
		var_b25755cf = 10;
		if(self.var_9fde8624 === #"hash_7a778318514578f7" || self.var_9fde8624 === #"hash_622e7c9cc7c06c7")
		{
			var_b25755cf = 20;
		}
		else
		{
			switch(self.archetype)
			{
				case "avogadro":
				{
					var_b25755cf = 50;
					break;
				}
				case "raz":
				case "brutus":
				{
					var_b25755cf = 100;
					break;
				}
				case "mechz":
				case "blight_father":
				{
					var_b25755cf = 250;
					break;
				}
			}
		}
	}
	if(!isdefined(self.var_d7d6cced))
	{
		self.var_d7d6cced = [];
	}
	else if(!isarray(self.var_d7d6cced))
	{
		self.var_d7d6cced = array(self.var_d7d6cced);
	}
	if(!isinarray(self.var_d7d6cced, e_player))
	{
		self.var_d7d6cced[self.var_d7d6cced.size] = e_player;
	}
	arrayremovevalue(self.var_d7d6cced, undefined);
	if(var_b25755cf > 0)
	{
		array::thread_all(self.var_d7d6cced, &function_d9365a20, var_b25755cf, 0);
	}
}

/*
	Name: function_b121c9be
	Namespace: namespace_7eea54d0
	Checksum: 0x33A3D7EA
	Offset: 0x508
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_b121c9be()
{
	return self.var_47eb9d8e;
}

/*
	Name: function_d9365a20
	Namespace: namespace_7eea54d0
	Checksum: 0xA2D03798
	Offset: 0x520
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_d9365a20(var_b25755cf, var_86756f69)
{
	if(isdefined(self.var_47eb9d8e))
	{
		self.var_47eb9d8e = int(self.var_47eb9d8e + var_86756f69);
	}
	zm_score::add_to_player_score(var_86756f69);
}

/*
	Name: function_1efdfa9d
	Namespace: namespace_7eea54d0
	Checksum: 0xF187E9E8
	Offset: 0x588
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_1efdfa9d(var_b25755cf)
{
	var_47eb9d8e = self.var_47eb9d8e - var_b25755cf;
	var_47eb9d8e = max(var_47eb9d8e, 0);
	self.var_47eb9d8e = int(var_47eb9d8e);
}

