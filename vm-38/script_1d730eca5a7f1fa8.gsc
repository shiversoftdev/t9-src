#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
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

#namespace namespace_e4817c87;

/*
	Name: function_2659ebec
	Namespace: namespace_e4817c87
	Checksum: 0x4215441F
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2659ebec()
{
	level notify(958107094);
}

#namespace namespace_b754744b;

/*
	Name: function_b784c6bd
	Namespace: namespace_b754744b
	Checksum: 0x1B04C5DE
	Offset: 0x1B0
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_b784c6bd(type)
{
	switch(type)
	{
		case 10:
		{
			self namespace_83eb6304::function_3ecfde67("player_healOS");
			self.health = self.health + 150;
			if(self.health < self.health)
			{
				self.health = self.health;
			}
			else if(self.health > 150)
			{
				self.health = 150;
			}
			break;
		}
		case 12:
		{
			break;
		}
		case 46:
		{
			self.doa.var_ccd8393c++;
			self namespace_83eb6304::function_3ecfde67("divine_shield");
			self namespace_83eb6304::function_3ecfde67("player_respawn_red");
			self namespace_83eb6304::function_3ecfde67("player_respawn_yellow");
			break;
		}
	}
	self thread function_6acf8fc6(type);
}

/*
	Name: function_a6ab97f0
	Namespace: namespace_b754744b
	Checksum: 0x6996C3DC
	Offset: 0x318
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_a6ab97f0(type)
{
	switch(type)
	{
		case 10:
		{
			break;
		}
		case 12:
		{
			break;
		}
		case 46:
		{
			self.doa.var_ccd8393c = 0;
			self namespace_83eb6304::turnofffx("divine_shield");
			self namespace_83eb6304::function_3ecfde67("divine_shield_off");
			break;
		}
	}
}

/*
	Name: function_6acf8fc6
	Namespace: namespace_b754744b
	Checksum: 0x96AAA816
	Offset: 0x3D0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_6acf8fc6(type)
{
	self endon(#"disconnect");
	switch(type)
	{
		case 10:
		{
			break;
		}
		case 12:
		{
			break;
		}
		case 46:
		{
			timeout = self doa_fate::function_4808b985(1800);
			self waittilltimeout(timeout, #"hash_226c5964dec34ae7");
			break;
		}
	}
	self thread function_a6ab97f0(type);
}

