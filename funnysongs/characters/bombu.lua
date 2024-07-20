elapsedtime = 0.0;
function onUpdate(elapsed)
	elapsedtime = elapsedtime + elapsed;
	doTweenY(dadTweenY, 'dad', 200 - 30 * math.sin(elapsedtime), 0.001);
  end