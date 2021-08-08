CoordMode, Pixel, Screen

Loop {
ImageSearch, x, y, 0, 0, 1920, 1080, C:\Users\ramon\Documents\ProjetoAutoLoot\Imagens\utanihur.png

    if (ErrorLevel = 0) {
    Send, {f11}
    Break
    }
}
