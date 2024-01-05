#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace killstreak_hacking;

/*
	Name: enable_hacking
	Namespace: killstreak_hacking
	Checksum: 0xF9A76757
	Offset: 0xB8
	Size: 0x172
	Parameters: 3
	Flags: Linked
*/
function enable_hacking(killstreakname, prehackfunction, posthackfunction)
{
	killstreak = self;
	level.challenge_scorestreaksenabled = 1;
	killstreak.challenge_isscorestreak = 1;
	killstreak.killstreak_hackedcallback = &_hacked_callback;
	killstreak.killstreakprehackfunction = prehackfunction;
	killstreak.killstreakposthackfunction = posthackfunction;
	killstreak.hackertoolinnertimems = killstreak killstreak_bundles::get_hack_tool_inner_time();
	killstreak.hackertooloutertimems = killstreak killstreak_bundles::get_hack_tool_outer_time();
	killstreak.hackertoolinnerradius = killstreak killstreak_bundles::get_hack_tool_inner_radius();
	killstreak.hackertoolouterradius = killstreak killstreak_bundles::get_hack_tool_outer_radius();
	killstreak.hackertoolradius = killstreak.hackertoolouterradius;
	killstreak.killstreakhackloopfx = killstreak killstreak_bundles::get_hack_loop_fx();
	killstreak.killstreakhackfx = killstreak killstreak_bundles::get_hack_fx();
	killstreak.killstreakhackscoreevent = killstreak killstreak_bundles::get_hack_scoreevent();
	killstreak.killstreakhacklostlineofsightlimitms = killstreak killstreak_bundles::get_lost_line_of_sight_limit_msec();
	killstreak.killstreakhacklostlineofsighttimems = killstreak killstreak_bundles::get_hack_tool_no_line_of_sight_time();
	killstreak.killstreak_hackedprotection = killstreak killstreak_bundles::get_hack_protection();
}

/*
	Name: disable_hacking
	Namespace: killstreak_hacking
	Checksum: 0xC2A829A9
	Offset: 0x238
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function disable_hacking()
{
	killstreak = self;
	killstreak.killstreak_hackedcallback = undefined;
}

/*
	Name: hackerfx
	Namespace: killstreak_hacking
	Checksum: 0x8651A2F3
	Offset: 0x260
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function hackerfx()
{
	killstreak = self;
	if(isdefined(killstreak.killstreakhackfx) && killstreak.killstreakhackfx != "")
	{
		playfxontag(killstreak.killstreakhackfx, killstreak, "tag_origin");
	}
}

/*
	Name: hackerloopfx
	Namespace: killstreak_hacking
	Checksum: 0x249BC7D9
	Offset: 0x2C8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function hackerloopfx()
{
	killstreak = self;
	if(isdefined(killstreak.killstreakloophackfx) && killstreak.killstreakloophackfx != "")
	{
		playfxontag(killstreak.killstreakloophackfx, killstreak, "tag_origin");
	}
}

/*
	Name: _hacked_callback
	Namespace: killstreak_hacking
	Checksum: 0x5D634729
	Offset: 0x330
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private _hacked_callback(hacker)
{
	killstreak = self;
	originalowner = killstreak.owner;
	if(isdefined(killstreak.killstreakhackscoreevent))
	{
		scoreevents::processscoreevent(killstreak.killstreakhackscoreevent, hacker, originalowner, level.weaponhackertool);
	}
	if(isdefined(killstreak.killstreakprehackfunction))
	{
		killstreak thread [[killstreak.killstreakprehackfunction]](hacker);
	}
	killstreak killstreaks::configure_team_internal(hacker, 1);
	killstreak clientfield::set("enemyvehicle", 2);
	if(isdefined(killstreak.killstreakhackfx))
	{
		killstreak thread hackerfx();
	}
	if(isdefined(killstreak.killstreakhackloopfx))
	{
		killstreak thread hackerloopfx();
	}
	if(isdefined(killstreak.killstreakposthackfunction))
	{
		killstreak thread [[killstreak.killstreakposthackfunction]](hacker);
	}
	killstreaktype = killstreak.killstreaktype;
	if(isdefined(killstreak.hackedkillstreakref))
	{
		killstreaktype = killstreak.hackedkillstreakref;
	}
	level thread popups::displaykillstreakhackedteammessagetoall(killstreaktype, hacker);
	killstreak _update_health(hacker);
}

/*
	Name: override_hacked_killstreak_reference
	Namespace: killstreak_hacking
	Checksum: 0x419A2A4C
	Offset: 0x4D8
	Size: 0x26
	Parameters: 1
	Flags: None
*/
function override_hacked_killstreak_reference(killstreakref)
{
	killstreak = self;
	killstreak.hackedkillstreakref = killstreakref;
}

