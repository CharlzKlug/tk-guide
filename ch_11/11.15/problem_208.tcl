#! /bin/sh
#\
    exec wish "$0" "$@"

# 208. A top-level window can appear anywhere on the screen. Write a procedure
# named 'frame-toplevel' that will accept as a single argument the name of a
# frame to create. The procedure should create the frame, place it in the center
# of the parent window, and return the name of the new frame. Change the
# 'toplevel' command in the previous exercise to 'frame-toplevel'. What is
# different between the two implementations?

proc frame-toplevel {inputWindow} {
    set innerFrame [frame .frameControl]
    pack .frameControl -fill x
    return $innerFrame
}

package require Tk

# 1. Создаем главное окно.
wm title . "Стартовое приложение"

# 2. Вызываем процедуру, создающую фрейм в окне '.'.
set myFrame [frame-toplevel .]

# 3. Создаём метку.
set myLabel [label ${myFrame}.lStartDir -text "123"]

# 4. Размещаем метку во фрейме.
pack ${myLabel} -side left -anchor w
