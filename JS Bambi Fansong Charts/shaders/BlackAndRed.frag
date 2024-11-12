#pragma header
//so um, this was taken from a psych port of vs impostor v4 but the link doesnt exist anymore. this is the black and white shader but edited so that the white color is red.

		uniform bool invert;
		uniform float lowerBound;
		uniform float upperBound;

		void main()
		{
			vec4 textureColor = texture2D(bitmap, openfl_TextureCoordv);

			float gray = 0.21 * textureColor.r + 0.71 * textureColor.g + 0.07 * textureColor.b;

			float outColor = 0;

			if(gray > upperBound){
				outColor = 1;
			}
			else if(!(gray < lowerBound) && (upperBound - lowerBound) != 0){
				outColor = (gray - lowerBound) / (upperBound - lowerBound);
			}

			if(invert){
				outColor = (1 - outColor) * textureColor.a;
			}

			gl_FragColor = vec4(outColor, 0, 0, textureColor.a);
		}