/*
	Name: get_hacked_timeout_duration_ms
	Namespace: killstreak_hacking
	Checksum: 0x89095FB1
	Offset: 0x508
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function get_hacked_timeout_duration_ms()
{
	killstreak = self;
	timeout = killstreak killstreak_bundles::get_hack_timeout();
	if(!isdefined(timeout) || timeout <= 0)
	{
		/#
			/#
				assertmsg(("" + killstreak.killstreaktype) + "");
			#/
		#/
		return;
	}
	return int(timeout * 1000);
}

/*
	Name: set_vehicle_drivable_time_starting_now
	Namespace: killstreak_hacking
	Checksum: 0x9E1F245D
	Offset: 0x5B0
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function set_vehicle_drivable_time_starting_now(killstreak, duration_ms)
{
	if(!isdefined(duration_ms))
	{
		duration_ms = -1;
	}
	if(duration_ms == -1)
	{
		duration_ms = killstreak get_hacked_timeout_duration_ms();
	}
	return self vehicle::set_vehicle_drivable_time_starting_now(duration_ms);
}

/*
	Name: _update_health
	Namespace: killstreak_hacking
	Checksum: 0x45C9840
	Offset: 0x618
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function _update_health(hacker)
{
	killstreak = self;
	if(isdefined(killstreak.hackedhealthupdatecallback))
	{
		killstreak [[killstreak.hackedhealthupdatecallback]](hacker);
	}
	else
	{
		if(issentient(killstreak))
		{
			hackedhealth = killstreak_bundles::get_hacked_health(killstreak.killstreaktype);
			/#
				assert(isdefined(hackedhealth));
			#/
			if(self.health > hackedhealth)
			{
				self.health = hackedhealth;
			}
		}
		else
		{
			/#
				hacker iprintlnbold("");
			#/
		}
	}
}

/*
	Name: killstreak_switch_team_end
	Namespace: killstreak_hacking
	Checksum: 0xBF96D3D2
	Offset: 0x700
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function killstreak_switch_team_end()
{
	/#
		killstreakentity = self;
		killstreakentity notify(#"killstreak_switch_team_end");
	#/
}

/*
	Name: killstreak_switch_team
	Namespace: killstreak_hacking
	Checksum: 0x2916D9BC
	Offset: 0x730
	Size: 0x21A
	Parameters: 1
	Flags: None
*/
function killstreak_switch_team(owner)
{
	/#
		killstreakentity = self;
		killstreakentity notify(#"killstreak_switch_team_singleton");
		killstreakentity endon(#"killstreak_switch_team_singleton", #"death");
		setdvar(#"scr_killstreak_switch_team", "");
		while(true)
		{
			wait(0.5);
			devgui_int = getdvarint(#"scr_killstreak_switch_team", 0);
			if(devgui_int != 0)
			{
				team = "";
				if(isdefined(level.getenemyteam) && isdefined(owner) && isdefined(owner.team))
				{
					team = [[level.getenemyteam]](owner.team);
				}
				if(isdefined(level.devongetormakebot))
				{
					player = [[level.devongetormakebot]](team);
				}
				if(!isdefined(player))
				{
					println("");
					wait(1);
					continue;
				}
				if(!isdefined(killstreakentity.killstreak_hackedcallback))
				{
					/#
						iprintlnbold("");
					#/
					return;
				}
				killstreakentity notify(#"killstreak_hacked", {#hacker:player});
				killstreakentity.previouslyhacked = 1;
				killstreakentity [[killstreakentity.killstreak_hackedcallback]](player);
				wait(0.5);
				setdvar(#"scr_killstreak_switch_team", 0);
				return;
			}
		}
	#/
}

