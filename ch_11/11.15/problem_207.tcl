#! /bin/sh
#\
    exec wish "$0" "$@"

# 207. Write a procedure that will create a pop-up window using the toplevel
# command with an information label, and an OK button that will destroy the
# pop-up when clicked.

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
