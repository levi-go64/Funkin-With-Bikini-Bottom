function onCreate()
	-- background shit
	makeLuaSprite('bg', 'stagejoke/joke', -150, -180);
        scaleObject('bg',1.2,1.2)
        addLuaSprite('bg',false);
		setPropertyFromClass('GameOverSubstate', 'characterName', 'sping dead')
end

function onCreatePost()
	setProperty('gf.visible',false)
end
