if "%1" == "gdc" ( dub run --compiler=gdc --config=gdc
) else if "%1" == "gdc-build" ( dub build --compiler=gdc --config=gdc
) else if "%1" == "dmd-build" ( dub build --config=dmd
) else ( dub run --config=dmd )
