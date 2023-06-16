import std/tables
import osproc, strutils

# ЙЦУКЕН - QWERTY
let letters: Table[string, string] = {
        "q": "й",
        "w": "ц",
        "e": "у",
        "r": "к",
        "t": "е",
        "y": "н",
        "u": "г",
        "i": "ш",
        "o": "щ",
        "p": "з",
        "[": "х",
        "]": "ъ",
        "{": "Х",
        "}": "Ъ",
        "a": "ф",
        "s": "ы",
        "d": "в",
        "f": "а",
        "g": "п",
        "h": "р",
        "j": "о",
        "k": "л",
        "l": "д",
        ";": "ж",
        ":": "Ж",
        "'": "э",
        "\"": "Э",
        "z": "я",
        "x": "ч",
        "c": "с",
        "v": "м",
        "b": "и",
        "n": "т",
        "m": "ь",
        ",": "б",
        "<": "Б",
        ">": "Ю",
        ".": "ю",
        "/": ".",
        "~": "Ё",
        "`": "ё",
        "?": ",",
        "!": "!",
        "@": "\"",
        "#": "№",
        "$": ";",
        "%": "%",
        "^": ":",
        "&": "?"
    }.toTable()


# Команда для получения выдленного текста
const shellCommand: string = "xclip"

# Запуск команды
var execRes = execProcess(shellCommand, args = ["-out"], options = {poUsePath})

# Строка на выход
var newStr: string

# Замена
for ch in execRes:
    let str_char = "" & ch.toLowerAscii()

    if letters.hasKey(str_char.toLowerAscii()):
        if ch.isUpperAscii(): newStr.add(letters[str_char].toUpper())
        else: newStr.add(letters[str_char])
    else: newStr.add(ch)

# Отправка новый строки в буфер обмена
var execCopy = execCmd("echo \"" & newStr.strip() & "\" | xclip -sel c")
discard execCopy

# Автоматическая вставка Ctrl+V
var execPaste = execCmd("xdotool key Control_L+a Control_L+v")
discard execPaste