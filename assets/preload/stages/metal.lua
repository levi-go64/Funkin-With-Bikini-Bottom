function onCreate()
	-- background shit
	makeLuaSprite('bg', 'robosquid/bg1', -0, -0);
    addLuaSprite('bg',false);
	makeLuaSprite('bg2', 'robosquid/bg3', -0, -0);
    addLuaSprite('bg2',true);
	makeLuaSprite('platform', 'robosquid/platform', -0, -0);
    addLuaSprite('platform',false);
	makeLuaSprite('grad', 'robosquid/gradient', -0, -0);
    addLuaSprite('grad',true);
	setBlendMode('grad','add')

	scaleObject('bg',1.6,1.6)
	scaleObject('bg2',1.6,1.6)
	scaleObject('platform',1.6,1.6)
	scaleObject('grad',1.6,1.6)
end

function onCreatePost()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'fish bf dead')
	setProperty('gf.visible',false)
	setObjectOrder('platform',getObjectOrder('bg2')-3)
end
function onUpdatePost()

end