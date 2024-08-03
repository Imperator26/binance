import osproc

proc runCommand(cmd: string) =
  let result = execProcess(cmd)
  echo result

runCommand("whoami")
