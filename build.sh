#!/bin/bash


show_help(){
  cat <<EOF
Usage: $(basename "$0") [OPTION]
Configure Firefox profiles.

Options:
  -t, --theme=THEME-NAME    Build only the specified theme (default: ALL)
  -h, --help                Show this message

Available Themes:
  - ALL
  - DARK_RED
  - DODGER_BLUE
  - PINK
  - TURQUOISE
  - VOID_GREEN
EOF
}

THEME="ALL"

while [ -n "$1" ]; do
  case $1 in
    -t)
      THEME="$2"
      shift 2
      ;;
    --theme)
      THEME="${1#*=}"
      shift
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      echo "error: invalid argument: $1"
      exit 1
      ;;
  esac
done

cd "Building ${THEME}"


cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

# Bibata Pink
RAWSVGS_Bibata_Pink="src/Bibata_Pink/svgs"
CURSOR_Bibata_Pink="src/Bibata_Pink/cursor.theme"
INDEX_Bibata_Pink="src/Bibata_Pink/index.theme"

# Bibata Turquoise
RAWSVGS_Bibata_Turquoise="src/Bibata_Turquoise/svgs"
CURSOR_Bibata_Turquoise="src/Bibata_Turquoise/cursor.theme"
INDEX_Bibata_Turquoise="src/Bibata_Turquoise/index.theme"

# Bibata DodgerBlue
RAWSVGS_Bibata_Dodger_Blue="src/Bibata_Dodger_Blue/svgs"
CURSOR_Bibata_Dodger_Blue="src/Bibata_Dodger_Blue/cursor.theme"
INDEX_Bibata_Dodger_Blue="src/Bibata_Dodger_Blue/index.theme"

# Bibata DarkRed
RAWSVGS_Bibata_Dark_Red="src/Bibata_Dark_Red/svgs"
CURSOR_Bibata_Dark_Red="src/Bibata_Dark_Red/cursor.theme"
INDEX_Bibata_Dark_Red="src/Bibata_Dark_Red/index.theme"

# Bibata Void_Green
RAWSVGS_Bibata_Void_Green="src/Bibata_Void_Green/svgs"
CURSOR_Bibata_Void_Green="src/Bibata_Void_Green/cursor.theme"
INDEX_Bibata_Dark_Red="src/Bibata_Void_Green/index.theme"

ALIASES="src/cursorList"

echo -ne "Checking Requirements...\\r"

if  ! type "inkscape" > /dev/null ; then
    echo -e "\\nFAIL: inkscape must be installed"
    exit 1
fi

if  ! type "xcursorgen" > /dev/null ; then
    echo -e "\\nFAIL: xcursorgen must be installed"
    exit 1
fi
echo -e "Checking Requirements... DONE"



echo -ne "Making Folders... $BASENAME\\r"
if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
  DIR11X_Bibata_Pink="build/Bibata_Pink/96x96"
  DIR10X_Bibata_Pink="build/Bibata_Pink/88x88"
  DIR9X_Bibata_Pink="build/Bibata_Pink/80x80"
  DIR8X_Bibata_Pink="build/Bibata_Pink/72x72"
  DIR7X_Bibata_Pink="build/Bibata_Pink/64x64"
  DIR6X_Bibata_Pink="build/Bibata_Pink/56x56"
  DIR5X_Bibata_Pink="build/Bibata_Pink/48x48"
  DIR4X_Bibata_Pink="build/Bibata_Pink/40x40"
  DIR3X_Bibata_Pink="build/Bibata_Pink/32x32"
  DIR2X_Bibata_Pink="build/Bibata_Pink/28x28"
  DIR1X_Bibata_Pink="build/Bibata_Pink/24x24"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
  DIR11X_Bibata_Turquoise="build/Bibata_Turquoise/96x96"
  DIR10X_Bibata_Turquoise="build/Bibata_Turquoise/88x88"
  DIR9X_Bibata_Turquoise="build/Bibata_Turquoise/80x80"
  DIR8X_Bibata_Turquoise="build/Bibata_Turquoise/72x72"
  DIR7X_Bibata_Turquoise="build/Bibata_Turquoise/64x64"
  DIR6X_Bibata_Turquoise="build/Bibata_Turquoise/56x56"
  DIR5X_Bibata_Turquoise="build/Bibata_Turquoise/48x48"
  DIR4X_Bibata_Turquoise="build/Bibata_Turquoise/40x40"
  DIR3X_Bibata_Turquoise="build/Bibata_Turquoise/32x32"
  DIR2X_Bibata_Turquoise="build/Bibata_Turquoise/28x28"
  DIR1X_Bibata_Turquoise="build/Bibata_Turquoise/24x24"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
  DIR11X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/96x96"
  DIR10X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/88x88"
  DIR9X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/80x80"
  DIR8X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/72x72"
  DIR7X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/64x64"
  DIR6X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/56x56"
  DIR5X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/48x48"
  DIR4X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/40x40"
  DIR3X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/32x32"
  DIR2X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/28x28"
  DIR1X_Bibata_Dodger_Blue="build/Bibata_Dodger_Blue/24x24"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then
  DIR11X_Bibata_Dark_Red="build/Bibata_Dark_Red/96x96"
  DIR10X_Bibata_Dark_Red="build/Bibata_Dark_Red/88x88"
  DIR9X_Bibata_Dark_Red="build/Bibata_Dark_Red/80x80"
  DIR8X_Bibata_Dark_Red="build/Bibata_Dark_Red/72x72"
  DIR7X_Bibata_Dark_Red="build/Bibata_Dark_Red/64x64"
  DIR6X_Bibata_Dark_Red="build/Bibata_Dark_Red/56x56"
  DIR5X_Bibata_Dark_Red="build/Bibata_Dark_Red/48x48"
  DIR4X_Bibata_Dark_Red="build/Bibata_Dark_Red/40x40"
  DIR3X_Bibata_Dark_Red="build/Bibata_Dark_Red/32x32"
  DIR2X_Bibata_Dark_Red="build/Bibata_Dark_Red/28x28"
  DIR1X_Bibata_Dark_Red="build/Bibata_Dark_Red/24x24"
