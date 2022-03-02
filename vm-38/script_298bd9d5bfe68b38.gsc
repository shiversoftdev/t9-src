#using script_18f0d22c75b141a7;
#using script_75da5547b1822294;
#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace weapon_cache;

/*
	Name: function_ca52a7f5
	Namespace: weapon_cache
	Checksum: 0xAB0407A7
	Offset: 0x1B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ca52a7f5()
{
	level notify(1797501320);
}

/*
	Name: function_89f2df9
	Namespace: weapon_cache
	Checksum: 0xF1D5CF45
	Offset: 0x1D8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weapon_cache", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weapon_cache
	Checksum: 0x84585AE8
	Offset: 0x228
	Size: 0x128
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_6143c4e1e18f08fd")))
	{
		return;
	}
	clientfield::register("scriptmover", "register_weapon_cache", 1, 1, "int");
	clientfield::register("toplayer", "weapon_cache_ammo_cooldown", 1, 1, "int");
	clientfield::register("toplayer", "weapon_cache_cac_cooldown", 1, 1, "int");
	callback::on_connect(&onplayerconnect);
	level.var_b24258 = &function_b24258;
	level.var_f830a9db = &function_f830a9db;
	level.var_50c35573 = [];
}

/*
	Name: onplayerconnect
	Namespace: weapon_cache
	Checksum: 0x92778C9B
	Offset: 0x358
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect()
{
	level.var_50c35573[self getentitynumber()] = 1;
}

/*
	Name: finalize
	Namespace: weapon_cache
	Checksum: 0xA1527727
	Offset: 0x388
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	if(!is_true(getgametypesetting(#"hash_6143c4e1e18f08fd")))
	{
		return;
	}
	var_b5f67dff = territory::get_struct_array("weapon_cache");
	foreach(var_73b9e48e in var_b5f67dff)
	{
		var_73b9e48e.var_331b8fa4 = 0;
		var_73b9e48e function_4c6228cd();
	}
}

/*
	Name: function_4c6228cd
	Namespace: weapon_cache
	Checksum: 0x9720F5F2
	Offset: 0x478
	Size: 0x1F2
	Parameters: 0
	Flags: Linked
*/
function function_4c6228cd()
{
	usetrigger = spawn("trigger_radius_use", self.origin, 0, 96, 32);
	usetrigger setcursorhint("HINT_INTERACTIVE_PROMPT");
	usetrigger function_dae4ab9b(0);
	useobject = gameobjects::create_use_object(#"any", usetrigger, [], undefined, #"weapon_cache", 1, 1, 1, self.angles);
	useobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	useobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	useobject gameobjects::set_use_time(0);
	useobject gameobjects::set_onuse_event(&function_692bd0bc);
	useobject.canuseobject = &function_43017839;
	useobject.dontlinkplayertotrigger = 1;
	useobject.keepweapon = 1;
	useobject clientfield::set("register_weapon_cache", 1);
	useobject disconnectpaths();
	self.entity = util::spawn_model(#"p9_usa_large_ammo_crate_01", self.origin, self.angles);
	self.mdl_gameobject = useobject;
	useobject.var_73b9e48e = self;
}

/*
	Name: function_692bd0bc
	Namespace: weapon_cache
	Checksum: 0x1DC38E21
	Offset: 0x678
	Size: 0x2A4
	Parameters: 1
	Flags: Linked
*/
function function_692bd0bc(player)
{
	primaryweapons = player getweaponslistprimaries();
	givemaxammo = player hasperk(#"specialty_extraammo") || player function_db654c9(player.class_num, #"hash_4a12859000892dda");
	foreach(weapon in primaryweapons)
	{
		player setweaponammoclip(weapon, player function_b7f1fd2c(weapon));
		if(givemaxammo)
		{
			player givemaxammo(weapon);
			continue;
		}
		player givestartammo(weapon);
	}
	primaryoffhand = player function_826ed2dd();
	player setweaponammoclip(primaryoffhand, player function_b7f1fd2c(primaryoffhand));
	loadout = player loadout::function_e27dc453("secondarygrenade");
	secondaryoffhand = loadout.weapon;
	if(isdefined(secondaryoffhand) && player hasweapon(secondaryoffhand))
	{
		player setweaponammoclip(secondaryoffhand, player function_b7f1fd2c(secondaryoffhand));
	}
	player notify(#"resupply");
	player playsoundtoplayer(#"hash_da34d63dbce7ba7", player);
	player thread function_2909dca6(self.var_73b9e48e);
	player thread function_f9502d83();
}

/*
	Name: function_f9502d83
	Namespace: weapon_cache
	Checksum: 0x4145086E
	Offset: 0x928
	Size: 0x1D0
	Parameters: 0
	Flags: Linked
*/
function function_f9502d83()
{
	self endon(#"disconnect");
	var_b5f67dff = territory::get_struct_array("weapon_cache");
	self clientfield::set_to_player("weapon_cache_ammo_cooldown", 1);
	level.var_50c35573[self getentitynumber()] = 0;
	foreach(var_73b9e48e in var_b5f67dff)
	{
		var_73b9e48e gameobjects::function_7a00d78c(self);
	}
	self waittilltimeout(60, #"death");
	self clientfield::set_to_player("weapon_cache_ammo_cooldown", 0);
	level.var_50c35573[self getentitynumber()] = 1;
	foreach(var_73b9e48e in var_b5f67dff)
	{
		var_73b9e48e gameobjects::function_664b40(self);
	}
}

/*
	Name: function_43017839
	Namespace: weapon_cache
	Checksum: 0xCFE80F48
	Offset: 0xB00
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43017839(player)
{
	if(level.var_50c35573[player getentitynumber()] != 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_b24258
	Namespace: weapon_cache
	Checksum: 0x2542F08A
	Offset: 0xB48
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b24258(eventstruct)
{
	self luinotifyevent(#"hash_c893e57629c7648");
}

/*
	Name: function_f830a9db
	Namespace: weapon_cache
	Checksum: 0xA5711943
	Offset: 0xB80
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_f830a9db()
{
	self endon(#"disconnect");
	self clientfield::set_to_player("weapon_cache_cac_cooldown", 1);
	self notify(#"hash_2bc8de932f7212e7");
	self waittilltimeout(120, #"death");
	self clientfield::set_to_player("weapon_cache_cac_cooldown", 0);
}

/*
	Name: function_6f438290
	Namespace: weapon_cache
	Checksum: 0x7476EF9
	Offset: 0xC10
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6f438290()
{
	var_b5f67dff = territory::get_struct_array("weapon_cache");
	var_8794b467 = arraysortclosest(var_b5f67dff, self.origin);
	return var_8794b467[0];
}

/*
	Name: function_74547745
	Namespace: weapon_cache
	Checksum: 0x2F004B2C
	Offset: 0xC70
	Size: 0x7C
	Parameters: 0
	Flags: Private
*/
function private function_74547745()
{
	var_73b9e48e = self function_6f438290();
	if(!isdefined(var_73b9e48e))
	{
		return;
	}
	var_73b9e48e function_4ac19c4f();
	self waittill(#"death", #"hash_2bc8de932f7212e7");
	var_73b9e48e function_70db7bab();
}

/*
	Name: function_2909dca6
	Namespace: weapon_cache
	Checksum: 0xAB54D7BD
	Offset: 0xCF8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2909dca6(var_73b9e48e)
{
	var_73b9e48e function_4ac19c4f();
	wait(1);
	var_73b9e48e function_70db7bab();
}

/*
	Name: function_4ac19c4f
	Namespace: weapon_cache
	Checksum: 0xCAD576A0
	Offset: 0xD40
	Size: 0x58
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4ac19c4f()
{
	if(!self.var_331b8fa4 && isdefined(self.entity))
	{
		self.entity thread scene::play("p9_usa_large_ammo_crate_01_bundle", "open", self.entity);
	}
	self.var_331b8fa4++;
}

/*
	Name: function_70db7bab
	Namespace: weapon_cache
	Checksum: 0xEE7C0ED9
	Offset: 0xDA0
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70db7bab()
{
	if(self.var_331b8fa4 && isdefined(self.entity))
	{
		self.var_331b8fa4--;
		if(!self.var_331b8fa4)
		{
			self.entity thread scene::play("p9_usa_large_ammo_crate_01_bundle", "close", self.entity);
		}
	}
}

