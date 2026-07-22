#! /bin/sh
#\
    exec wish "$0" "$@"

# 208. A top-level window can appear anywhere on the screen. Write a procedure
# named 'frame-toplevel' that will accept as a single argument the name of a
# frame to create. The procedure should create the frame, place it in the center
# of the parent window, and return the name of the new frame. Change the
# 'toplevel' command in the previous exercise to 'frame-toplevel'. What is
# different between the two implementations?

package require Tk

# 1. Создаем главное окно (оно будет невидимым)
wm title . "Стартовое приложение"
wm withdraw .

# 2. Вызываем диалоговое окно
tk_messageBox -message "Добро пожаловать! Это сообщение появляется при старте." \
              -type ok \
              -icon info

# 3. Закрываем приложение после нажатия ОК
destroy .
