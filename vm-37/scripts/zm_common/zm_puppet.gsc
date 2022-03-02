#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_puppet;

/*
	Name: wait_for_puppet_pickup
	Namespace: zm_puppet
	Checksum: 0xE7212C82
	Offset: 0x70
	Size: 0x208
	Parameters: 0
	Flags: None
*/
function wait_for_puppet_pickup()
{
	/#
		self endon(#"death");
		self.iscurrentlypuppet = 0;
		while(true)
		{
			if(is_true(self.ispuppet) && !self.iscurrentlypuppet)
			{
				self notify(#"stop_zombie_goto_entrance");
				self.iscurrentlypuppet = 1;
			}
			if(!is_true(self.ispuppet) && self.iscurrentlypuppet)
			{
				self.iscurrentlypuppet = 0;
			}
			if(is_true(self.ispuppet) && zm_utility::check_point_in_playable_area(self.origin) && !isdefined(self.completed_emerging_into_playable_area))
			{
				self zm_spawner::zombie_complete_emerging_into_playable_area();
				self.barricade_enter = 0;
			}
			player = getplayers()[0];
			if(isdefined(player) && player buttonpressed(""))
			{
				if(self.iscurrentlypuppet)
				{
					if(zm_utility::check_point_in_playable_area(self.goalpos) && !zm_utility::check_point_in_playable_area(self.origin))
					{
						self.backedupgoal = self.goalpos;
					}
					if(!zm_utility::check_point_in_playable_area(self.goalpos) && isdefined(self.backupnode) && self.goalpos != self.backupnode.origin)
					{
						self notify(#"stop_zombie_goto_entrance");
					}
				}
			}
			waitframe(1);
		}
	#/
}

