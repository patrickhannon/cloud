#C:\Users\patri\OneDrive\___Docs\__Cloud\___azure\AZ-104 Prerequisites for Azure administrators\azcopy

https://bidforservicestorage.blob.core.windows.net/sduffyaz104?sp=r&st=2022-09-12T11:58:12Z&se=2022-09-12T19:58:12Z&spr=https&sv=2021-06-08&sr=c&sig=rGzTaHeLxyGc%2BmLai6jOsX37nsp37o59TFBN7PkVGAo%3D

.\azcopy copy "https://bidforservicestorage.blob.core.windows.net/sduffyaz104?sp=rl&st=2022-09-12T12:12:41Z&se=2022-09-12T20:12:41Z&spr=https&sv=2021-06-08&sr=c&sig=MQbNOJP1czvpJGkDacOAF5nPNi2yvfVqkKNlEq0SxPk%3D" "https://bidforservicestorage.blob.core.windows.net/new?sp=racwdl&st=2022-09-12T12:05:01Z&se=2022-09-12T20:05:01Z&spr=https&sv=2021-06-08&sr=c&sig=8Qnz61PucU6%2FobCeXRffkEnm6m%2F9YzY1TmxlL4lFH%2FA%3D" --recursive=true

azcopy cp "https://[srcaccount].blob.core.windows.net/[container]/[path/to/directory]?[SAS]" "https://[destaccount].blob.core.windows.net/[container]/[path/to/directory]?[SAS]" --recursive=true
