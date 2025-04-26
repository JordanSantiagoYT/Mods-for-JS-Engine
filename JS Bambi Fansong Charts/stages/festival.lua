function onCreate()
  addAnim = addAnimationByPrefix
  
  makeSpr('sky', 'sky_festival', -600, -230, false)
  setScrollFactor('sky', 0.6, 0.6)
  add('sky')
  
  makeSpr('flatGrass', 'gm_flatgrass', 800, -100)
  setScrollFactor('flatGrass', 0.7, 0.7)
  add('flatGrass')
  
  makeSpr('farmHouse', 'farmHouse', -300, -150)
  setScrollFactor('farmHouse', 0.7, 0.7)
  add('farmHouse')
  
  makeSpr('hills', 'hills', -1000, -100)
  setScrollFactor('hills', 0.7, 0.7)
  add('hills')
  
  makeSpr('corn', 'corn', -1000, 120, true)
  addAnim('corn', 'idle', 'idle', 5)
  setScrollFactor('corn', 0.85, 0.85)
  playAnim('corn', 'idle')
  add('corn')
  
  makeSpr('cornGlow', 'cornGlow', -1000, 120)
  addAnim('cornGlow', 'idle', 'idle', 5)
  setScrollFactor('cornGlow', 0.85, 0.85)
  playAnim('cornGlow', 'idle')
  add('cornGlow')
  
  makeSpr('backGrass', 'backGrass', -1000, 475)
  setScrollFactor('backGrass', 0.85, 0.85)
  add('backGrass')
  
  makeSpr('frontGrass', 'frontGrass', -1300, 600)
  add('frontGrass')
  
  makeSpr('stageGlow', 'generalGlow', -450, 300, true)
  setScrollFactor('stageGlow', 0, 0)
  addAnim('stageGlow', 'glow', 'idle', 5)
  setBlendMode('stageGlow', 'add')
  playAnim('stageGlow', 'glow')
  add('stageGlow')
end
function setPos(w, x, y)
  setProperty(w..'.x', x)
  setProperty(w..'.y', y)
end
function makeSpr(name, image, x, y, animated, fasd)
  local path = 'festival/'..image
  if fasd then path = image end
  local spritething = makeLuaSprite
  if animated then spritething = makeAnimatedLuaSprite end
  spritething(name, path, x, y)
end
function add(tag)
  addLuaSprite(tag)
end