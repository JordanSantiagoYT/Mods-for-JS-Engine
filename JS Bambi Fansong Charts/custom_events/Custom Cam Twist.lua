twistSpeed = 0 --Amount of steps to wait before doing a twist.
twistIntensity = 0
twisted = false
ease = 'circOut'
function onEvent(n,v1,v2)
	luaDebugMode = true
	if n == "Custom Cam Twist" then
		twistSpeed = math.floor((tonumber(v1) or 0) * 4)
		if string.find(v2, ',') then
			val2Split = stringSplit(v2, ',');
			twistIntensity = tonumber(val2Split[1]) or 0
			ease = stringTrim(val2Split[2]) or 'circOut'
		else
			twistIntensity = tonumber(v2) or 0
			ease = 'circOut'
		end
	end
end
function onStepHit()
	if twistSpeed > 0 and twistIntensity > 0 and curStep % twistSpeed == 0 then
		runHaxeCode([[
			for (i in [game.camHUD, game.camGame])
			{
				FlxTween.cancelTweensOf(i);
				i.angle = ]]..twistIntensity * (twisted and -1 or 1)..[[;
				FlxTween.tween(i, {angle: 0}, (15 * ]]..twistSpeed..[[) / Conductor.bpm / game.playbackRate, {ease: FlxEase.]]..ease..[[});
			}
		]])
		twisted = not twisted
	end
end