rescalepx() {
    ID=$( basename "$@"  | cut -d '.' -f 1)
    convert -resize 64x64\> -extent 64x64\> -limit thread 1 -gravity center -background black "$@" ./datasets/done/$ID.jpg
}
export -f rescalepx
find_images() {
    find datasets/danbooru/ -type f -iname "*.jp*g" -or -iname "*.png"
}
export -f find_images
find_images | parallel -j6 --progress --no-notice --joblog=./resize_log.txt rescalepx