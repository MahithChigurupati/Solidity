from PIL import Image

group1 = [
    r'/Users/mahith/Desktop/NFT/square/green-square.png',
    r'/Users/mahith/Desktop/NFT/square/brown-square.png',
    r'/Users/mahith/Desktop/NFT/square/grey-square.png'
]

group2 = [
    r'/Users/mahith/Desktop/NFT/circle/red-circle.png',
    r'/Users/mahith/Desktop/NFT/circle/blue-circle.png',
    r'/Users/mahith/Desktop/NFT/circle/green-circle.png'
]

group3 = [
    r'/Users/mahith/Desktop/NFT/triangle/grey-triangle.png',
    r'/Users/mahith/Desktop/NFT/triangle/blue-triangle.png',
    r'/Users/mahith/Desktop/NFT/triangle/red-triangle.png'
]

counter = 0


def createImage(a, b, c, counter):
    image01 = Image.open(group1[a]).convert("RGBA")
    image02 = Image.open(group2[b]).convert("RGBA")
    image03 = Image.open(group3[c]).convert("RGBA")

    intermediate = Image.alpha_composite(image01, image02)
    intermediate2 = Image.alpha_composite(intermediate, image03)
    name = "/Users/mahith/Desktop/NFT/done/" + str(counter) + ".png"
    intermediate2.save(name)


for x in range(3):
    for y in range(3):
        for z in range(3):

            createImage(x, y, z, counter)
            counter += 1