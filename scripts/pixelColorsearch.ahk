;Usar Utani hur
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

Esc::

MouseGetPos, x, y
PixelGetColor, cor, %x%, %y%
Clipboard := cor

return
