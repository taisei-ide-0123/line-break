import std/[os]
import file_parser

proc formatFileContents(filePath: string): void =
  if fileExists(filePath):
    let file = open(filePath, fmRead)
    let fileContent = file.readAll

    var newContent: string
    for i in 0..fileContent.len-1:
      if i == 0:
        continue

      var pre = $fileContent[i - 1]
      var cur = $fileContent[i]

      if (pre == "." and cur == " "):
        newContent.add ".\n\n"
      else:
        newContent.add cur

    echo newContent
    writeFile(filePath, newContent)
  else:
    raise newException(ValueError, "The file does not exist")

let filePath = parseFilePath()
echo "filePath: ", filePath

formatFileContents(filePath)