rescalepx() {
    ID=$( basename "$@"  | cut -d '.' -f 1)
    convert -resize 256x256\> -extent 256x256\> -limit thread 1 -gravity center -background white "$@" ./datasets/bhdanbooru256/$ID.jpg
}
export -f rescalepx
find_images() {
    find datasets/bhdanbooru/ -type f -iname "*.jp*g" -or -iname "*.png"
}
export -f find_images
find_images | parallel -j6 --progress --no-notice --joblog=./resize_log.txt rescalepx