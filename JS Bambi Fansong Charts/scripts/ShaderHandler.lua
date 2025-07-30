-- WARNING: COMPATIBLE WITH PSYCH ENGINE 0.6.3 / 0.7 / 0.7.1 / 0.7.1h ONLY
-- Author: TheLeerName
-- Description: lua functions for applying shaders on newer psych. contains: adding shaders to camera or sprite, setting/getting/tweening shader values
-- To use:
--		1. put this script in mods/scripts folder
--		2. u must have these `require` and `init` in start of onCreatePost() to initialize functions ( not recommended to use it in onCreate() if you on 0.7.1 / 0.7.1h )
--		3. make new .lua file with function below (until bunch of ------):
--		4. read documentation below to learn some functions
--		4. if you have shader errors it will avoid crashing game! (check "lime.utils.Log" line)
--[[

function onCreatePost()
	require('mods.scripts.ShaderHandler')
	initShaderHandler()

	initLuaShader('snow')
	addShaderOnCamera('camHUD', 'snow')
end

-------------------------------------------------- documentation started ------------------------------------------------- 


	initShaderHandler() : void
		initializes script, u cant use any functions below without this call



	addShaderOnCamera(camera : string, shader : string) : void
		adds shader on camera
			camera : string - camera to add (can be from hscript if you did setVar() )
			shader : string - shader name to add (ex. "snow" if you have it as "shaders/snow.frag")

	addShadersOnCamera(camera : string, shadersTable : table) : void
		adds several shaders on camera
			camera : string - camera to add (can be from hscript if you did setVar() )
			shadersTable : string - table with shader names to add (ex. {"snow", "fire"} if you have it all as "shaders/snow.frag" and "shaders/fire.frag")

	addShaderOnSprite(sprite : string, shader : string) : void
		adds shader on sprite
			sprite : string - sprite to add (can be from hscript if you did setVar() or from lua via makeLuaSprite() )
			shader : string - shader name to add (ex. "snow" if you have it as "shaders/snow.frag")



	removeShaderOnCamera(camera : string, shader : string) : void
		removes specific shader on camera
			camera : string - camera to remove (can be from hscript if you did setVar() )
			shader : string - shader name to remove (ex. "snow" if you have it as "shaders/snow.frag")

	removeShadersOnCamera(camera : string, shadersTable : table) : void
		removes several shaders on camera
			camera : string - camera to remove (can be from hscript if you did setVar() )
			shadersTable : string - table with shader names to remove (ex. {"snow", "fire"} if you have it all as "shaders/snow.frag" and "shaders/fire.frag")

	removeShaderOnSprite(sprite : string, shader : string) : void
		removes shader on sprite
			sprite : string - sprite to remove (can be from hscript if you did setVar() or from lua via makeLuaSprite() )
			shader : string - shader name to remove (ex. "snow" if you have it as "shaders/snow.frag")



	setShaderValue(shader : string, name : string, value : any) : void
		sets `value` with `name` to `shader` (shader name, not object)
			shader : string - shader name to set (ex. "snow" if you have it as "shaders/snow.frag")
			name : string - uniform variable name (ex. "iTime" if you have "uniform float iTime;" in .frag)
			value : any - if string, sets as sampler2D; if table, sets as vec2/3/4; if number or bool, sets as typical value

	getShaderValue(shader : string, name : string) : any
		sets `value` with `name` to `shader` (shader name, not object)
			shader : string - shader name to set (ex. "snow" if you have it as "shaders/snow.frag")
			name : string - uniform variable name (ex. "iTime" if you have "uniform float iTime;" in .frag)

	setGlobalShaderSpeed(value : number)
		sets global shader speed as multiplier to it ( or just use setProperty('globalShaderSpeed', 10) as you wish )



	doTweenShaderValue(tag : string, shader : string, name : string, value : number, duration : number, ease : string)
		doing the same as doTweenX or similar functions
			tag : string - tag of tween instance
			shader : string - shader name to set (ex. "snow" if you have it as "shaders/snow.frag")
			name : string - uniform variable name (ex. "iTime" if you have "uniform float iTime;" in .frag)
			value : number - self-explanatory
			duration : number - self-explanatory
			ease : string - self-explanatory

	startTweenShaderValue(tag : string, shader : string, name : string, value : number, duration : number, options : table)
		doing the same as startTween new lua function in 0.7 (works in 0.6.3 too!)
			tag : string - tag of tween instance
			shader : string - shader name to set (ex. "snow" if you have it as "shaders/snow.frag")
			name : string - uniform variable name (ex. "iTime" if you have "uniform float iTime;" in .frag)
			value : number - self-explanatory
			duration : number - self-explanatory
			options : string - read about it here: https://github.com/Meme1079/PsychWiki/wiki/Lua-Script-API:-Tweens-&-Timers-Functions#starttweentagstring-varsstring-valuesany--null-durationfloat-optionsany--null


]]------------------------------------------------- documentation ended --------------------------------------------------
-------------------------------- dont change anything below if you dont know what u doing --------------------------------

