import std/[os, parseopt]

proc parseFilePath(): string =
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

proc formatFileContents(filePath: string): void =
  if fileExists(filePath):
    let file = open(filePath, fmRead)
    var fileContent = file.readAll

    var newContent: string
    for i in 0..fileContent.len-1:
      var str = $fileContent[i]

      if str == "" or str == "\n" or (str == "." and $fileContent[i-1] == "."):
        discard
      elif(str == "." or str == "?"):
        str = str & "\n"
        newContent.add str
      else:
        newContent.add str

    echo newContent
  else:
    raise newException(ValueError, "The file does not exist")

let filePath = parseFilePath()
echo "filePath: ", filePath

formatFileContents(filePath)