local timeshit = 0;
function onUpdate()
 doTweenY('opponentFloatshit', 'dad', (math.sin(timeshit*1)*180), 0.001, 'linear')
 timeshit = timeshit+0.01
	if not mustHitSection then
		cameraSetTarget('dad')
	end
 end