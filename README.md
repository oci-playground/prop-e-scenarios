# prop-e-scenarios

See [this doc](https://github.com/opencontainers/wg-reference-types/blob/main/docs/UPGRADING.md#proposal-e) for a complete list of icons and scenarios.

## Setup

Build all components:

```
make build-all
```

## Start registries

Run "current" registry at `localhost:5001`:
```
rm -rf /tmp/registry-current-root-dir
bin/current-registry serve config/registry/current.yaml
```

In another terminal window, run "complete" registry at `localhost:5002`:
```
rm -rf /tmp/registry-complete-root-dir
bin/complete-registry serve config/registry/complete.yaml
```

## Scenarios

### 1: 🌱 --> 🚲 --> 🐀

"Present state, no refers"

Steps:

```
TODO
```

### 2: 🌱 --> 🚲 --> 🐿

"Consumer looking for refers that don't exist"

Steps:

```
TODO
```

### 3: 🌱 --> 🚲 --> 🦫

"Consumer looking for refers that don't exist"

Steps:

```
TODO
```

### 4: 🌱 --> 🏍 --> 🐀

"Present state, no refers"

Steps:

```
TODO
```

### 5: 🌱 --> 🏍 --> 🐿

"Consumer looking for refers that don't exist"

Steps:

```
TODO
```

### 6: 🌱 --> 🏍 --> 🦫

"Consumer looking for refers that don't exist"

Steps:

```
TODO
```

### 7: 🌿 --> 🚲 --> 🐀

"Producer creating refers, consumer isn't using refers and is not impacted"

Steps:

```
TODO
```

### 8: 🌿 --> 🚲 --> 🐿

"Producer / consumer working in compatibility mode with tags"

Steps:

```
TODO
```

### 9: 🌿 --> 🚲 --> 🦫

"Consumer wants artifact-spec, but can fall back to image-spec refers using tags"

Steps:

```
TODO
```

### 10: 🌿 --> 🏍 --> 🐀

"Producer creating refers, consumer isn't using refers and is not impacted"

Steps:

```
TODO
```

### 11: 🌿 --> 🏍 --> 🐿

"Producer / consumer using image-spec manifests and referrers API"

Steps:

```
TODO
```

### 12: 🌿 --> 🏍 --> 🦫

"Producer pushes image-spec manifest, consumer discovers refers via new API and would prefer new manifest"

Steps:

```
TODO
```

### 13: 🌲 --> 🚲 --> 🐀

"Producer attempts to push new manifest, registry rejects as new manifest is unknown"

Steps:

```
# Allow plain http when pointing to local registry (only needed once)
bin/complete-producer -v debug registry set --tls disabled localhost:5001

# Push an image into registry
bin/complete-producer -v debug image copy \
  ghcr.io/distroless/alpine-base:latest \
  localhost:5001/scenario-13/alpine-base:latest

# Attach an artifact of type "misc" to image, with new manifest type
# Should fail with "MANIFEST_INVALID"
echo "hello world" | bin/complete-producer -v debug artifact put --refers \
  localhost:5001/scenario-13/alpine-base:latest \
  --annotation org.opencontainers.artifact.type=misc \
  --manifest-media-type application/vnd.oci.artifact.manifest.v1+json
```

### 14: 🌲 --> 🚲 --> 🐿

"Producer attempts to push new manifest, registry rejects as new manifest is unknown"

Steps:

```
# Allow plain http when pointing to local registry (only needed once)
bin/complete-producer -v debug registry set --tls disabled localhost:5001

# Push an image into registry
bin/complete-producer -v debug image copy \
  ghcr.io/distroless/alpine-base:latest \
  localhost:5001/scenario-14/alpine-base:latest

# Attach an artifact of type "misc" to image, with new manifest type
# Should fail with "MANIFEST_INVALID"
echo "hello world" | bin/complete-producer -v debug artifact put --refers \
  localhost:5001/scenario-14/alpine-base:latest \
  --annotation org.opencontainers.artifact.type=misc \
  --manifest-media-type application/vnd.oci.artifact.manifest.v1+json
```

### 15: 🌲 --> 🚲 --> 🦫

"Producer attempts to push new manifest, registry rejects as new manifest is unknown"

Steps:

```
# Allow plain http when pointing to local registry (only needed once)
bin/complete-producer -v debug registry set --tls disabled localhost:5001

# Push an image into registry
bin/complete-producer -v debug image copy \
  ghcr.io/distroless/alpine-base:latest \
  localhost:5001/scenario-15/alpine-base:latest

# Attach an artifact of type "misc" to image, with new manifest type
# Should fail with "MANIFEST_INVALID"
echo "hello world" | bin/complete-producer -v debug artifact put --refers \
  localhost:5001/scenario-15/alpine-base:latest \
  --annotation org.opencontainers.artifact.type=misc \
  --manifest-media-type application/vnd.oci.artifact.manifest.v1+json
```

### 16: 🌲 --> 🏍 --> 🐀

"Producer creates new manifest, consumer isn't using refers and is not impacted"

Steps:

```
TODO
```

### 17: 🌲 --> 🏍 --> 🐿

"Producer pushes new manifest, consumer finds refers via new API but cannot parse new manifest"

Steps:

```
TODO
```

### 18: 🌲 --> 🏍 --> 🦫

"Producer and consumer both use new manifest and API"

Steps:

```
# Allow plain http when pointing to local registry (only needed once)
bin/complete-producer -v debug registry set --tls disabled localhost:5002

# Push an image into registry
bin/complete-producer -v debug image copy \
  ghcr.io/distroless/alpine-base:latest \
  localhost:5002/scenario-18/alpine-base:latest

# Attach an artifact of type "misc" to image, with new manifest type
echo "hello world" | bin/complete-producer -v debug artifact put --refers \
  localhost:5002/scenario-18/alpine-base:latest \
  --annotation org.opencontainers.artifact.type=misc \
  --manifest-media-type application/vnd.oci.artifact.manifest.v1+json

# Ensure consumer can see list of refers
bin/complete-consumer -v debug artifact list \
  localhost:5002/scenario-18/alpine-base:latest \
  --format '{{ jsonPretty .Manifest}}' | jq
```
