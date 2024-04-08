function onCreatePost()
	makeLuaText('lyric', (value1), 1250, 0, 480)
	setTextAlignment('lyric', 'Center')
	addLuaText('lyric')
	setTextSize('lyric', 28)
end
function onEvent(name, value1, value2)
	if name == 'lyrics' then
		setTextString('lyric', (value1));
		if value2 == '' then
		    --do nothing lol
		else
		setTextColor('lyric', (value2))
		end
	end
end