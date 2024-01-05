#using scripts\core_common\callbacks_shared.gsc;

#namespace bot_difficulty;

/*
	Name: function_70a657d8
	Namespace: bot_difficulty
	Checksum: 0x1812542D
	Offset: 0x68
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	callback::on_joined_team(&function_e161bc77);
}

/*
	Name: function_e161bc77
	Namespace: bot_difficulty
	Checksum: 0x96F416D0
	Offset: 0x98
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e161bc77(params)
{
	if(!isbot(self))
	{
		return;
	}
	self assign();
}

/*
	Name: assign
	Namespace: bot_difficulty
	Checksum: 0x2CF4C44
	Offset: 0xE0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function assign()
{
	sessionmode = currentsessionmode();
	switch(sessionmode)
	{
		case 1:
		{
			self function_d46cc4f5();
		}
	}
	self callback::callback(#"hash_730d00ef91d71acf");
}

/*
	Name: function_d46cc4f5
	Namespace: bot_difficulty
	Checksum: 0xEA7CA5D9
	Offset: 0x160
	Size: 0x9A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d46cc4f5()
{
	team = (isdefined(self.pers[#"team"]) ? self.pers[#"team"] : self.team);
	difficulty = level function_c0e2f147(team);
	self.bot.difficulty = level function_abad20c4(difficulty);
}

/*
	Name: function_c0e2f147
	Namespace: bot_difficulty
	Checksum: 0x30FE9BA0
	Offset: 0x208
	Size: 0xDA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c0e2f147(team)
{
	if(is_true(getgametypesetting(#"hash_c6a2e6c3e86125a")))
	{
		return getgametypesetting(#"bot_difficulty_vs_bots");
	}
	if(!level.teambased)
	{
		team = #"allies";
	}
	teamstr = level.teams[team];
	if(!isdefined(teamstr))
	{
		return undefined;
	}
	return getgametypesetting(#"hash_7a5a6325a6e843b7" + teamstr);
}

/*
	Name: function_abad20c4
	Namespace: bot_difficulty
	Checksum: 0x7D42669D
	Offset: 0x2F0
	Size: 0xFA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_abad20c4(difficulty)
{
	if(!isdefined(difficulty))
	{
		difficulty = 0;
	}
	switch(difficulty)
	{
		case 1:
		{
			return getscriptbundle(#"hash_4e14664ff6086a77");
		}
		case 2:
		{
			return getscriptbundle(#"hash_70373311631d808e");
		}
		case 3:
		{
			return getscriptbundle(#"hash_4e151fcf3acee254");
		}
		case 0:
		default:
		{
			return getscriptbundle(#"hash_e8255beefa53aa1");
		}
	}
}

