CoordMode, Pixel, Screen

Loop{

    ImageSearch, x, y, 1753, 284, 1858, 295, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\hungry.png

    if (ErrorLevel = 0){
        Click, %x%,%y%
        break
    }
}