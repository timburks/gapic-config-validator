FROM debian:stable-slim

# Add protoc and our common protos.
COPY --from=gcr.io/gapic-images/api-common-protos:beta /usr/local/bin/protoc /usr/local/bin/protoc
COPY --from=gcr.io/gapic-images/api-common-protos:beta /protos/ /protos/

# Add protoc-gen-gapic-validator binary
COPY protoc-gen-gapic-validator /usr/local/bin

# Add plugin invocation script for entrypoint
COPY docker-entrypoint.sh /usr/local/bin

# Set entry point script
ENTRYPOINT [ "docker-entrypoint.sh" ]
