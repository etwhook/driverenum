import winim

proc toString(charray: openArray[char]): string =
    for character in charray:
        if character == '\x00':
            continue
        result.add(character)


var drivers: array[1024,LPVOID]
var cbNeeded: DWORD = 0.DWORD

EnumDeviceDrivers(
    drivers[0].addr,
    sizeof(drivers).DWORD,
    &cbNeeded
)

var driverCount = int(int(cbNeeded) / sizeof(LPVOID))
echo("Device Drivers: " & $driverCount & " Drivers.")
for i in 0..driverCount:
    var driver = drivers[i]
    var name: array[MAX_PATH, char]
    GetDeviceDriverBaseNameA(
        driver,
        name[0].addr,
        MAX_PATH.DWORD
    )
    echo(name.toString)
