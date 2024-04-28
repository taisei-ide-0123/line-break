import std/[os]
import file_parser

proc formatFileContents(filePath: string): void =
  if not fileExists(filePath):
    raise newException(ValueError, "The file does not exist")

  let file = open(filePath, fmRead)
  let fileContent = file.readAll

  var newContent: string
  for i in 0..fileContent.len-1:
    var cur = $fileContent[i]

    if (i == 0):
      newContent.add cur
      continue

    var pre = $fileContent[i - 1]

    if (pre != "." and cur == "\n"):
      newContent.add " "
    else:
      newContent.add cur

  echo newContent
  writeFile(filePath, newContent)

let filePath = parseFilePath()
echo "filePath: ", filePath

formatFileContents(filePath)