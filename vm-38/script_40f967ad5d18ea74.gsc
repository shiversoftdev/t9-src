#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_68cdf0ca5df5e;
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

class class_6fd989ce 
{
	var var_da2586f5;
	var m_name;
	var var_6b6ff268;
	var var_1ac7d2e7;
	var var_85613d6b;
	var var_2d1aa65b;
	var var_5466886f;
	var m_health;

	/*
		Name: constructor
		Namespace: namespace_6fd989ce
		Checksum: 0x7255CD5
		Offset: 0x330
		Size: 0x6A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.m_name = "";
		self.var_5466886f = "";
		self.var_2d1aa65b = 512;
		self.var_1ac7d2e7 = 256;
		self.var_da2586f5 = 15;
		self.var_85613d6b = [];
		self.m_health = 12000;
		self.var_6b6ff268 = 1;
	}

	/*
		Name: destructor
		Namespace: namespace_6fd989ce
		Checksum: 0x80F724D1
		Offset: 0x3A8
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_1296c737
		Namespace: namespace_6fd989ce
		Checksum: 0x72A2D55
		Offset: 0x670
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_1296c737()
	{
		return var_da2586f5;
	}

	/*
		Name: getname
		Namespace: namespace_6fd989ce
		Checksum: 0x37C47C47
		Offset: 0x610
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getname()
	{
		return m_name;
	}

	/*
		Name: function_6b86128a
		Namespace: namespace_6fd989ce
		Checksum: 0x156686ED
		Offset: 0x6B8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_6b86128a()
	{
		return var_6b6ff268;
	}

	/*
		Name: getheight
		Namespace: namespace_6fd989ce
		Checksum: 0xB8361A3B
		Offset: 0x658
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getheight()
	{
		return var_1ac7d2e7;
	}

	/*
		Name: function_910a1ed9
		Namespace: namespace_6fd989ce
		Checksum: 0x6B2581A7
		Offset: 0x688
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_910a1ed9()
	{
		return var_85613d6b;
	}

	/*
		Name: init
		Namespace: namespace_6fd989ce
		Checksum: 0x639F833F
		Offset: 0x3B8
		Size: 0x24E
		Parameters: 1
		Flags: Linked
	*/
	function init(var_d7dae20a)
	{
		self.m_name = var_d7dae20a.script_noteworthy;
		/#
			assert(isdefined(m_name) && m_name != "", "");
		#/
		a_toks = strtok(var_d7dae20a.script_string, ",");
		/#
			assert(a_toks.size >= 3, "" + var_d7dae20a.script_string);
		#/
		self.var_5466886f = a_toks[0];
		self.var_2d1aa65b = int(a_toks[1]);
		self.var_1ac7d2e7 = int(a_toks[2]);
		if(a_toks.size >= 4)
		{
			self.var_da2586f5 = int(a_toks[3]);
		}
		if(a_toks.size >= 5)
		{
			self.m_health = int(a_toks[4]);
		}
		if(a_toks.size >= 6)
		{
			self.var_6b6ff268 = int(a_toks[5]);
		}
		self.var_85613d6b = struct::get_array(var_d7dae20a.target, "targetname");
		foreach(node in var_85613d6b)
		{
			node.origin = node.origin - var_d7dae20a.origin;
		}
	}

