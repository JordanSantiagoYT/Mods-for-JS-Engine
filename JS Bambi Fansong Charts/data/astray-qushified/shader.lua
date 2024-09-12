function onCreatePost ()
	addChromaticAbberationEffect ('camhud', 0.003)
	addChromaticAbberationEffect ('camgame', 0.003)
	addVCREffect('camgame')
	addBloomEffect ('camhud', 0.003)
	addBloomEffect ('camgame', 0.003)
	addGrayscaleEffect('camHUD');
	addGrayscaleEffect('camGame');
end