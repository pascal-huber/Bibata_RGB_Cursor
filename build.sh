#!/bin/bash

# TODO: find out why there are sleeps in the script

show_help(){
  cat <<EOF
Usage: $(basename "$0") [OPTION]
Build the mighty Bibata Cursor Theme.

If only the name is specified, it must match one of the predefined themes.

If a color is specified, then also a name must be provided.

Options:
  -c RGB, --color=RGB   Build cursor theme with this color (e.g. \"#ff00ff\")
  -f, --force           Overwrite if a theme with identical name was already built
  -h, --help            Show this message
  -n NAME, --name=NAME  Build theme with this name

Predefined Themes:
  - Bibata_Arch
  - Bibata_Debian
  - Bibata_Void

Exit Codes:
  0 if everthing is OK,
  1 if dependencies not met,
  2 if incorrect arguments,
  3 if some other error occured
EOF
}

# Check dependencies
if  ! type "inkscape" > /dev/null ; then
  echo "FAIL: inkscape must be installed"
  exit 1
fi
if  ! type "xcursorgen" > /dev/null ; then
  echo "FAIL: xcursorgen must be installed"
  exit 1
fi

# Predifined themes
declare -A themes
themes["Bibata_Arch"]="#1793d0"
themes["Bibata_Debian"]="#d70a53"
themes["Bibata_Void"]="#478061"

# Read arguments
RGB=""
THEME=""
FORCE=false
while [ -n "$1" ]; do
  case $1 in
    -c)
      RGB="$2"
      shift 2
      ;;
    --color)
      RGB="${1#*=}"
      shift
      ;;
    -f|--force)
      FORCE=true;
      shift
      ;;
    -n)
      THEME="$2"
      shift 2
      ;;
    --name)
      THEME="${1#*=}"
      shift
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      echo "error: invalid argument: $1"
      exit 2
      ;;
  esac
done

# Find RGB values of the provided theme name
if [ "" = "$RGB" ] && [ "" != "$THEME" ]; then
  RGB=${themes["$THEME"]};
  if [ "" = "$RGB" ]; then
    echo "FAIL: No theme with name ${THEME} found"
    exit 2
  fi
fi

# Exit if not enough info
if [ "" = "$RGB" ] || [ "" = "$THEME" ]; then
  echo "FAIL: Both color and name must be provided"
  exit 2
fi

# Let's do it!
echo "Building \"${THEME}\" with color ${RGB}"

# Got to base directory
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit


# Remove already existing build with the same name
if ([ -d "./src/${THEME}" ] || [ -d "./build/${THEME}" ]) && [ "true" != "$FORCE" ]; then
  echo "FAIL: Theme already exists."
  exit 3
fi
rm -rf "./src/${THEME}"
rm -rf "./build/${THEME}"

# Copy base theme (which is Bibata_Dark_Red)
cp -r "./src/Bibata_Base" "./src/${THEME}"

# set some paths
RAWSVGS="src/${THEME}/svgs"
CURSOR="src/${THEME}/cursor.theme"
INDEX="src/${THEME}/index.theme"
ALIASES="src/cursorList"

# Set RGB values in all SVGs
find "$RAWSVGS" -regex ".*\.svg" -type f -print0 \
  | xargs -0 sed -i "s/#a40000/${RGB}/g"

# set name in "index.theme"
# TODO: find out why the name is "Bibata_Red" if it is actually "Bibata_Dark_Red"
sed -i "s/Bibata_Red/${THEME}/g" "src/${THEME}/index.theme"

# set name in "cursor.theme"
sed -i "s/Bibata_Dark_Red/${THEME}/g" "src/${THEME}/cursor.theme"

# Create build folders
echo -ne "Making Folders... $BASENAME\\r"
DIR11X="build/${THEME}/96x96"
DIR10X="build/${THEME}/88x88"
DIR9X="build/${THEME}/80x80"
DIR8X="build/${THEME}/72x72"
DIR7X="build/${THEME}/64x64"
DIR6X="build/${THEME}/56x56"
DIR5X="build/${THEME}/48x48"
DIR4X="build/${THEME}/40x40"
DIR3X="build/${THEME}/32x32"
DIR2X="build/${THEME}/28x28"
DIR1X="build/${THEME}/24x24"

OUTPUT="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $CURSOR)"
OUTPUT=${OUTPUT// /_}

mkdir -p \
      "$DIR11X" \
      "$DIR10X" \
      "$DIR9X" \
      "$DIR8X" \
      "$DIR7X" \
      "$DIR6X" \
      "$DIR5X" \
      "$DIR4X" \
      "$DIR3X" \
      "$DIR2X" \
      "$DIR1X"
mkdir -p "$OUTPUT/cursors"

echo 'Making Folders... DONE';


for CUR in src/config/*.cursor; do
  BASENAME=$CUR
  BASENAME=${BASENAME##*/}
  BASENAME=${BASENAME%.*}
  echo -ne "\033[0KGenerating simple cursor pixmaps OF ${THEME}.. $BASENAME\\r"
  inkscape -w 24 -h 24 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR1X/$BASENAME.png" > /dev/null
  inkscape -w 28 -h 28 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR2X/$BASENAME.png" > /dev/null
  inkscape -w 32 -h 32 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR3X/$BASENAME.png" > /dev/null
  inkscape -w 40 -h 40 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR4X/$BASENAME.png" > /dev/null
  inkscape -w 48 -h 48 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR5X/$BASENAME.png" > /dev/null
  inkscape -w 56 -h 56 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR6X/$BASENAME.png" > /dev/null
  inkscape -w 64 -h 64 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR7X/$BASENAME.png" > /dev/null
  inkscape -w 72 -h 72 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR8X/$BASENAME.png" > /dev/null
  inkscape -w 80 -h 80 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR9X/$BASENAME.png" > /dev/null
  inkscape -w 88 -h 88 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR10X/$BASENAME.png" > /dev/null
  inkscape -w 96 -h 96 --without-gui -f $RAWSVGS/"$BASENAME".svg -e "$DIR11X/$BASENAME.png" > /dev/null