fi


if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
  DIR11X_Bibata_Void_Green="build/Bibata_Void_Green/96x96"
  DIR10X_Bibata_Void_Green="build/Bibata_Void_Green/88x88"
  DIR9X_Bibata_Void_Green="build/Bibata_Void_Green/80x80"
  DIR8X_Bibata_Void_Green="build/Bibata_Void_Green/72x72"
  DIR7X_Bibata_Void_Green="build/Bibata_Void_Green/64x64"
  DIR6X_Bibata_Void_Green="build/Bibata_Void_Green/56x56"
  DIR5X_Bibata_Void_Green="build/Bibata_Void_Green/48x48"
  DIR4X_Bibata_Void_Green="build/Bibata_Void_Green/40x40"
  DIR3X_Bibata_Void_Green="build/Bibata_Void_Green/32x32"
  DIR2X_Bibata_Void_Green="build/Bibata_Void_Green/28x28"
  DIR1X_Bibata_Void_Green="build/Bibata_Void_Green/24x24"
fi


if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
  OUTPUT_Bibata_Pink="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $CURSOR_Bibata_Pink)"
  OUTPUT_Bibata_Pink=${OUTPUT_Bibata_Pink// /_}
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
  OUTPUT_Bibata_Turquoise="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $CURSOR_Bibata_Turquoise)"
  OUTPUT_Bibata_Turquoise=${OUTPUT_Bibata_Turquoise// /_}
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
  OUTPUT_Bibata_Dodger_Blue="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $CURSOR_Bibata_Dodger_Blue)"
  OUTPUT_Bibata_Dodger_Blue=${OUTPUT_Bibata_Dodger_Blue// /_}
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then
  OUTPUT_Bibata_Dark_Red="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $CURSOR_Bibata_Dark_Red)"
  OUTPUT_Bibata_Dark_Red=${OUTPUT_Bibata_Dark_Red// /_}
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
  OUTPUT_Bibata_Void_Green="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $CURSOR_Bibata_Void_Green)"
  OUTPUT_Bibata_Void_Green=${OUTPUT_Bibata_Void_Green// /_}
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
  mkdir -p "$DIR11X_Bibata_Pink" "$DIR10X_Bibata_Pink" "$DIR9X_Bibata_Pink" "$DIR8X_Bibata_Pink" "$DIR7X_Bibata_Pink" "$DIR6X_Bibata_Pink" "$DIR5X_Bibata_Pink" "$DIR4X_Bibata_Pink" "$DIR3X_Bibata_Pink" "$DIR2X_Bibata_Pink" "$DIR1X_Bibata_Pink"
  mkdir -p "$OUTPUT_Bibata_Pink/cursors"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
  mkdir -p "$DIR11X_Bibata_Turquoise" "$DIR10X_Bibata_Turquoise" "$DIR9X_Bibata_Turquoise" "$DIR8X_Bibata_Turquoise" "$DIR7X_Bibata_Turquoise" "$DIR6X_Bibata_Turquoise" "$DIR5X_Bibata_Turquoise" "$DIR4X_Bibata_Turquoise" "$DIR3X_Bibata_Turquoise" "$DIR2X_Bibata_Turquoise" "$DIR1X_Bibata_Turquoise"
  mkdir -p "$OUTPUT_Bibata_Turquoise/cursors"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
  mkdir -p "$DIR11X_Bibata_Dodger_Blue" "$DIR10X_Bibata_Dodger_Blue" "$DIR9X_Bibata_Dodger_Blue" "$DIR8X_Bibata_Dodger_Blue" "$DIR7X_Bibata_Dodger_Blue" "$DIR6X_Bibata_Dodger_Blue" "$DIR5X_Bibata_Dodger_Blue" "$DIR4X_Bibata_Dodger_Blue" "$DIR3X_Bibata_Dodger_Blue" "$DIR2X_Bibata_Dodger_Blue" "$DIR1X_Bibata_Dodger_Blue"
  mkdir -p "$OUTPUT_Bibata_Turquoise/cursors"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then
  mkdir -p "$DIR11X_Bibata_Dark_Red" "$DIR10X_Bibata_Dark_Red" "$DIR9X_Bibata_Dark_Red" "$DIR8X_Bibata_Dark_Red" "$DIR7X_Bibata_Dark_Red" "$DIR6X_Bibata_Dark_Red" "$DIR5X_Bibata_Dark_Red" "$DIR4X_Bibata_Dark_Red" "$DIR3X_Bibata_Dark_Red" "$DIR2X_Bibata_Dark_Red" "$DIR1X_Bibata_Dark_Red"
  mkdir -p "$OUTPUT_Bibata_Dark_Red/cursors"
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
  mkdir -p "$DIR11X_Bibata_Void_Green" "$DIR10X_Bibata_Void_Green" "$DIR9X_Bibata_Void_Green" "$DIR8X_Bibata_Void_Green" "$DIR7X_Bibata_Void_Green" "$DIR6X_Bibata_Void_Green" "$DIR5X_Bibata_Void_Green" "$DIR4X_Bibata_Void_Green" "$DIR3X_Bibata_Void_Green" "$DIR2X_Bibata_Void_Green" "$DIR1X_Bibata_Void_Green"
  mkdir -p "$OUTPUT_Bibata_Void_Green/cursors"
fi

echo 'Making Folders... DONE';


# Bibata Pink Cursor
if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata Pink.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR1X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR2X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR3X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR4X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR5X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR6X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR7X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR8X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR9X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR10X_Bibata_Pink/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Pink/"$BASENAME".svg -e "$DIR11X_Bibata_Pink/$BASENAME.png" > /dev/null

  done
  echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata Pink... DONE"

  sleep 1s


  echo -ne "\033[0KGenerating Animated Cursor Bibata Pink... \\r"
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Pink Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR1X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR2X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR3X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR4X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR5X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR6X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR7X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR8X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR9X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR10X_Bibata_Pink/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Pink/progress-$i.svg -e "$DIR11X_Bibata_Pink/progress-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Pink Process... DONE"

  sleep 5s

  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Pink Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR1X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR2X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR3X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR4X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR5X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR6X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR7X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR8X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR9X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR10X_Bibata_Pink/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Pink/wait-$i.svg -e "$DIR11X_Bibata_Pink/wait-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Pink Wait... DONE"
  echo -ne "\033[0KGenerating Animated Cursor Bibata Pink... DONE \\r"


  sleep 2s
fi


# Bibata Turquoise
if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata Turquoise.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR1X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR2X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR3X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR4X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR5X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR6X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR7X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR8X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR9X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR10X_Bibata_Turquoise/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Turquoise/"$BASENAME".svg -e "$DIR11X_Bibata_Turquoise/$BASENAME.png" > /dev/null

  done
  echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata Turquoise... DONE"

  sleep 1s

  echo -ne "\033[0KGenerating Animated Cursor Bibata Turquoise... \\r"
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Turquoise Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR1X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR2X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR3X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR4X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR5X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR6X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR7X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR8X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR9X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR10X_Bibata_Turquoise/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Turquoise/progress-$i.svg -e "$DIR11X_Bibata_Turquoise/progress-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Turquoise Process... DONE"

  sleep 1s
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Turquoise Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR1X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR2X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR3X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR4X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR5X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR6X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR7X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR8X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR9X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR10X_Bibata_Turquoise/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Turquoise/wait-$i.svg -e "$DIR11X_Bibata_Turquoise/wait-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Turquoise Wait... DONE"
  echo -e "\033[0KGenerating Animated Cursor Bibata Turquoise... DONE \\r"

  sleep 1s
fi

# Bibata Bibata DodgerBlue
if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata DodgerBlue.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR1X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR2X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR3X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR4X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR5X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR6X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR7X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR8X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR9X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR10X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/"$BASENAME".svg -e "$DIR11X_Bibata_Dodger_Blue/$BASENAME.png" > /dev/null

  done
  echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata DodgerBlue... DONE"

  sleep 1s

  echo -ne "\033[0KGenerating Animated Cursor Bibata DodgerBlue... \\r"
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata DodgerBlue Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR1X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR2X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR3X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR4X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR5X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR6X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR7X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR8X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR9X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR10X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/progress-$i.svg -e "$DIR11X_Bibata_Dodger_Blue/progress-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata DodgerBlue Process... DONE"

  sleep 1s
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata DodgerBlue Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR1X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR2X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR3X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR4X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR5X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR6X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR7X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR8X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR9X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR10X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Dodger_Blue/wait-$i.svg -e "$DIR11X_Bibata_Dodger_Blue/wait-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata DodgerBlue Wait... DONE"
  echo -e "\033[0KGenerating Animated Cursor Bibata DodgerBlue... DONE \\r"

  sleep 1s
fi

# Bibata Dark_Red Cursor
if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata DarkRed.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR1X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR2X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR3X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR4X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR5X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR6X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR7X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR8X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR9X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR10X_Bibata_Dark_Red/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Dark_Red/"$BASENAME".svg -e "$DIR11X_Bibata_Dark_Red/$BASENAME.png" > /dev/null

  done
  echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata DarkRed... DONE"

  sleep 1s

  echo -ne "\033[0KGenerating Animated Cursor Bibata DarkRed... \\r"
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata DarkRed Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR1X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR2X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR3X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR4X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR5X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR6X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR7X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR8X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR9X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR10X_Bibata_Dark_Red/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Dark_Red/progress-$i.svg -e "$DIR11X_Bibata_Dark_Red/progress-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata DarkRed Process... DONE"

  sleep 5s

  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata DarkRed Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR1X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR2X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR3X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR4X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR5X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR6X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR7X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR8X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR9X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR10X_Bibata_Dark_Red/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Dark_Red/wait-$i.svg -e "$DIR11X_Bibata_Dark_Red/wait-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata DarkRed Wait... DONE"
  echo -ne "\033[0KGenerating Animated Cursor Bibata DarkRed... DONE \\r"


  sleep 2s
fi

# Bibata Void_Green Cursor
if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata VoidGreen.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR1X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR2X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR3X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR4X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR5X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR6X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR7X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR8X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR9X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR10X_Bibata_Void_Green/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Void_Green/"$BASENAME".svg -e "$DIR11X_Bibata_Void_Green/$BASENAME.png" > /dev/null

  done
  echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata VoidGreen... DONE"

  sleep 1s

  echo -ne "\033[0KGenerating Animated Cursor Bibata VoidGreen... \\r"
  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata VoidGreen Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR1X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR2X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR3X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR4X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR5X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR6X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR7X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR8X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR9X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR10X_Bibata_Void_Green/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Void_Green/progress-$i.svg -e "$DIR11X_Bibata_Void_Green/progress-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata VoidGreen Process... DONE"

  sleep 5s

  for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
  do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata VoidGreen Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR1X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR2X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR3X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR4X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR5X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR6X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR7X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR8X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR9X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR10X_Bibata_Void_Green/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Void_Green/wait-$i.svg -e "$DIR11X_Bibata_Void_Green/wait-$i.png" > /dev/null

  done
  echo -e "\033[0KGenerating animated cursor pixmaps For Bibata VoidGreen Wait... DONE"
  echo -ne "\033[0KGenerating Animated Cursor Bibata VoidGreen... DONE \\r"
  sleep 2s
fi



if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
  echo -ne "Generating cursor theme...\\r"
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Pink "$CUR" "$OUTPUT_Bibata_Pink/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
      echo "FAIL: $CUR $ERR"
    fi

  done
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Turquoise "$CUR" "$OUTPUT_Bibata_Turquoise/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
      echo "FAIL: $CUR $ERR"
    fi
  done
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Dodger_Blue "$CUR" "$OUTPUT_Bibata_Dodger_Blue/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
      echo "FAIL: $CUR $ERR"
    fi
  done
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Dark_Red "$CUR" "$OUTPUT_Bibata_Dark_Red/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
      echo "FAIL: $CUR $ERR"
    fi
  done
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
  for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Void_Green "$CUR" "$OUTPUT_Bibata_Void_Green/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
      echo "FAIL: $CUR $ERR"
    fi
  done
fi


echo -e "Generating cursor theme... DONE"

sleep 1s

echo -ne "Generating shortcuts...\\r"
while read -r ALIAS ; do
  FROM=${ALIAS% *}
  TO=${ALIAS#* }

  if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
    if [ -e "$OUTPUT_Bibata_Pink/cursors/$FROM" ] ; then
      continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Pink/cursors/$FROM"
  fi

  if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
    if [ -e "$OUTPUT_Bibata_Turquoise/cursors/$FROM" ] ; then
      continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Turquoise/cursors/$FROM"
  fi

  if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
    if [ -e "$OUTPUT_Bibata_Dodger_Blue/cursors/$FROM" ] ; then
      continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Dodger_Blue/cursors/$FROM"
  fi


  if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then

    if [ -e "$OUTPUT_Bibata_Dark_Red/cursors/$FROM" ] ; then
      continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Dark_Red/cursors/$FROM"
  fi

  if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
    if [ -e "$OUTPUT_Bibata_Void_Green/cursors/$FROM" ] ; then
      continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Void_Green/cursors/$FROM"
  fi
done < $ALIASES
echo -e "\033[0KGenerating shortcuts... DONE"


echo -ne "Copying Theme Index...\\r"

  if [ "$THEME" = "ALL" ] || [ "$THEME" = "PINK" ]; then
    if ! [ -e "$OUTPUT_Bibata_Pink/$CURSOR_Bibata_Pink" ] ; then
        cp $CURSOR_Bibata_Pink "$OUTPUT_Bibata_Pink/cursor.theme"
        cp $INDEX_Bibata_Pink "$OUTPUT_Bibata_Pink/index.theme"
    fi
  fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "TURQUOISE" ]; then
     if ! [ -e "$OUTPUT_Bibata_Turquoise/$CURSOR_Bibata_Turquoise" ] ; then
        cp $CURSOR_Bibata_Turquoise "$OUTPUT_Bibata_Turquoise/cursor.theme"
        cp $INDEX_Bibata_Turquoise "$OUTPUT_Bibata_Turquoise/index.theme"
    fi
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DODGER_BLUE" ]; then
    if ! [ -e "$OUTPUT_Bibata_Dodger_Blue/$CURSOR_Bibata_Dodger_Blue" ] ; then
        cp $CURSOR_Bibata_Dodger_Blue "$OUTPUT_Bibata_Dodger_Blue/cursor.theme"
        cp $INDEX_Bibata_Dodger_Blue "$OUTPUT_Bibata_Dodger_Blue/index.theme"
    fi
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "DARK_RED" ]; then
    if ! [ -e "$OUTPUT_Bibata_Dark_Red/$CURSOR_Bibata_Dark_Red" ] ; then
        cp $CURSOR_Bibata_Dark_Red "$OUTPUT_Bibata_Dark_Red/cursor.theme"
        cp $INDEX_Bibata_Dark_Red "$OUTPUT_Bibata_Dark_Red/index.theme"
    fi
fi

if [ "$THEME" = "ALL" ] || [ "$THEME" = "VOID_GREEN" ]; then
    if ! [ -e "$OUTPUT_Bibata_Void_Green/$CURSOR_Bibata_Void_Green" ] ; then
        cp $CURSOR_Bibata_Void_Green "$OUTPUT_Bibata_Void_Green/cursor.theme"
        cp $INDEX_Bibata_Void_Green "$OUTPUT_Bibata_Void_Green/index.theme"
    fi
fi


echo -e "\033[0KCopying Theme Index... DONE"


echo -ne "Generating Installer...\\r"
    if ! [ -e "$OUTPUT_Bibata/$CURSOR_Bibata_Pink" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        cp src/in.inst Installer_Bibata.sh
    fi
echo -e "\033[0KGenerating Installer... DONE"

show_Msg() {
  echo -e "\033[1;34m$@\033[0m"
}
show_command() {
  echo -e "\033[1;93m$@\033[0m"
}

echo -ne "Making Installer Executable...\\r"
    if ! [ -e "$OUTPUT_Bibata/$CURSOR_Bibata_Pink" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        # gksu chmod +x Installer_Bibata.sh
         ERR="$(gksu chmod +x Installer_Bibata.sh 2>&1)"

                if [[ "$?" -ne "0" ]]; then
                    echo -e "\033[0KMaking Installer Executable... FAIL"
                else
                    echo -e "\033[0KMaking Installer Executable... DONE"
                fi
        fi


show_Msg "For Installation Use Following Command:\n\n"
show_command "\t sudo ./Installer_Bibata.sh\n"
exit

echo "COMPLETE!"
