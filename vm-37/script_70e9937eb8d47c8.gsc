#using scripts\zm_common\zm_utility.gsc;
#using script_73bd646be3641c07;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_3411bb48d41bd3b;
#using scripts\zm_common\zm_score.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_barricade;

/*
	Name: function_59122168
	Namespace: zm_barricade
	Checksum: 0xC3B62E93
	Offset: 0x148
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_59122168()
{
	function_fdc4ca3c();
	level.barricades = struct::get_array("barricade_window", "targetname");
	array::thread_all(level.barricades, &function_14354831);
}

/*
	Name: function_fdc4ca3c
	Namespace: zm_barricade
	Checksum: 0xA6594F01
	Offset: 0x1B8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_fdc4ca3c()
{
	zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", 500);
	level.var_21326085 = 1;
}

/*
	Name: function_9d78f548
	Namespace: zm_barricade
	Checksum: 0xACE13E29
	Offset: 0x208
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event function_9d78f548(eventstruct)
{
}

/*
	Name: function_14354831
	Namespace: zm_barricade
	Checksum: 0xDE94354
	Offset: 0x220
	Size: 0x62C
	Parameters: 0
	Flags: None
*/
function function_14354831()
{
	if(self.content_key === "barricade_window")
	{
		str_target = self.target2;
		a_s_parts = struct::get_array(str_target);
		foreach(s_part in a_s_parts)
		{
			if(s_part.script_noteworthy === "barrier_align")
			{
				var_721fe4cf = self.origin;
				v_old_angles = self.angles;
				self.origin = s_part.origin;
				self.angles = s_part.angles;
				self.e_barricade = namespace_8b6a9d79::function_94974eef(self, "zbarrier_" + self.zbarrier);
				self.e_barricade.targetname = str_target;
				self.origin = var_721fe4cf;
				self.angles = v_old_angles;
				break;
			}
		}
	}
	else
	{
		str_target = self.target;
	}
	if(!isdefined(str_target))
	{
		return;
	}
	pos = zm_utility::groundpos(self.origin) + vectorscale((0, 0, 1), 8);
	if(isdefined(pos))
	{
		self.origin = pos;
	}
	targets = getentarray(str_target, "targetname");
	self.barrier_chunks = [];
	for(j = 0; j < targets.size; j++)
	{
		if(targets[j] iszbarrier())
		{
			if(isdefined(level.zbarrier_override))
			{
				self thread [[level.zbarrier_override]](targets[j]);
				continue;
			}
			self.zbarrier = targets[j];
			self.zbarrier function_619a5c20();
			self.zbarrier namespace_5b1144e::function_550247bd(12);
			self.zbarrier.chunk_health = [];
			for(i = 0; i < self.zbarrier getnumzbarrierpieces(); i++)
			{
				self.zbarrier.chunk_health[i] = 0;
			}
			continue;
		}
		targets[j] zm_blockers::update_states("repaired");
		targets[j].destroyed = 0;
		targets[j] show();
		targets[j].claimed = 0;
		targets[j].anim_grate_index = 0;
		targets[j].og_origin = targets[j].origin;
		targets[j].og_angles = targets[j].angles;
		self.barrier_chunks[self.barrier_chunks.size] = targets[j];
	}
	target_nodes = getnodearray(str_target, "targetname");
	/#
		/#
			assert(target_nodes.size == 1, "");
		#/
		/#
			assert(target_nodes[0].type == #"volume", "");
		#/
	#/
	self.neg_start = target_nodes[0];
	self.neg_end = namespace_85745671::function_5a4a952a(self.neg_start);
	setenablenode(self.neg_start, 1);
	setenablenode(self.neg_end, 0);
	self zm_blockers::blocker_attack_spots();
	a_s_parts = struct::get_array(str_target);
	foreach(s_part in a_s_parts)
	{
		if(s_part.script_noteworthy === "trigger_location")
		{
			self.trigger_location = s_part;
		}
		if(s_part.script_noteworthy === "barrier_align")
		{
			self.barrier_align = s_part;
		}
	}
	self thread zm_blockers::blocker_think();
	namespace_85745671::function_aa894590();
	namespace_85745671::function_1ede0cd3(self.neg_start, self);
	self callback::function_d8abfc3d(#"hash_25e53b7f7249adb7", &function_d58c97c8);
	self thread function_348283c9();
	self thread function_55ce3493();
}

/*
	Name: function_d58c97c8
	Namespace: zm_barricade
	Checksum: 0xB9849F3A
	Offset: 0x858
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_d58c97c8()
{
	namespace_85745671::function_aa894590();
	namespace_85745671::function_1ede0cd3(self.neg_start, self);
	setenablenode(self.neg_start, 1);
	setenablenode(self.neg_end, 0);
}

/*
	Name: function_348283c9
	Namespace: zm_barricade
	Checksum: 0x3E8CCD95
	Offset: 0x8C8
	Size: 0x1A0
	Parameters: 0
	Flags: Private
*/
function private function_348283c9()
{
	level endon(#"stop_blocker_think");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zombie_board_tear", #"hash_5cfbbb6ee8378665");
		if(waitresult._notify === #"hash_5cfbbb6ee8378665")
		{
			chunks = zm_utility::get_non_destroyed_chunks(self, self.barrier_chunks);
			foreach(chunk in chunks)
			{
				self.zbarrier setzbarrierpiecestate(chunk, "open");
			}
		}
		if(zm_utility::all_chunks_destroyed(self, self.barrier_chunks))
		{
			namespace_85745671::function_a63a9610();
			setenablenode(self.neg_start, 1);
			setenablenode(self.neg_end, 1);
		}
	}
}

/*
	Name: function_55ce3493
	Namespace: zm_barricade
	Checksum: 0xFEE975B0
	Offset: 0xA70
	Size: 0x168
	Parameters: 0
	Flags: Private
*/
function private function_55ce3493()
{
	level endon(#"stop_blocker_think");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_1748b3e6967cf7aa", #"hash_45aa77702fef26f4");
		var_1b8b64ca = self.attack_spots_taken.size;
		var_6195506c = 0;
		foreach(spot in self.attack_spots_taken)
		{
			if(spot)
			{
				var_6195506c++;
			}
		}
		if(var_6195506c == var_1b8b64ca)
		{
			setenablenode(self.neg_start, 0);
		}
		else if(waitresult._notify === #"hash_45aa77702fef26f4" && var_6195506c == (var_1b8b64ca - 1))
		{
			setenablenode(self.neg_start, 1);
		}
	}
}