	/*
		Name: getwidth
		Namespace: namespace_6fd989ce
		Checksum: 0xE3BE8A6
		Offset: 0x640
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getwidth()
	{
		return var_2d1aa65b;
	}

	/*
		Name: function_c1009efb
		Namespace: namespace_6fd989ce
		Checksum: 0x174F5E9
		Offset: 0x628
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_c1009efb()
	{
		return var_5466886f;
	}

	/*
		Name: function_de9607de
		Namespace: namespace_6fd989ce
		Checksum: 0xA0F65299
		Offset: 0x6A0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_de9607de()
	{
		return m_health;
	}

}

class class_c4926dee 
{
	var generator;
	var team;
	var origin;
	var health;
	var var_21a4af6a;
	var var_24bb61f1;
	var var_60b96c85;
	var var_cda957a8;
	var m_model;
	var var_31d445dc;
	var var_1dd049a8;
	var m_trigger;
	var var_5eeaacc8;
	var var_71c23335;
	var var_c35ec3b3;
	var var_1d308eec;
	var m_type;
	var var_87ef4b13;
	var var_71fccd1d;
	var maxhealth;
	var var_83cb975;
	var var_520afec4;
	var var_de510cda;
	var ai_type;
	var var_6d14cf9d;
	var var_915ae41d;
	var var_c24010e8;

	/*
		Name: constructor
		Namespace: namespace_c4926dee
		Checksum: 0x379850E4
		Offset: 0x908
		Size: 0x106
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_de510cda = undefined;
		self.m_trigger = undefined;
		self.m_model = undefined;
		self.var_915ae41d = 15;
		self.var_71c23335 = [];
		self.var_1dd049a8 = 0;
		self.var_31d445dc = [];
		self.m_type = undefined;
		self.var_1d308eec = "generic_generator_active";
		self.var_87ef4b13 = "generic_generator_die";
		self.var_5eeaacc8 = #"zmb_aat_kilowatt_explode";
		self.var_520afec4 = #"zmb_aat_kilowatt_explode";
		self.var_c24010e8 = 0;
		self.var_83cb975 = undefined;
		self.var_cda957a8 = undefined;
		self.var_c35ec3b3 = undefined;
		self.var_24bb61f1 = undefined;
		self.var_60b96c85 = 1;
		self.var_71fccd1d = undefined;
	}

	/*
		Name: destructor
		Namespace: namespace_c4926dee
		Checksum: 0x63E66470
		Offset: 0xA18
		Size: 0x24
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
		self.var_31d445dc = [];
		namespace_1e25ad94::debugmsg("Generator destructor being called.");
	}

	/*
		Name: function_331fc68
		Namespace: namespace_c4926dee
		Checksum: 0x50170E7A
		Offset: 0x1358
		Size: 0x66
		Parameters: 4
		Flags: Linked
	*/
	function function_331fc68(activefx, var_3ac6a87b, spawnfx, spawnfxdelay)
	{
		if(!isdefined(spawnfxdelay))
		{
			spawnfxdelay = 1;
		}
		self.var_1d308eec = activefx;
		self.var_87ef4b13 = var_3ac6a87b;
		self.var_cda957a8 = spawnfx;
		self.var_24bb61f1 = spawnfxdelay;
	}

