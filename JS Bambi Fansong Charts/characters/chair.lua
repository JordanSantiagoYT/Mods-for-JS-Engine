local timeshit = 0;
function onUpdate()
 doTweenY('opponentFloatshit', 'gf', (math.sin(timeshit*1)*180), 0.001, 'linear')
 timeshit = timeshit+0.01
 end