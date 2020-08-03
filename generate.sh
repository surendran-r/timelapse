cd Front-3mto12s
for i in `ls *`; 
do 
	echo "======================="$i"==========================="; 
	#Name of suffix of the timelapse mp4 will be the timestamp of the original video
	#timelapseSuffix=`echo $i | cut -d_ -f3`
	timelapseSuffix=`echo $i | cut -d_ -f2 | cut -d. -f1`

	#generate jpg for every 2 seconds
	ffmpeg -i $i -vf fps=4 thumb%04d.jpg

	echo "           +++++++++++"$i"===========================";
	#generate the timelapse mp4 from jpg
	ffmpeg -r 24 -pattern_type glob -i '*.JPG' -i thumb%04d.jpg -s hd1080 -vcodec libx264 tl_$timelapseSuffix.mp4
	
	#remove all the jpg
	rm *.jpg
done;
cd ..