local cameraShaders = {}
local time = 0
local initialized = false

function initShaderHandler()
	luaDebugMode = true
	if initialized then return true end
	if not shadersEnabled then return false end

	setPropertyFromClass('lime.utils.Log', 'throwErrors', false) -- allows shader errors not crash game

	initMap('modchartShaders')
	addHaxeLibrary("Reflect")
	addHaxeLibrary("Type")
	addCoolUtil()
	if stringStartsWith(version, "0.7") then
		addHaxeLibrary("LuaUtils", "psychlua")
	end

	runHaxeCode([[
		// just multiplier which multiplies a time lol!
		setVar('globalShaderSpeed', 1);

		function resetInstagramFilters(cam) {
			cam.setFilters([]);
		}

		for (camera in FlxG.cameras.list) resetInstagramFilters(camera);
		// just in case if you adding new cameras
		FlxG.cameras.cameraAdded.add(resetInstagramFilters);

		function getCamera(name) {
			if (game.variables.exists(name)) return getVar(name);
			return Reflect.getProperty(game, name);
		}

		function getSprite(name) {
			var obj = game.getLuaObject(name);
			if (obj != null) return obj;
			return Reflect.getProperty(game, name);
		}

		function getFilterFromShader(camera, shader) {
			for (filter in camera._filters)
				if (filter.shader == shader)
					return filter;
		}

		// ye i know i can just use it from lua but man shut yo fuck up
		function getScriptName() {
			if (]]..tostring(stringStartsWith(version, "0.7"))..[[)
				return parentLua.scriptName;
			else
				return "]]..scriptName..[[";
		}

		var indexLua = 0;
		// i wanna kill someone with this new "cool" for cycle
		for (i in CoolUtil.numberArray(game.luaArray.length, 0)) {
			if (game.luaArray[i].scriptName == getScriptName())
				indexLua = i;
		}

		function runtimeShaders() {
			if (]]..tostring(stringStartsWith(version, "0.7"))..[[)
				return Reflect.getProperty(game.luaArray[indexLua], 'runtimeShaders');
			else
				return Reflect.getProperty(game, 'runtimeShaders');
		}

		function getEase(ease) {
			if (]]..tostring(stringStartsWith(version, "0.7"))..[[)
				return LuaUtils.getTweenEaseByString(ease);
			else
				return game.luaArray[0].getFlxEaseByString(ease);
		}
	]])

	initialized = true
	return initialized
end

function addShadersOnCamera(camera, shadersTable)
	if not initialized then return nil end
	for i, shader in ipairs(shadersTable) do
		addShaderOnCamera(camera, shader)
	end
end
function addShaderOnCamera(camera, shader)
	if not initialized then return nil end
	addToModchartShaders(shader)
	if cameraShaders[camera] == nil then cameraShaders[camera] = {} end
	table.insert(cameraShaders[camera], shader)
	runHaxeCode([[
		var camera = getCamera("]]..camera..[[");
		var shader = getVar('modchartShaders').get("]]..shader..[[");
		if (camera != null && shader != null) camera._filters.push(new ShaderFilter(shader));
	]])