done

echo -e "\033[0KGenerating simple cursor pixmaps OF ${THEME}... DONE"

sleep 1s

echo -ne "\033[0KGenerating Animated Cursor ${THEME}... \\r"

for i in $(seq -f "%02g" 1 45); do
  echo -ne "\033[0KGenerating animated cursor pixmaps For ${THEME} Process... $i / 45 \\r"
  inkscape -w 24 -h 24 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR1X/progress-$i.png" > /dev/null
  inkscape -w 28 -h 28 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR2X/progress-$i.png" > /dev/null
  inkscape -w 32 -h 32 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR3X/progress-$i.png" > /dev/null
  inkscape -w 40 -h 40 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR4X/progress-$i.png" > /dev/null
  inkscape -w 48 -h 48 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR5X/progress-$i.png" > /dev/null
  inkscape -w 56 -h 56 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR6X/progress-$i.png" > /dev/null
  inkscape -w 64 -h 64 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR7X/progress-$i.png" > /dev/null
  inkscape -w 72 -h 72 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR8X/progress-$i.png" > /dev/null
  inkscape -w 80 -h 80 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR9X/progress-$i.png" > /dev/null
  inkscape -w 88 -h 88 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR10X/progress-$i.png" > /dev/null
  inkscape -w 96 -h 96 --without-gui -f $RAWSVGS/progress-$i.svg -e "$DIR11X/progress-$i.png" > /dev/null
done


echo -e "\033[0KGenerating animated cursor pixmaps For ${THEME} Process... DONE"

sleep 5s

for i in $(seq -f "%02g" 1 45); do
  echo -ne "\033[0KGenerating animated cursor pixmaps For ${THEME} Wait... $i / 45 \\r"

  inkscape -w 24 -h 24 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR1X/wait-$i.png" > /dev/null
  inkscape -w 28 -h 28 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR2X/wait-$i.png" > /dev/null
  inkscape -w 32 -h 32 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR3X/wait-$i.png" > /dev/null
  inkscape -w 40 -h 40 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR4X/wait-$i.png" > /dev/null
  inkscape -w 48 -h 48 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR5X/wait-$i.png" > /dev/null
  inkscape -w 56 -h 56 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR6X/wait-$i.png" > /dev/null
  inkscape -w 64 -h 64 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR7X/wait-$i.png" > /dev/null
  inkscape -w 72 -h 72 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR8X/wait-$i.png" > /dev/null
  inkscape -w 80 -h 80 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR9X/wait-$i.png" > /dev/null
  inkscape -w 88 -h 88 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR10X/wait-$i.png" > /dev/null
  inkscape -w 96 -h 96 --without-gui -f $RAWSVGS/wait-$i.svg -e "$DIR11X/wait-$i.png" > /dev/null

done
echo -e "\033[0KGenerating animated cursor pixmaps For ${THEME} Wait... DONE"
echo -ne "\033[0KGenerating Animated Cursor ${THEME}... DONE \\r"
sleep 2s

# Generate cursors
for CUR in src/config/*.cursor; do
  BASENAME=$CUR
  BASENAME=${BASENAME##*/}
  BASENAME=${BASENAME%.*}

  ERR="$( xcursorgen -p build/${THEME} "$CUR" "$OUTPUT/cursors/$BASENAME" 2>&1 )"

  if [[ "$?" -ne "0" ]]; then
    echo "FAIL: $CUR $ERR"
  fi
done

echo -e "Generating cursor theme... DONE"

sleep 1s

# Generate shortcuts
echo -ne "Generating shortcuts...\\r"
while read -r ALIAS ; do
  FROM=${ALIAS% *}
  TO=${ALIAS#* }
  if [ -e "$OUTPUT/cursors/$FROM" ] ; then
    continue
  fi
  ln -s "$TO" "$OUTPUT/cursors/$FROM"
done < $ALIASES
echo -e "\033[0KGenerating shortcuts... DONE"

# Copy Index theme
echo -ne "Copying Theme Index...\\r"
if ! [ -e "$OUTPUT/$CURSOR" ] ; then
  cp $CURSOR "$OUTPUT/cursor.theme"
  cp $INDEX "$OUTPUT/index.theme"
fi
echo -e "\033[0KCopying Theme Index... DONE"

echo "COMPLETE!"
exit 0
