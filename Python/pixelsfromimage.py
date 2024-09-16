#pixels from image
#written in python by max barkouras

import math
from PIL import Image
from print_color import print

global colorChart

def closestColor(rgbValue):
    colorChart = {
        "red": (255, 0, 0),
        "green": (0, 255, 0),
        "blue": (0, 0, 255),
        "yellow": (255, 255, 0),
        "cyan": (0, 255, 255),
        "magenta": (255, 0, 255),
        "grey": (0, 0, 0),
        "white": (255, 255, 255),
    }

    closeResult = None
    closenessRating = float('inf')
    
    for color, value in colorChart.items():
        distance = math.sqrt(
            (rgbValue[0] - value[0]) ** 2 +
            (rgbValue[1] - value[1]) ** 2 +
            (rgbValue[2] - value[2]) ** 2
        )
        
        if distance < closenessRating:
            closenessRating = distance
            closeResult = color
    return closeResult

def main():

    imageToGrab = input("Please put filepath to image: ")

    with Image.open(imageToGrab, 'r') as pic:
        loadedImage = pic.load()
        imageSize = pic.size

        for i in range(8):
            x=i+1
            print(loadedImage[1,x])

        printImage = input("Would you like to print the image using ascii (y/n): ")
        
        if printImage == "y":
            scaleHieght = int(((imageSize[0])/48)+.5)
            scaleWidth = int(((imageSize[1])/200)+.5)
            finishedHieght = 1
            finishedWidth = 1

            while finishedHieght < imageSize[1]:
                while finishedWidth < imageSize[0]:
                    getColor = closestColor(loadedImage[finishedWidth,finishedHieght])
                    print("@", end='', color=getColor)
                    finishedWidth+=scaleWidth
                print("")
                finishedHieght+=scaleHieght
                finishedWidth = 0
        
        elif printImage == "n":
            pass

if __name__ == '__main__':
    main()





