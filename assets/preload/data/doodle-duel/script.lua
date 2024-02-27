holdTimer = -1.0;
singDuration = 4;
specialAnim = false;

characterAnimationsList = {};

characterAnimationsList[0] = 'idle' -- idle
characterAnimationsList[1] = 'singLEFT' -- left
characterAnimationsList[2] = 'singDOWN' -- down
characterAnimationsList[3] = 'singUP' -- up
characterAnimationsList[4] = 'singRIGHT' -- right

player3 = 'doodlebf'
directions = {'left', 'down', 'up', 'right'}

function onCreate() -- change this part for your character image (and the animation prefixes too) (you're also gonna need to make your own offset values)
	--- Caching the character into the memory ---
	makeAnimatedLuaSprite(player3, 'characters/DoodleBF', -110, 520);

	--- Setting up Character Animations ---
	addAnimationByPrefix(player3, 'idle', 'DoodleBF idle', 16, false);
	addOffset(player3, 'idle', -0, -0)

	addAnimationByPrefix(player3, 'singLEFT', 'DoodleBF left', 24, false);
	addOffset(player3, 'singLEFT', -0, -0)

	addAnimationByPrefix(player3, 'singDOWN', 'DoodleBF down', 24, false);
	addOffset(player3, 'singDOWN', -0, -0)

	addAnimationByPrefix(player3, 'singUP', 'DoodleBF up', 24, false);
	addOffset(player3, 'singUP', -0, -0)

	addAnimationByPrefix(player3, 'singRIGHT', 'DoodleBF right', 24, false);
	addOffset(player3, 'singRIGHT', -0, -0)

	addAnimationByPrefix(player3, 'wop', 'DoodleBF pop', 24, false);
	addOffset(player3, 'singRIGHT', -0, -0)
end

function onCreatePost()
	setProperty(player3..'.flipX', false) -- remove this for other characters, this flips their x position
	addLuaSprite(player3, true);
	setProperty(player3..'.alpha',0)
	scaleObject(player3,1.1,1.1)
end
local allowbop = false
function onBeatHit()
	if allowbop then
	if curBeat % 2 == 0 and holdTimer < 0 and not (getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing') then
		characterPlayAnimation(0, true)
	end
end
end
function onStepHit()
	if curStep == 770 then
		allowbop = true
	end
end
function onCountdownTick(count)
	if count % 2 == 0 then
		characterPlayAnimation(0, false)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'doodle bf' then
		characterPlayAnimation(noteData + 1, true)
	end
end
function characterPlayAnimation(animId, forced) -- thank you shadowmario :imp:
	-- 0 = idle
	-- 1 = left
	-- 2 = down
	-- 3 = up
	-- 4 = right

	specialAnim = false;

	local animName = characterAnimationsList[animId]
	playAnim(player3, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)

	if animId > 0 then 
		specialAnim = true ;
		holdTimer = 0;
	end
end
function onUpdate(elapsed)
	holdCap = stepCrochet * 0.0011 * singDuration;
	if holdTimer >= 0 then
		holdTimer = holdTimer + elapsed;
		if holdTimer >= holdCap and getProperty(player3..".animation.curAnim.name"):sub(1,4) == 'sing' then
			characterPlayAnimation(0, false)
			holdTimer = -1;
		end
	end

	if getProperty(player3..".animation.curAnim.finished") and specialAnim then
		specialAnim = false;
	end
end