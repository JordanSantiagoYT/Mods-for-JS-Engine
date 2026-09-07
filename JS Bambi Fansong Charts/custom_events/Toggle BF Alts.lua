bfAlting = false
function onEvent(name,value1,value2)
    if name == "Toggle BF Alts" then
	if #value1 > 0 then
		doAltBF(true)
	elseif #value2 > 0 then
		doAltBF(false)
	end
    end
    if name == "Change Character" then
	bfAlting = (boyfriendName == 'bf-altAnim')
    end
end

function doAltBF(enabled)
	if enabled then
		if boyfriendName == 'bf-altAnim' then return end

		if not boyfriendName == 'bf' then
			changeBF(false)
		end
		triggerEvent('Play Animation', 'transition', 'bf')
		runTimer('bfTransition', 0.25)
	else
		if boyfriendName == 'bf' then return end

		if not boyfriendName == 'bf-altAnim' then
			changeBF(true)
		end
		triggerEvent('Play Animation', 'transitionReverse', 'bf')
		runTimer('bfTransition', 0.25)
	end
end

function onTimerCompleted(tag)
	if tag == 'bfTransition' then
		bfAlting = not bfAlting
		changeBF(bfAlting)
	end
end

function changeBF(enabled)
	cancelTimer('bfTransition')
	triggerEvent('Change Character', 'bf', (enabled and 'bf-altAnim' or 'bf'))
end