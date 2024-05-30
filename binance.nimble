# Package

version       = "0.1.1"
author        = "Imperator26"
description   = "Small utilities not worthing a package"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.2"

task reinstall, "Reinstalls this package":
    var path = "~/.nimble/pkgs2/" & projectName() & "-" & $version & "-*"
    exec("rm -rf " & path)
    exec("nimble install")

task buildDocs, "Build the docs":
    ## importBuilder source code: https://github.com/Alogani/shellcmd-examples/blob/main/src/importbuilder.nim
    let bundlePath = "htmldocs/" & projectName() & ".nim"
    exec("./importbuilder --build src " & bundlePath & " --discardExports")
    exec("nim doc --project --index:on --outdir:htmldocs " & bundlePath)
