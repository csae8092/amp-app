import os, glob
from PIL import Image

savepath = "./data/images/update/"
os.mkdir(savepath)
files = glob.glob("./data/images/new/*.tif")

for infile in sorted(files):
    f, e = os.path.splitext(infile)
    outfile = f + ".jpg"
    outfile = outfile.split("/")[-1]
    outfile = f"{savepath}{outfile}"
    
    print(outfile)
    if infile != outfile:
        try:
            with Image.open(infile) as im:
                im.save(outfile, "JPEG", quality=80)
            # os.remove(infile)
        except OSError:
            print("cannot convert", infile)
