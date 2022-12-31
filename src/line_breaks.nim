import std/[os]

let filePath = "/Users/idetaisei/html-formater/index.html"

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