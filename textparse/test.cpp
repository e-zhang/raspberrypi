#include <iostream>

#include <opencv2/opencv.hpp>
#include <tesseract/baseapi.h>

int main()
{
    cv::VideoCapture cap(0);
    if( !cap.isOpened() )
    {
        std::cout << "Failed to open camera" << std::endl;
        return -1;
    }

    cv::Mat frame;
    cap >> frame;

    tesseract::TessBaseAPI tess;
    tess.SetImage((uchar*) frame.data, 
                  frame.size().width,
                  frame.size().height,
                  frame.channels(),
                  frame.step1());

    tess.Recognize(0);
    std::cout << "text detection: " << tess.GetUTF8Text();
}
