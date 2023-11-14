get: 
	curl -o data.csv https://data.sfgov.org/api/views/3mea-di5p/rows.csv?date=20231114&accessType=DOWNLOAD
generate:
	ruby generate.rb | tippecanoe -f -o a.pmtiles --minimum-zoom=3 --maximum-zoom=13 \
	--base-zoom=13 --drop-densest-as-needed

