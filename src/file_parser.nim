import std/[parseopt]

proc parseFilePath*(): string =
  var p = initOptParser("")
  while true:
    p.next()
    case p.kind
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
      case p.key:
        of "f":
          return p.val
        else:
          raise newException(ValueError, "a wrong command flag was specified")
    of cmdArgument:
      echo "Argument: ", p.key