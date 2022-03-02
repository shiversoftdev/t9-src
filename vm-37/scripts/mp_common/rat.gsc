#using script_2255a7ad3edc838f;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\rat_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\dev.gsc;
#using scripts\mp_common\util.gsc;

#namespace rat;

/*
	Name: function_89f2df9
	Namespace: rat
	Checksum: 0x326250AC
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"rat", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: rat
	Checksum: 0x7EB2FC97
	Offset: 0xE0
	Size: 0xC4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		init();
		level.rat.common.gethostplayer = &util::gethostplayer;
		level.rat.deathcount = 0;
		addratscriptcmd("", &rscaddenemy);
		addratscriptcmd("", &function_50634409);
		setdvar(#"rat_death_count", 0);
	#/
}

/*
	Name: function_50634409
	Namespace: rat
	Checksum: 0x783A9DBF
	Offset: 0x1B0
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_50634409(params)
{
	/#
		player = util::gethostplayerforbots();
		team = (player.team == #"allies" ? #"axis" : #"allies");
		bot = level bot::add_bot(team);
		if(isdefined(bot))
		{
			bot.ignoreall = 1;
		}
	#/
}

/*
	Name: rscaddenemy
	Namespace: rat
	Checksum: 0x6B5FBF4D
	Offset: 0x260
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function rscaddenemy(params)
{
	/#
		player = [[level.rat.common.gethostplayer]]();
		team = #"axis";
		if(isdefined(player.pers[#"team"]))
		{
			team = util::getotherteam(player.pers[#"team"]);
		}
		bot = dev::getormakebot(team);
		if(!isdefined(bot))
		{
			println("");
			ratreportcommandresult(params._id, 0, "");
			return;
		}
		bot thread testenemy(team);
		bot thread deathcounter();
		wait(2);
		pos = (float(params.x), float(params.y), float(params.z));
		bot setorigin(pos);
		if(isdefined(params.ax))
		{
			angles = (float(params.ax), float(params.ay), float(params.az));
			bot setplayerangles(angles);
		}
		ratreportcommandresult(params._id, 1);
	#/
}

/*
	Name: testenemy
	Namespace: rat
	Checksum: 0x9562AC59
	Offset: 0x4B8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function testenemy(team)
{
	/#
		self endon(#"disconnect");
		while(!isdefined(self.pers[#"team"]))
		{
			waitframe(1);
		}
		if(level.teambased)
		{
			params = {#intpayload:0, #response:level.teams[team], #menu:game.menu[#"menu_team"]};
			self notify(#"menuresponse", params);
			self callback::callback(#"hash_4e1a50a35ec44bcc", params);
		}
	#/
}

/*
	Name: deathcounter
	Namespace: rat
	Checksum: 0x74EA2DAE
	Offset: 0x5B8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function deathcounter()
{
	/#
		self waittill(#"death");
		level.rat.deathcount++;
		setdvar(#"rat_death_count", level.rat.deathcount);
	#/
}

