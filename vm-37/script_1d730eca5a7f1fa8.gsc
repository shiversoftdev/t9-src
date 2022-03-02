#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
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

#namespace namespace_b754744b;

/*
	Name: function_b784c6bd
	Namespace: namespace_b754744b
	Checksum: 0x75BD84B
	Offset: 0x148
	Size: 0xD2
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
			self thread function_c3b1a6af();
			break;
		}
	}
}

/*
	Name: function_c3b1a6af
	Namespace: namespace_b754744b
	Checksum: 0xB023F7C6
	Offset: 0x228
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_c3b1a6af()
{
	self endon(#"disconnect");
	self clientfield::set_to_player("generator_sonar", 1);
	waitresult = undefined;
	waitresult = self waittilltimeout(10, #"death", #"entering_last_stand");
	self clientfield::set_to_player("generator_sonar", 0);
}

