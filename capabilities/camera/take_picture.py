#!/usr/bin/python
import argparse
import picamera
from os.path import exists, join
from os import listdir
from fractions import Fraction

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description="Take picture")
	parser.add_argument('--out', '-o', default = '', help = "output directory")
	c = picamera.PiCamera()
	c.resolution = picamera.PiCamera.MAX_RESOLUTION
#	c.exposure = 'night'
#	c.iso = 800
#	c.framerate = Fraction(1,3)
#	c.shutterspeed = 10000000

#	c.exposure_mode = 'off'
	args = parser.parse_args()

	out = args.out
	counter_fnm = join(out, 'counter.txt')
	counter = 0
	if exists(counter_fnm):
		f = open(counter_fnm, 'r')
		counter_str = f.read()
		f.close()
		if counter_str:
			counter = int(counter_str)
	
	img_fnm = join(out, "DSC_{0:04d}.jpg".format(counter) )
	c.capture(img_fnm)
	f = open(counter_fnm, 'w')
	f.write(str(counter))
	f.close()
	print(img_fnm)
	
	
	

	
	
