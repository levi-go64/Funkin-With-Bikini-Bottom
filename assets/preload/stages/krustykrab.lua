function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sponge dead')
	-- background shit
	makeLuaSprite('bg', 'KK/bg1', -230, -400);
    addLuaSprite('bg',false);

	makeLuaSprite('bg2', 'KK/bg2', -230, -400);
    addLuaSprite('bg2',false);

	--color shit
	makeLuaSprite('bgc1', 'KK/bgcolor1',-230, -400);
    addLuaSprite('bgc1',false);
	makeLuaSprite('bgc2', 'KK/bgcolor2', -218, -400);
    addLuaSprite('bgc2',false);
	makeLuaSprite('bgc3', 'KK/bgcolor4', -230, -400);
    addLuaSprite('bgc3',false);
	makeLuaSprite('bgc4', 'KK/bgcolor3',-212, -400);
    addLuaSprite('bgc4',false);
		-- crowds shit
		makeAnimatedLuaSprite('patrick', 'characters/PatLegs', 1030, 120);
		makeAnimatedLuaSprite('crowd', 'KK/crowd', -220, 440);
		makeAnimatedLuaSprite('squid', 'KK/squid', 990, 370);
		makeAnimatedLuaSprite('windy', 'KK/windy', 1270, 550);
		makeAnimatedLuaSprite('zri', 'KK/zright', 1950, 590);
		makeAnimatedLuaSprite('zle', 'KK/zleft', -250, 540);
	
		addLuaSprite('patrick',false)
		addLuaSprite('crowd',false)
		addLuaSprite('squid',false)
		addLuaSprite('windy',false)
		addLuaSprite('zri',true)
		addLuaSprite('zle',true)
	
	-- props
	makeLuaSprite('crab', 'KK/FrozenKrabs', 1700, 	500);
    addLuaSprite('crab',false);
	makeLuaSprite('table1', 'KK/t1', -230, -400);
    addLuaSprite('table1',false);
	makeLuaSprite('table2', 'KK/t2', -230, -400);
    addLuaSprite('table2',false);
	makeLuaSprite('stable1', 'KK/ta1', -230, -400);
    addLuaSprite('stable1',false);
	makeLuaSprite('stable2', 'KK/ta2', -230, -400);
    addLuaSprite('stable2',false);
    -- crowds anim shit
	addAnimationByIndices('patrick', 'bop left', 'PatLegs Idle','30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
	addAnimationByIndices('patrick', 'bop right', 'PatLegs Idle','15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24)
	addAnimationByPrefix('crowd', 'bop', 'crowd bop', 12, false)
	addAnimationByPrefix('squid', 'bop', 'squid bop', 12, false)
	addAnimationByPrefix('windy', 'bop', 'windy bop', 12, false)
	addAnimationByPrefix('zri', 'bop', 'zright bop', 12, false)
	addAnimationByPrefix('zle', 'bop', 'zleft bop', 12, false)
---- scaleshit
scaleObject('crab',0.8,0.8)
scaleObject('patrick',0.7,0.7)

---properties shit
setProperty('bg2.visible',false)
setProperty('bgc1.alpha',0)
setProperty('bgc2.alpha',0)
setProperty('bgc3.alpha',0)
setProperty('bgc4.alpha',0)
setProperty('table2.visible',false)
setProperty('stable2.visible',false)
makeLuaSprite('redy','',-230,-400)
		makeGraphic('redy', 5000, 5000, '000000')
		addLuaSprite('redy',true)
		setObjectCamera('redy','camGame')
		setBlendMode('redy','shader')
		setScrollFactor('redy',1,1)
		setProperty('redy.alpha',0.5)
		setObjectOrder('redy',getObjectOrder('boyfriend')+28)
		setProperty('redy.visible',false)

end
local colored = false
local valzo = 1.2
local valti = 0.5
function onCreatePost()
setProperty('gf.visible',false)
end
function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('patrick','bop left',true)
	end
	if curBeat % 2 == 0 then
		objectPlayAnimation('patrick','bop right',true)
objectPlayAnimation('crowd','bop',true)
objectPlayAnimation('squid','bop',true)
objectPlayAnimation('windy','bop',true)
objectPlayAnimation('zle','bop',true)
objectPlayAnimation('zri','bop',true)
	end
end
local keepbf = false
local cammove = true
local keepfollowbf = false
function onUpdate()
	if keepbf then
		setProperty('boyfriend.y',-100)
	end
	if keepfollowbf then
		cameraSetTarget('boyfriend')
	end
	if cammove then
	if mustHitSection then
		doTweenZoom('zzz', 'camGame', valzo, valti, "linear")
	else
		doTweenZoom('zzz', 'camGame', 0.4, 0.5, "linear")
	end
end
end
function onTweenCompleted(t)
	if t == 'bfwo' then
		keepbf = true
		triggerEvent('Change Character','ggspongebob','ggspongebob2')
		runTimer('woosh',0.3)
	end
	if name == 'camz' then
		setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
    end
end
function onTimerCompleted(t)
	if t == 'woosh' then
		doTweenZoom('camz','camGame',0.6,1,'circOut')
		keepfollowbf = false
	end
end
function onStepHit()
	if curStep == 1231 then
	cammove = false
	doTweenAlpha('hudgone','camHUD',0,1,'easeOut')
	end
	if curStep == 1295 then 
		doTweenAlpha('hudgone','camHUD',1,1,'easeOut')
	end
	if curStep == 1300 then
		colored = true
		setProperty('redy.visible',true)
		setProperty('bg2.visible',true)
		setProperty('bg.visible',false)
        setProperty('table2.visible',true)
        setProperty('stable2.visible',true)
        setProperty('stable.visible',false)
        setProperty('table.visible',false)
		cameraFlash('other', 'FFFFFF', 0.4, false)
		setPropertyFromClass('GameOverSubstate', 'characterName', 'gg sponge dead')
	end
	if curStep == 1323 then
		keepfollowbf = true
		doTweenY('bfwo','boyfriend',-90,2.5,'circIn')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if colored == true then
	if not isSustainNote then
		if direction == 0 then
			doTweenAlpha('wooohoo','bgc1',0,1,'easeOut')
			setProperty('bgc1.alpha',1)
			setProperty('bgc2.alpha',0)
			setProperty('bgc3.alpha',0)
			setProperty('bgc4.alpha',0)		
		elseif direction == 1 then
			doTweenAlpha('wooohoo','bgc2',0,1,'easeOut')
			setProperty('bgc1.alpha',0)
			setProperty('bgc2.alpha',1)
			setProperty('bgc3.alpha',0)
			setProperty('bgc4.alpha',0)
		elseif direction == 2 then
			doTweenAlpha('wooohoo','bgc3',0,1,'easeOut')
			setProperty('bgc1.alpha',0)
			setProperty('bgc2.alpha',0)
			setProperty('bgc3.alpha',1)
			setProperty('bgc4.alpha',0)
		elseif direction == 3 then
			doTweenAlpha('wooohoo','bgc4',0,1,'easeOut')
			setProperty('bgc1.alpha',0)
			setProperty('bgc2.alpha',0)
			setProperty('bgc3.alpha',0)
			setProperty('bgc4.alpha',1)
		end
	end
    end
end