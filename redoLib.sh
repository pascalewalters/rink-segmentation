if [ "$1" == "a" ]; then
    # cp segmentCircle.java segmentCircles/for_testing/
    cd segmentCircles/for_testing/
    javac -cp "/usr/local/MATLAB/MATLAB_Runtime/v96/toolbox/javabuilder/jar/javabuilder.jar":./segmentCircles.jar ./segmentCircle.java
    java -cp .:"/usr/local/MATLAB/MATLAB_Runtime/v96/toolbox/javabuilder/jar/javabuilder.jar":./segmentCircles.jar segCircles /home/pbwalter/Documents/javaSegmentation/img/inputFrames/frame38791.jpg /home/pbwalter/Documents/javaSegmentation/img/homographyOutput/circles_maskframe38791.jpg

else
    cp segmentCircles/for_testing/segmentCircle.java .
    rm -rf segmentCircles.prj
    rm -rf segmentCircles/
fi