end

function addShaderOnSprite(sprite, shader)
	if not initialized then return nil end
	addToModchartShaders(shader)
	runHaxeCode([[
		var sprite = getSprite("]]..sprite..[[");
		var shader = getVar('modchartShaders').get("]]..shader..[[");
		if (sprite != null && shader != null) sprite.shader = shader;
	]])
end

function addShadersOnSprite(sprite, shaders)
	if not initialized then return nil end
	for lol=1, #shaders do
		addShaderOnSprite(sprite, shaders[lol])
	end
end

function removeShadersOnCamera(camera, shadersTable)
	if not initialized then return nil end
	for i, shader in ipairs(shadersTable) do
		removeShaderOnCamera(camera, shader)
	end
end
function removeShaderOnCamera(camera, shader)
	if not initialized then return nil end
	addToModchartShaders(shader)
	if cameraShaders[camera] == nil then cameraShaders[camera] = {} end
	local index = tablefind(cameraShaders[camera], shader)
	if index ~= nil then
		table.remove(cameraShaders[camera], index)
		runHaxeCode([[
			var camera = getCamera("]]..camera..[[");
			var shader = getVar('modchartShaders').get("]]..shader..[[");
			if (camera != null && shader != null) camera._filters.remove(getFilterFromShader(camera, shader));
		]])
	end
end

function removeShaderOnSprite(sprite)
	if not initialized then return nil end
	runHaxeCode([[
		var sprite = getSprite("]]..sprite..[[");
		if (sprite != null) sprite.shader = null;
	]])
end

function setShaderValue(shader, name, value)
	if not initialized then return nil end
	local isSampler = type(value) == "string"
	value = {value}
	runHaxeCode([[
		var value = [ ]]..makeArrayFromTable(value)..[[ ];
		var shader = getVar('modchartShaders').get("]]..shader..[[");
		if (shader != null) if (shader.data.]]..name..[[ != null) {
			if (]]..tostring(isSampler)..[[)
				shader.data.]]..name..[[.input = Paths.image(value[0]).bitmap;
			else
				shader.data.]]..name..[[.value = value;
		}
	]])
end

function getShaderValue(shader, name)
	if not initialized then return nil end
	return runHaxeCode([[
		function idiot() {
			var shader = getVar('modchartShaders').get("]]..shader..[[");
			if (shader != null) if (shader.data.]]..name..[[ != null) if (shader.data.]]..name..[[.value != null) {
				if (shader.data.]]..name..[[.value.length == 1) return shader.data.]]..name..[[.value[0];
				return shader.data.]]..name..[[.value;
			}
		}
	]], nil, "idiot")
end

function setGlobalShaderSpeed(value)
	if not initialized then return nil end
	setProperty('globalShaderSpeed', value)
end

function doTweenShaderValue(tag, shader, name, value, duration, ease)
	if not initialized then return nil end
	ease = ease or ""
	runHaxeCode([[
		var shader = getVar('modchartShaders').get("]]..shader..[[");
		if (shader.data.]]..name..[[ == null) return;
		if (shader.data.]]..name..[[.value == null) shader.data.]]..name..[[.value = [0];
		game.modchartTweens.set("]]..tag..[[", FlxTween.num(shader.data.]]..name..[[.value[0], ]]..value..[[, ]]..duration..[[ / game.playbackRate, {
			ease: getEase("]]..ease..[["),
			onComplete: twn -> {
				game.modchartTweens.remove("]]..tag..[[");
				game.callOnLuas("onTweenCompleted", ["]]..tag..[[", "]]..name..[["]);
			}
		},
		num -> {
			shader.data.]]..name..[[.value = [num];
		}));
	]])
end

