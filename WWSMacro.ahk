#Singleinstance force
continuo = 0
F1::Reload
F2::
	continuo = 1
	FoundX = 0 GXTHVB
	FoundY = 0
	cont =0
	pixel = 0
	while (continuo=1){
		PixelGetColor, pixel, 1396, 544, RGB
		if pixel != 0x874c45
		while (pixel != 0x874c45)
		{
			click, 1396, 544
			sleep , 100
			Click, 538, 594
			sleep , 200
			PixelGetColor, pixel, 1396, 544, RGB
		}
		cont=0
		Loop, 45
		{
			Click, 819, 80	
		}
		Click, 401, 230
		Click, 701, 281
		Click, 897, 225 
		Click, 1203, 266
		Click, 399, 387
		Click, 683, 412	
		Click, 901, 382
		Click, 1187, 427		
		Click, 410, 498
		Click, 681, 555
		Click, 904, 509
		Click, 1184, 551	
		Click, 393, 660
		Click, 672, 705
		Click, 916, 654
		Click, 1184, 693
		Click, 396, 802
		Click, 675, 817	
		Click, 900, 808
		Click, 1157, 806
		PixelGetColor, pixel, 1396, 544, RGB
		if pixel != 0x874c45
		while (pixel != 0x874c45)
		{
			click, 1396, 544
			sleep , 100
			Click, 538, 594
			sleep , 200
			PixelGetColor, pixel, 1396, 544, RGB
		}
		ImageSearch, FoundX, FoundY, 0,0, 1800, 900, C:\Users\josec\Desktop\WWSImages\Deeds.png
		if (FoundX > 0){
			Click, %FoundX%, %FoundY%
			sleep, 1000
			Click, 1434, 279
			sleep, 100
			Click, 1381, 444
			sleep, 100
			Click, 1381, 444
			sleep, 100
			Click, 1381, 444
			sleep, 100
			Click, 1543, 58
		}
		ImageSearch, FoundX, FoundY, 0,0, 1800, 900, C:\Users\josec\Desktop\WWSImages\Outlaws.png
		if (FoundX > 0){
			Click, %FoundX%, %FoundY%
			sleep, 1000
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 156, 842
			sleep, 100
			Click, 1543, 58
		}
		ImageSearch, FoundX, FoundY, 0,0, 1800, 900, C:\Users\josec\Desktop\WWSImages\Upgrades.png
		if (FoundX > 0){
			Click, %FoundX%, %FoundY%
			sleep, 1000
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1142, 557
			sleep, 100
			Click, 1543, 58
		}
		ImageSearch, FoundX, FoundY, 0,0, 1800, 900, C:\Users\josec\Desktop\WWSImages\Map.png
		if (FoundX > 0){
			Click, %FoundX%, %FoundY%
			Sleep, 1000
			Click, 1261, 74
			Click, 632, 707
			Sleep, 300
			Click, 611, 361
			Sleep, 300
			Click, 611, 361
			Sleep, 300
			Click, 1534, 58
			Sleep, 300
			Click, 1534, 58
		}
	
	}
F4::
	PixelGetColor, pixel, 1396, 544, RGB
	if pixel != 0x874c45
	loop, 15
	{
		click, 1396, 544
		sleep , 300
	}

return
	
	
	
	
	
	
	
	
	
	
	