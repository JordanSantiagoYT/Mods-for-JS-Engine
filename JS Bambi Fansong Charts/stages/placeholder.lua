

function onCreate()
	-- background shit
	makeLuaSprite('bg', 'placeholder/Void', -600, -200);
	setLuaSpriteScrollFactor('bg', 0, 0);
	scaleObject('bg', 3, 3)
	addGlitchEffect('bg', 2.25, 5, 0.1)
	addLuaSprite('bg', false);
   makeLuaSprite('room', 'placeholder/BG', -600, -1000);
	setLuaSpriteScrollFactor('room', 0.2, 0.2);
	scaleObject('room', 3.1, 3.1)
   addLuaSprite('room', false);
   makeLuaSprite('floor', 'placeholder/Floor', -800, -1000);
	setLuaSpriteScrollFactor('floor', 1, 1);
	scaleObject('floor', 3.7, 3.7)
	addLuaSprite('floor', false);
   makeLuaSprite('table', 'placeholder/Table', -800, -800);
	setLuaSpriteScrollFactor('table', 1, 1);
	scaleObject('table', 3, 3)
	addLuaSprite('table', false);
end
