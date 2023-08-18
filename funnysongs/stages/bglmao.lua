function onCreate()

	makeAnimatedLuaSprite('animate','bglmao',100, 100)addAnimationByPrefix('animate','bglmao','bglmao',12,true)
        objectPlayAnimation('animate','bglmao',false)
        setScrollFactor('animate', 0.9, 0.9);

        addLuaSprite('animate', false);
end