	/*
		Name: function_5576668
		Namespace: namespace_c4926dee
		Checksum: 0x8A5CFD75
		Offset: 0x1E68
		Size: 0x598
		Parameters: 13
		Flags: Linked
	*/
	function function_5576668(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
	{
		if(([[ generator ]]->candamage(shitloc)) == 0)
		{
			return 0;
		}
		if(iboneindex === #"mod_crush")
		{
			return 0;
		}
		if(isdefined(shitloc) && shitloc.team === team)
		{
			return 0;
		}
		if(is_true(level.doa.var_318aa67a) && isdefined(shitloc))
		{
			distsq = distancesquared(origin, shitloc.origin);
			if(distsq > sqr(1500))
			{
				return 0;
			}
			if(distsq < sqr(300))
			{
				psoffsettime = psoffsettime;
			}
			else
			{
				lerp = 1 - (distsq / sqr(1500));
				psoffsettime = int(lerpfloat(0, psoffsettime, lerp));
			}
		}
		psoffsettime = int(psoffsettime);
		var_799e18e5 = imodelindex;
		var_5f32808d = 1;
		if(psoffsettime >= 1000)
		{
			var_5f32808d = 2;
		}
		self namespace_ec06fe4a::function_2f4b0f9(health, shitloc, var_799e18e5, psoffsettime, var_5f32808d);
		if(psoffsettime >= health)
		{
			self.takedamage = 0;
			psoffsettime = health - 1;
			if(isplayer(shitloc))
			{
				shitloc namespace_eccff4fb::enemykill(undefined, 2500);
				namespace_7f5aeb59::function_f8645db3(getdvarint(#"hash_1a9633163aac4fab", 100));
			}
			var_a49e1d80 = [[ generator ]]->function_3e35eb73();
			foreach(spawner in var_a49e1d80)
			{
				if(isdefined(spawner))
				{
					spawner notify(#"hash_38a47f8bbc000501");
				}
			}
			doa_enemy::function_f7086924(self);
			foreach(ai in [[ generator ]]->getai())
			{
				if(!isdefined(ai))
				{
					continue;
				}
				if(is_true(ai.var_1f2d0447) && (gettime() - ai.doa.birthtime) < 1500)
				{
					ai.annihilate = 1;
					ai thread namespace_ec06fe4a::function_570729f0(0.1);
				}
			}
			level thread namespace_c85a46fe::function_40ec656b(self, [[ generator ]]->function_68e475d0(), [[ generator ]]->function_8370e1a3());
		}
		if(isplayer(shitloc) && var_21a4af6a > 0)
		{
			self.var_21a4af6a = var_21a4af6a - psoffsettime;
			points = (int(psoffsettime / 25)) * 25;
			points = points >> 2;
			points = (int(points / 25)) * 25;
			shitloc namespace_eccff4fb::enemykill(undefined, points);
		}
		return psoffsettime;
	}

	/*
		Name: function_bf5fc68
		Namespace: namespace_c4926dee
		Checksum: 0xC25320EF
		Offset: 0x1430
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_bf5fc68()
	{
		return var_24bb61f1;
	}

	/*
		Name: function_fa5c9c4
		Namespace: namespace_c4926dee
		Checksum: 0x6225D006
		Offset: 0x1208
		Size: 0xE
		Parameters: 0
		Flags: Linked
	*/
	function function_fa5c9c4()
	{
		return var_60b96c85 == 0;
	}

	/*
		Name: function_3038a5ee
		Namespace: namespace_c4926dee
		Checksum: 0xDF2CC656
		Offset: 0x1418
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_3038a5ee()
	{
		return var_cda957a8;
	}

	/*
		Name: function_30a0163e
		Namespace: namespace_c4926dee
		Checksum: 0xD8D6F17E
		Offset: 0x11D8
		Size: 0x10
		Parameters: 0
		Flags: Linked
	*/
	function function_30a0163e()
	{
		return var_60b96c85 == 2;
	}

	/*
		Name: getcenter
		Namespace: namespace_c4926dee
		Checksum: 0xC9EA339
		Offset: 0x1250
		Size: 0x12
		Parameters: 0
		Flags: Linked
	*/
	function getcenter()
	{
		return m_model.origin;
	}

	/*
		Name: function_3e35eb73
		Namespace: namespace_c4926dee
		Checksum: 0xE19C5DE0
		Offset: 0x12C0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_3e35eb73()
	{
		return var_31d445dc;
	}

	/*
		Name: function_41157a40
		Namespace: namespace_c4926dee
		Checksum: 0x9AAF8D54
		Offset: 0x1678
		Size: 0x4A0
		Parameters: 0
		Flags: Linked
	*/
	function function_41157a40()
	{
		level endon(#"game_over");
		self endon(#"destroy");
		if(function_30a0163e())
		{
			while(level flag::get("dungeon_building"))
			{
				wait(1);
			}
		}
		while(true)
		{
			if(!isalive())
			{
				return;
			}
			last = var_1dd049a8;
			self.var_1dd049a8 = 0;
			players = getplayers();
			if(function_30a0163e())
			{
				room = function_7475529a();
				if(!isdefined(room))
				{
					return;
				}
				foreach(player in players)
				{
					if(player.doa.var_2fb8ffeb === room)
					{
						self.var_1dd049a8 = 1;
						break;
					}
					foreach(adjacent in room.neighbors)
					{
						if(!isdefined(adjacent))
						{
							continue;
						}
						if(player.doa.var_2fb8ffeb === adjacent)
						{
							self.var_1dd049a8 = 1;
							break;
						}
					}
				}
			}
			else
			{
				foreach(player in players)
				{
					if(player istouching(m_trigger))
					{
						self.var_1dd049a8 = 1;
						break;
					}
				}
			}
			self.var_1dd049a8 = var_1dd049a8 & function_d8b78bb3();
			if(last && !var_1dd049a8)
			{
				m_model namespace_83eb6304::turnofffx(function_45ee8bad());
				m_model clientfield::set("show_health_bar", 0);
				m_model namespace_c85a46fe::function_a5c8be46();
				doa_enemy::function_f7086924(m_model);
			}
			else if(!last && var_1dd049a8)
			{
				m_model namespace_83eb6304::function_3ecfde67(function_45ee8bad());
				m_model clientfield::set("show_health_bar", 1);
				m_model namespace_c85a46fe::showonradar();
				if(isdefined(var_5eeaacc8))
				{
					m_model namespace_e32bb68::function_3a59ec34(var_5eeaacc8);
				}
			}
			wait(randomfloatrange(0.25, 0.75));
			arrayremovevalue(var_71c23335, undefined, 0);
		}
	}

	/*
		Name: function_44549c13
		Namespace: namespace_c4926dee
		Checksum: 0x5A3ABDF4
		Offset: 0x1478
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_44549c13()
	{
		return var_c35ec3b3;
	}

	/*
		Name: function_45ee8bad
		Namespace: namespace_c4926dee
		Checksum: 0x933A8A32
		Offset: 0x1448
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_45ee8bad()
	{
		return var_1d308eec;
	}

	/*
		Name: getai
		Namespace: namespace_c4926dee
		Checksum: 0xEE333216
		Offset: 0x1000
		Size: 0x12
		Parameters: 1
		Flags: Linked
	*/
	function getai(ai)
	{
		return var_71c23335;
	}

	/*
		Name: function_5ce4fb28
		Namespace: namespace_c4926dee
		Checksum: 0xDDBBF0FD
		Offset: 0x12A8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_5ce4fb28()
	{
		return m_type;
	}

	/*
		Name: isalive
		Namespace: namespace_c4926dee
		Checksum: 0x8E187793
		Offset: 0x11A8
		Size: 0x24
		Parameters: 0
		Flags: Linked
	*/
	function isalive()
	{
		return isdefined(m_model) && m_model.health > 0;
	}

	/*
		Name: function_68e475d0
		Namespace: namespace_c4926dee
		Checksum: 0x42AF4E55
		Offset: 0x1460
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_68e475d0()
	{
		return var_87ef4b13;
	}

	/*
		Name: function_7475529a
		Namespace: namespace_c4926dee
		Checksum: 0x43BC7712
		Offset: 0x1300
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_7475529a()
	{
		return var_71fccd1d;
	}

	/*
		Name: function_75df0623
		Namespace: namespace_c4926dee
		Checksum: 0x24542BA0
		Offset: 0x12D8
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_75df0623(room)
	{
		self.var_71fccd1d = room;
	}

	/*
		Name: function_7dff7809
		Namespace: namespace_c4926dee
		Checksum: 0x9688C5E0
		Offset: 0x1B20
		Size: 0x108
		Parameters: 3
		Flags: Linked
	*/
	function function_7dff7809(generator, interval, var_f0fd371f)
	{
		if(!isdefined(var_f0fd371f))
		{
			var_f0fd371f = 300;
		}
		self endon(#"death");
		while(true)
		{
			wait(1);
			if([[ interval ]]->isactive())
			{
				continue;
			}
			if(health < maxhealth)
			{
				self.health = math::clamp(health + var_f0fd371f, 0, maxhealth);
				health = (health / maxhealth) * ((1 << 8) - 1);
				self clientfield::set("set_health_bar", int(health));
			}
		}
	}

	/*
		Name: function_7fcca25d
		Namespace: namespace_c4926dee
		Checksum: 0xD7A1845C
		Offset: 0x1290
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_7fcca25d()
	{
		return var_83cb975;
	}

	/*
		Name: function_8370e1a3
		Namespace: namespace_c4926dee
		Checksum: 0x550DFF1C
		Offset: 0x14A8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_8370e1a3()
	{
		return var_520afec4;
	}

	/*
		Name: init
		Namespace: namespace_c4926dee
		Checksum: 0xBE84770
		Offset: 0xA48
		Size: 0x57C
		Parameters: 7
		Flags: Linked
	*/
	function init(origin, angles, def, width, height, var_8a14a619, context)
	{
		self.var_de510cda = def;
		self.var_60b96c85 = context;
		if(!isdefined(width))
		{
			width = [[ var_de510cda ]]->getwidth();
		}
		if(!isdefined(height))
		{
			height = [[ var_de510cda ]]->getheight();
		}
		if(!isdefined(var_8a14a619))
		{
			var_8a14a619 = [[ var_de510cda ]]->function_1296c737();
		}
		if(!function_30a0163e())
		{
			self.m_trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", origin + (vectorscale((0, 0, -1), 72)), 2 | 16, width, height);
			if(!isdefined(m_trigger))
			{
				return;
			}
		}
		self.m_model = namespace_ec06fe4a::function_e22ae9b3(origin, [[ var_de510cda ]]->function_c1009efb());
		if(!isdefined(m_model))
		{
			m_trigger delete();
			return;
		}
		m_model.modelname = [[ var_de510cda ]]->function_c1009efb();
		m_model.angles = angles;
		m_model.health = ([[ var_de510cda ]]->function_de9607de()) * getplayers().size;
		m_model.maxhealth = m_model.health;
		m_model.var_21a4af6a = m_model.maxhealth;
		m_model.radius = width;
		m_model.generator = self;
		m_model.trigger = m_trigger;
		m_model.takedamage = 1;
		m_model setcandamage(1);
		m_model.var_86a21346 = &function_5576668;
		m_model setteam(#"axis");
		self.var_915ae41d = var_8a14a619;
		m_model thread function_7dff7809(self, 1);
		self.var_83cb975 = namespace_ec06fe4a::function_7fcca25d("Generator" + ([[ var_de510cda ]]->function_c1009efb()));
		var_d7f42bb7 = [[ var_de510cda ]]->function_910a1ed9();
		foreach(node in var_d7f42bb7)
		{
			spawner = spawnstruct();
			spawner.origin = m_model.origin + rotatepoint(node.origin, m_model.angles);
			spawner.ai_type = node.script_noteworthy;
			if([[ var_de510cda ]]->function_6b86128a())
			{
				spawner.origin = namespace_ec06fe4a::function_65ee50ba(spawner.origin);
			}
			spawner.angles = node.angles + m_model.angles;
			spawner.var_6d14cf9d = (isdefined(node.script_int) ? int(node.script_int) : 3);
			if(!isdefined(m_type) && isdefined(spawner.ai_type))
			{
				self.m_type = spawner.ai_type;
			}
			spawner thread function_a2bbc139(self);
			self.var_31d445dc[var_31d445dc.size] = spawner;
		}
		m_model enableaimassist();
		m_model thread namespace_c85a46fe::function_ec072c1a(function_5ce4fb28());
		self thread function_41157a40();
	}

	/*
		Name: function_a2bbc139
		Namespace: namespace_c4926dee
		Checksum: 0x49199D26
		Offset: 0x1C30
		Size: 0x230
		Parameters: 1
		Flags: Linked
	*/
	function function_a2bbc139(generator)
	{
		self endon(#"hash_38a47f8bbc000501");
		generator endon(#"destroy");
		level endon(#"game_over");
		model = undefined;
		spawndef = doa_enemy::function_d7c5adee(ai_type);
		wait(randomfloat(2));
		while(isdefined(generator) && [[ generator ]]->isalive())
		{
			if([[ generator ]]->canspawn())
			{
				if(!isdefined(model))
				{
					model = [[ generator ]]->getmodel();
					spawnfx = [[ generator ]]->function_3038a5ee();
					var_36ca64f1 = [[ generator ]]->function_44549c13();
				}
				if(isdefined(model) && isdefined(spawnfx))
				{
					model namespace_83eb6304::function_3ecfde67(spawnfx);
					if(isdefined(var_36ca64f1))
					{
						model namespace_e32bb68::function_3a59ec34(var_36ca64f1);
					}
					wait([[ generator ]]->function_bf5fc68());
					if(isdefined(model))
					{
						model namespace_83eb6304::turnofffx(spawnfx);
					}
				}
				doa_enemy::function_a6b807ea(spawndef, 1, origin, 0, generator);
				/#
					if(getdvarint(#"hash_14f8549e0645635d", 0))
					{
						level thread namespace_1e25ad94::function_1d1f2c26(origin, var_6d14cf9d, 12, (1, 0, 0));
					}
				#/
				wait(var_6d14cf9d);
			}
			else
			{
				wait(randomfloatrange(0.5, 2));
			}
		}
	}

	/*
		Name: array_removeundefined
		Namespace: namespace_c4926dee
		Checksum: 0xD6DCD8E2
		Offset: 0x2408
		Size: 0xE4
		Parameters: 1
		Flags: Linked
	*/
	function array_removeundefined(array)
	{
		removed = array;
		arrayremovevalue(removed, undefined, 1);
		foreach(obj in removed)
		{
			if(function_3132f113(obj))
			{
				arrayremovevalue(removed, obj, 1);
			}
		}
		return removed;
	}

	/*
		Name: function_bbdb303e
		Namespace: namespace_c4926dee
		Checksum: 0x2C6539B3
		Offset: 0x1220
		Size: 0x10
		Parameters: 0
		Flags: Linked
	*/
	function function_bbdb303e()
	{
		return var_60b96c85 == 3;
	}

	/*
		Name: function_bcd1aaf5
		Namespace: namespace_c4926dee
		Checksum: 0xFABC37C6
		Offset: 0xFD0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_bcd1aaf5(ai)
	{
		self.var_71c23335[var_71c23335.size] = ai;
	}

	/*
		Name: function_c08f72c2
		Namespace: namespace_c4926dee
		Checksum: 0xA08A3E09
		Offset: 0x13C8
		Size: 0x42
		Parameters: 3
		Flags: Linked
	*/
	function function_c08f72c2(var_3c6b5a32, var_3ffd02d8, var_acedff5b)
	{
		self.var_5eeaacc8 = var_3c6b5a32;
		self.var_520afec4 = var_3ffd02d8;
		self.var_c35ec3b3 = var_acedff5b;
	}

	/*
		Name: enable
		Namespace: namespace_c4926dee
		Checksum: 0xBA87585D
		Offset: 0x1318
		Size: 0x34
		Parameters: 1
		Flags: Linked
	*/
	function enable(flag)
	{
		if(isdefined(m_trigger))
		{
			m_trigger triggerenable(flag);
		}
	}

	/*
		Name: isactive
		Namespace: namespace_c4926dee
		Checksum: 0xFBFA2616
		Offset: 0x1190
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function isactive()
	{
		return var_1dd049a8;
	}

	/*
		Name: destroy
		Namespace: namespace_c4926dee
		Checksum: 0xB2F1956A
		Offset: 0x1520
		Size: 0x14E
		Parameters: 0
		Flags: Linked
	*/
	function destroy()
	{
		doa_enemy::function_f7086924(m_model);
		self.var_c24010e8 = 1;
		foreach(ai in var_71c23335)
		{
			if(!isdefined(ai))
			{
				continue;
			}
			if(is_true(ai.var_1f2d0447) && (gettime() - ai.doa.birthtime) < 1500)
			{
				ai.annihilate = 1;
				ai thread namespace_ec06fe4a::function_570729f0(0.1);
			}
		}
		level notify(var_83cb975);
		self notify(#"destroy");
		namespace_c85a46fe::function_320a66f9(m_model);
	}

	/*
		Name: function_d8b78bb3
		Namespace: namespace_c4926dee
		Checksum: 0x5EB2A8B8
		Offset: 0x1020
		Size: 0xD8
		Parameters: 0
		Flags: Linked
	*/
	function function_d8b78bb3()
	{
		if(isdefined(level.doa.var_182fb75a))
		{
			if(function_30a0163e())
			{
				return 1;
			}
			return isdefined(level.doa.var_6f3d327) && function_bbdb303e();
		}
		if(isdefined(level.doa.var_6f3d327))
		{
			if(function_bbdb303e())
			{
				return 1;
			}
			return 0;
		}
		if(isdefined(level.doa.var_a77e6349))
		{
			if(function_e55669e8())
			{
				return 1;
			}
			return 0;
		}
		return 1;
	}

	/*
		Name: getmodel
		Namespace: namespace_c4926dee
		Checksum: 0x90E79A97
		Offset: 0x1100
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getmodel()
	{
		return m_model;
	}

	/*
		Name: canspawn
		Namespace: namespace_c4926dee
		Checksum: 0x270B4B8F
		Offset: 0x1118
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function canspawn()
	{
		return isactive() && isalive() && var_71c23335.size < var_915ae41d && var_c24010e8 == 0 && namespace_250e9486::function_60f6a9e();
	}

	/*
		Name: function_e55669e8
		Namespace: namespace_c4926dee
		Checksum: 0xB62C9961
		Offset: 0x11F0
		Size: 0x10
		Parameters: 0
		Flags: Linked
	*/
	function function_e55669e8()
	{
		return var_60b96c85 == 1;
	}

	/*
		Name: function_e5ee7aea
		Namespace: namespace_c4926dee
		Checksum: 0x3482E97
		Offset: 0x1270
		Size: 0x12
		Parameters: 0
		Flags: Linked
	*/
	function function_e5ee7aea()
	{
		return m_model.radius;
	}

	/*
		Name: function_e96aef39
		Namespace: namespace_c4926dee
		Checksum: 0x4A2D79E8
		Offset: 0x1490
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_e96aef39()
	{
		return var_5eeaacc8;
	}

	/*
		Name: candamage
		Namespace: namespace_c4926dee
		Checksum: 0x1665A0DF
		Offset: 0x14C0
		Size: 0x52
		Parameters: 1
		Flags: Linked
	*/
	function candamage(attacker)
	{
		if(isdefined(attacker) && is_true(attacker.doa.var_3e81d24c))
		{
			return 1;
		}
		return isactive();
	}

	/*
		Name: function_f4238fe4
		Namespace: namespace_c4926dee
		Checksum: 0xCE319850
		Offset: 0x1238
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_f4238fe4()
	{
		return var_60b96c85;
	}

}

#namespace namespace_c85a46fe;

/*
	Name: function_884b5fde
	Namespace: namespace_c85a46fe
	Checksum: 0x97D0BAC
	Offset: 0x310
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_884b5fde()
{
	level notify(-1180801684);
}

/*
	Name: function_f1ba2302
	Namespace: namespace_c85a46fe
	Checksum: 0xA803AD4A
	Offset: 0x2C70
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_f1ba2302(name)
{
	foreach(var_9c185dd1 in level.doa.var_ea48c46c)
	{
		if(name === ([[ var_9c185dd1 ]]->getname()))
		{
			return var_9c185dd1;
		}
	}
}

/*
	Name: init
	Namespace: namespace_c85a46fe
	Checksum: 0xCCA00DE5
	Offset: 0x2D20
	Size: 0x1B6
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "set_icon", 1, 4, "int");
	clientfield::register("toplayer", "generator_sonar", 1, 1, "int");
	level.doa.var_ea48c46c = [];
	level.doa.var_8acd67ef = [];
	var_ea48c46c = struct::get_array("generatorDef", "targetname");
	foreach(item in var_ea48c46c)
	{
		if(isdefined(function_f1ba2302(item.script_noteworthy)))
		{
			continue;
		}
		generatordef = new class_6fd989ce();
		[[ generatordef ]]->init(item);
		level.doa.var_ea48c46c[level.doa.var_ea48c46c.size] = generatordef;
	}
	level.doa.var_c3219b45 = [];
}

/*
	Name: function_40ec656b
	Namespace: namespace_c85a46fe
	Checksum: 0xA9D96268
	Offset: 0x2EE0
	Size: 0xBC
	Parameters: 3
	Flags: Linked
*/
function function_40ec656b(model, var_3ac6a87b, var_c4a370ce)
{
	model namespace_83eb6304::function_3ecfde67(var_3ac6a87b);
	if(mayspawnentity() && isdefined(var_c4a370ce) && function_3238d10d(model.origin))
	{
		playsoundatposition(var_c4a370ce, model.origin);
	}
	util::wait_network_frame();
	if(isdefined(model))
	{
		function_320a66f9(model);
	}
}

/*
	Name: function_320a66f9
	Namespace: namespace_c85a46fe
	Checksum: 0x64AB59E9
	Offset: 0x2FA8
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_320a66f9(model)
{
	model clientfield::set("show_health_bar", 0);
	model function_a5c8be46();
	model namespace_ec06fe4a::function_8c808737();
	doa_enemy::function_f7086924(model);
	arrayremovevalue(level.doa.var_8acd67ef, model.generator);
	level.doa.var_c3219b45[level.doa.var_c3219b45.size] = model;
}

/*
	Name: function_5db81c1c
	Namespace: namespace_c85a46fe
	Checksum: 0xA9D09D45
	Offset: 0x3078
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_5db81c1c()
{
	self notify("6bfb6489af54deba");
	self endon("6bfb6489af54deba");
	level endon(#"game_over");
	while(true)
	{
		util::wait_network_frame();
		while(level.doa.var_c3219b45.size)
		{
			model = level.doa.var_c3219b45[0];
			arrayremoveindex(level.doa.var_c3219b45, 0);
			if(!isdefined(model))
			{
				continue;
			}
			if(isdefined(model.trigger))
			{
				model.trigger delete();
			}
			namespace_1e25ad94::debugmsg("Generator model delete Ent:" + model getentitynumber());
			model delete();
		}
	}
}

/*
	Name: function_782e605e
	Namespace: namespace_c85a46fe
	Checksum: 0x28B78B79
	Offset: 0x31B8
	Size: 0x250
	Parameters: 1
	Flags: Linked
*/
function function_782e605e(name)
{
	generators = struct::get_array(name + "_doa_generator", "targetname");
	var_d613e783 = (getplayers().size - 1) * 10;
	foreach(item in generators)
	{
		var_9b3d6734 = 100;
		if(isdefined(item.script_parameters))
		{
			a_toks = strtok(item.script_parameters, ",");
			radius = int(a_toks[0]);
			if(a_toks.size >= 2)
			{
				height = int(a_toks[1]);
			}
			if(a_toks.size >= 3)
			{
				var_8a14a619 = int(a_toks[2]);
			}
			if(a_toks.size >= 4)
			{
				var_9b3d6734 = int(a_toks[3]);
			}
		}
		var_9b3d6734 = var_9b3d6734 + var_d613e783;
		if(var_9b3d6734 < 100 && randomint(100) > var_9b3d6734)
		{
			continue;
		}
		function_4c16ce2c(item.script_noteworthy, item.origin, item.angles, radius, height, var_8a14a619);
	}
}

/*
	Name: function_edfcfa44
	Namespace: namespace_c85a46fe
	Checksum: 0x88917967
	Offset: 0x3410
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_edfcfa44(context)
{
	if(!isdefined(context))
	{
		context = 0;
	}
	level thread function_5db81c1c();
	if(context == 0)
	{
		while(level.doa.var_8acd67ef.size)
		{
			instance = level.doa.var_8acd67ef[0];
			if(isdefined(instance))
			{
				[[ instance ]]->destroy();
			}
		}
		level.doa.var_8acd67ef = [];
	}
	else
	{
		var_29287f31 = [];
		foreach(generator in level.doa.var_8acd67ef)
		{
			if(context == ([[ generator ]]->function_f4238fe4()))
			{
				var_29287f31[var_29287f31.size] = generator;
			}
		}
		while(var_29287f31.size)
		{
			instance = var_29287f31[0];
			arrayremovevalue(var_29287f31, instance);
			if(isdefined(instance))
			{
				[[ instance ]]->destroy();
			}
		}
	}
	while(level.doa.var_c3219b45.size > 0)
	{
		wait(1);
	}
}

/*
	Name: function_4c16ce2c
	Namespace: namespace_c85a46fe
	Checksum: 0xF91ACB39
	Offset: 0x35E0
	Size: 0x1C6
	Parameters: 7
	Flags: Linked
*/
function function_4c16ce2c(name, origin, angles, width, height, var_8a14a619, context)
{
	if(!isdefined(context))
	{
		context = 1;
	}
	var_9c185dd1 = function_f1ba2302(name);
	if(isdefined(var_9c185dd1))
	{
		generator = new class_c4926dee();
		[[ generator ]]->init(origin, angles, var_9c185dd1, width, height, var_8a14a619, context);
		if(name == "zombie")
		{
			[[ generator ]]->function_331fc68([[ generator ]]->function_45ee8bad(), "zombie_generator_die");
		}
		else
		{
			if(name == "crawler")
			{
				[[ generator ]]->function_331fc68("crawler_generator_spawn", "zombie_generator_die", "crawler_generator_spawn");
			}
			else
			{
				if(name == "skeleton")
				{
					[[ generator ]]->function_331fc68([[ generator ]]->function_45ee8bad(), "skeleton_generator_die");
				}
				else if(name == "demon")
				{
					[[ generator ]]->function_331fc68([[ generator ]]->function_45ee8bad(), "meat_explode");
				}
			}
		}
		level.doa.var_8acd67ef[level.doa.var_8acd67ef.size] = generator;
		return generator;
	}
}

/*
	Name: function_ec072c1a
	Namespace: namespace_c85a46fe
	Checksum: 0xB56B2973
	Offset: 0x37B0
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_ec072c1a(type)
{
	self endon(#"death");
	self.radartype = type;
}

/*
	Name: showonradar
	Namespace: namespace_c85a46fe
	Checksum: 0xB93FE84B
	Offset: 0x37E8
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function showonradar()
{
	if(!isdefined(self))
	{
		return;
	}
	icon_index = undefined;
	switch(self.radartype)
	{
		case "basic_zombie":
		{
			icon_index = 2;
			break;
		}
		case "skeleton":
		{
			icon_index = 7;
			break;
		}
		case "brutus":
		{
			icon_index = 3;
			break;
		}
		case "bat":
		{
			icon_index = 4;
			break;
		}
		case "demon":
		{
			icon_index = 5;
			break;
		}
		case "wolf_hellhound":
		{
			icon_index = 6;
			break;
		}
		case "crawler_zombie":
		{
			icon_index = 8;
			break;
		}
	}
	if(isdefined(icon_index))
	{
		self clientfield::set("set_icon", icon_index);
	}
}

/*
	Name: function_a5c8be46
	Namespace: namespace_c85a46fe
	Checksum: 0x787AB4E6
	Offset: 0x3918
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_a5c8be46()
{
	if(!isdefined(self))
	{
		return;
	}
	self clientfield::set("set_icon", 0);
}

/*
	Name: function_47c860ff
	Namespace: namespace_c85a46fe
	Checksum: 0x7F7B36C5
	Offset: 0x3950
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_47c860ff(flag)
{
	if(flag)
	{
		self showonradar();
	}
	else
	{
		self function_a5c8be46();
	}
	if(isdefined(self.generator))
	{
		[[ self.generator ]]->enable(flag);
	}
}

