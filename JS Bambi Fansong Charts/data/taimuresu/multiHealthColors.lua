function onCreatePost()
	doSplitColors()
end

function doSplitColors()
	runHaxeCode([[
		function splitColors(colors:Array<Int>):Array<Int>
		{
			var arr = [];
			var steps = game.healthBarBG.height / colors.length;

			for (col in colors)
				for (i in 0...steps)
					arr.push(col);

			return arr;
		}

		//put your health bar colors here.
		var colorArr = [0xFFa5004d, 0xFF31b0d1];

		//finally, if you want the multi-color to be on the opponent's side, move splitColors to be the first, and switch the getProperty function to grab bf's health color array instead. otherwise, leave it as is.

		game.healthBar.createGradientBar([0xFF]]..rgbToHex(getProperty('dad.healthColorArray'))..[[], splitColors(colorArr), 1, 90);
		game.healthBar.updateBar();
	]])
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onEvent(n)
	if n == 'Change Character' then
		doSplitColors()
	end
end