local hasntDiedYet = true
function onUpdate(elapsed)
	if curStep >= 2036 and hasntDiedYet then
		hasntDiedYet = false
		youAreDead();
	end
end
function youAreDead()
	setProperty('sign.alpha', 0)
	setProperty('thecornbag.alpha', 0)
	setProperty('grasshill.alpha', 0)
	setProperty('fence.alpha', 0)
	setProperty('corn2.alpha', 0)
	setProperty('corn1.alpha', 0)
	setProperty('ground.alpha', 0)
	setProperty('farm.alpha', 0)
	setProperty('hills.alpha', 0)
	setProperty('theBg.alpha', 0)
	setProperty('dad.visible', false)
	setProperty('gf.visible', false)
	setProperty('camHUD.visible', false)
end