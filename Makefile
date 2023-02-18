PROTO_DIR = v1


ifeq ($(OS), Windows_NT)
	PACKAGE = $(shell (Get-Content go.mod -head 1).Split(" ")[1])
else
	PACKAGE = $(shell head -1 go.mod | awk '{print $$2}')
endif

.PHONY: auth order product
project := auth order product


$(project):
	@${CHECK_DIR_CMD}
	protoc -I$@/${PROTO_DIR} --go_opt=module=${PACKAGE} --go_out=. --go-grpc_opt=module=${PACKAGE} --go-grpc_opt=require_unimplemented_servers=false \
	--go-grpc_out=. $@/${PROTO_DIR}/*.proto