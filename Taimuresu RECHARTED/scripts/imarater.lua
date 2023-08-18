--oh yeah i stole this script from vs 900n1 lmao
-- {percent - 0 to 100, ratingname}
ratingNames = {
	{100, "how are you pfcing this it isnt even possible what the fuck"},
	{94, "lmao you failed the pfc"},
	{90, "great"},
	{85, "whoops"},
	{80, "is that all you got"},
	{75, "missing"},
	{70, "bad"},
	{69, "FUNNY NUMBER"},
	{65, "mad cuz bad"},
	{60, "losing"},
	{50, "you're bad"},
	{40, ":skull:"},
	{30, "guh?!!?!!?!"},
	{20, "oh no"},
	{15, "death"},
	{10, "what are you playing that has your accuracy this low"},
	{5, "how are you still alive"},
	{0, "PLAY A DIFFERENT SONG PLEASE"},
}

function updateRating() -- backwards compatibility
	local percent, str = tonumber(rating or getProperty("ratingPercent")) * 100, ""
	
	local v
	for i = #ratingNames, 1, -1 do
		v = ratingNames[i]
		if (percent >= v[1]) then
			str = v[2]
		else
			break
		end
	end
	setRatingName(str)
end

function onUpdate()
	updateRating()
end
