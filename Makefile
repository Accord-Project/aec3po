context.jsonld: context.yaml
	yq -o=json $^ > $@
