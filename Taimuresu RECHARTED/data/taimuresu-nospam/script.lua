function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.02);
    end
	 triggerEvent('Add Camera Zoom', '0.00175', '0.0035');
  end
