# requires drawio desktop and libxml2-utils
set -x
'/mnt/c/Program Files/draw.io/draw.io.exe' --export --format xml --uncompressed -o public/aec3po.xml src/aec3po.drawio
tabs=$(xmllint --xpath "//diagram/@name" public/aec3po.xml | cut -f 2 -d "=" | tr -d '"')
rm public/aec3po.xml
i=0
declare -i i
for tab in $tabs; do
    '/mnt/c/Program Files/draw.io/draw.io.exe' -x -f png -s 2 -p $i -o public/$tab.png src/aec3po.drawio
    i+=1
done
