function onCreate()
	-- background shit
	makeLuaSprite('bg', 'doodlebg/whatthebg', -340, 50);
        addLuaSprite('bg',false);
        scaleObject('bg',2,2)
	makeAnimatedLuaSprite('smoke','doodlebg/smoke',-130,600)
	addAnimationByPrefix('smoke','smoke','smoke weed',12,true)
addLuaSprite('smoke',true)
scaleObject('smoke',0.8,0.8)
setProperty('smoke.alpha',0)
setPropertyFromClass('GameOverSubstate', 'characterName', 'bf doodle dead')
end

function onCreatePost()
--	setProperty('gf.visible',false)
end

function onStepHit()
	if curStep == 704 then
		doTweenAlpha('smoked','smoke',1,0.5,'linear')
	end
	if curStep == 757 then
		objectPlayAnimation('doodlebf','wop',true)
	end
	if curStep == 760 then
		doTweenAlpha('weed','smoke',0,0.5,'linear')
		doTweenAlpha('wtf','doodlebf',1,0.5,'linear')
	end
end