function startTweenShaderValue(tag, shader, name, value, duration, options)
	if not initialized then return nil end
	if options == nil then options = {} end
	options.onUpdate = options.onUpdate or ""
	options.onStart = options.onStart or ""
	options.onComplete = options.onComplete or ""
	local strToNum = {
		["oneshot"] = 8,
		["persist"] = 1,
		["looping"] = 2,
		["pingpong"] = 4,
		["backward"] = 16
	}
	options.type = options.type or "oneshot"
	options.type = strToNum[string.lower(options.type)]
	options.ease = options.ease or ""
	options.startDelay = options.startDelay or 0
	options.loopDelay = options.loopDelay or 0
	runHaxeCode([[
		var shader = getVar('modchartShaders').get("]]..shader..[[");
		if (shader.data.]]..name..[[ == null) return;
		if (shader.data.]]..name..[[.value == null) shader.data.]]..name..[[.value = [0];
		game.modchartTweens.set("]]..tag..[[", FlxTween.num(shader.data.]]..name..[[.value[0], ]]..value..[[, ]]..duration..[[ / game.playbackRate, {
			type: ]]..options.type..[[,
			ease: getEase("]]..options.ease..[["),
			startDelay: ]]..options.startDelay..[[,
			loopDelay: ]]..options.loopDelay..[[,

			onUpdate: twn -> {
				if ("]]..options.onUpdate..[[".length > 0) game.callOnLuas("]]..options.onUpdate..[[", ["]]..tag..[[", "]]..name..[["]);
			},
			onStart: twn -> {
				if ("]]..options.onStart..[[".length > 0) game.callOnLuas("]]..options.onStart..[[", ["]]..tag..[[", "]]..name..[["]);
			},
			onComplete: twn -> {
				if ("]]..options.onComplete..[[".length > 0) game.callOnLuas("]]..options.onComplete..[[", ["]]..tag..[[", "]]..name..[["]);
				if (twn.type == 8 || twn.type == 16) game.modchartTweens.remove("]]..tag..[[");
			}
		},
		num -> {
			shader.data.]]..name..[[.value = [num];
		}));
	]])
end

function addShadersToAllCameras(shadersTable)
	addShadersOnCamera("camGame",  shadersTable)
	addShadersOnCamera("camHUD",   shadersTable)
	addShadersOnCamera("camOther", shadersTable)
end

function onUpdatePost(elapsed)
	if not initialized then return nil end
	time = time + (elapsed * getProperty('globalShaderSpeed'))
	runHaxeCode("for (shader in getVar('modchartShaders')) if (shader.data.iTime != null) shader.data.iTime.value = ["..time.."];")
end

function onDestroy()
	if not initialized then return nil end
	runHaxeCode("FlxG.cameras.cameraAdded.remove(resetInstagramFilters);")
	setPropertyFromClass('lime.utils.Log', 'throwErrors', true) -- return to default
end

-- just utility below

function addToModchartShaders(name)
	if not initialized then return nil end
	runHaxeCode([[
		var arr = runtimeShaders().get("]]..name..[[");
		var shader = new FlxRuntimeShader(arr[0], arr[1]);
		if (!getVar('modchartShaders').exists("]]..name..[[")) getVar('modchartShaders').set("]]..name..[[", shader);
	]])
end

function addCoolUtil()
	if stringStartsWith(version, "0.7") then
		addHaxeLibrary("CoolUtil", "backend")
	else
		addHaxeLibrary("CoolUtil")
	end
end

function makeArrayFromTable(table_)
	for i = 1, #table_ do table_[i] = string.gsub(table_[i], '"', [[\"]]) end
	return '"'..table.concat(table_, '","')..'"'
end

function initMap(varName)
	runHaxeCode([[
		if (!game.variables.exists(']]..varName..[[')) {
			setVar(']]..varName..[[', ['d' => null]);
			getVar(']]..varName..[[').remove('d');
		}
	]])
end
function tablefind(tab,el)
	for index, value in pairs(tab) do
		if value == el then
			return index
		end
	end
	return nil
end