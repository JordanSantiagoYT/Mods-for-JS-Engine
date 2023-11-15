function onCreate()
	-- background shit
	makeAnimatedLuaSprite('bg1', 'bg1', -1000, -700)
	scaleObject('bg1', 8, 8)
	setLuaSpriteScrollFactor('bg1', 0.9, 0.9);
	addAnimationByPrefix('bg1', 'bg1', 'bg1', 10, true)
	objectPlayAnimation('bg1', 'bg1', true)

	makeAnimatedLuaSprite('bg2', 'bg2', -1000, -700)
	scaleObject('bg2', 8, 8)
	setLuaSpriteScrollFactor('bg2', 0.7, 0.7);
	addAnimationByPrefix('bg2', 'bg2', 'bg2', 10, true)
	objectPlayAnimation('bg2', 'bg2', true)

	makeLuaSprite('bg3', 'bg3', -1000, -700)
	scaleObject('bg3', 8, 8)
	setLuaSpriteScrollFactor('bg3', 0.5, 0.5);

	makeLuaSprite('bg4', 'bg4', -1000, -700)
	scaleObject('bg4', 8, 8)
	setLuaSpriteScrollFactor('bg4', 0.3, 0.3);

	makeLuaSprite('bg5', 'bg5', -1000, -700)
	scaleObject('bg5', 8, 8)
	setLuaSpriteScrollFactor('bg5', 0.2, 0.2);

	makeAnimatedLuaSprite('objects', 'objects', -1000, -700)
	scaleObject('objects', 8, 8);
	addAnimationByPrefix('objects', 'objects', 'objects', 22, true)
	objectPlayAnimation('objects', 'objects', true)
	
	makeLuaSprite('GHGround', 'GHGround', -1000, -700)
	scaleObject('GHGround', 8, 8)

	makeAnimatedLuaSprite('flowers', 'flowers', -1000, -700)
	scaleObject('flowers', 8, 8);
	addAnimationByPrefix('flowers', 'flowerloop', 'flowerloop', 10, true)
	objectPlayAnimation('flowers', 'flowerloop', true)
	
	addLuaSprite('bg1', false)
	setProperty('bg1.antialiasing',false)
	addLuaSprite('bg2', false)
	setProperty('bg2.antialiasing',false)
	addLuaSprite('bg3', false)
	setProperty('bg3.antialiasing',false)
	addLuaSprite('bg5', false)
	setProperty('bg5.antialiasing',false)
	addLuaSprite('bg4', false)
	setProperty('bg4.antialiasing',false)
	addLuaSprite('objects', false)
	setProperty('objects.antialiasing',false)
	addLuaSprite('GHGround', false)
	setProperty('GHGround.antialiasing',false)
	addLuaSprite('flowers', false)
	setProperty('flowers.antialiasing',false)
end

function onCreatePost()

	setProperty('gf.visible',false)
end