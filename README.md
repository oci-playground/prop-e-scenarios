# prop-e-scenarios

See [this doc](https://github.com/opencontainers/wg-reference-types/blob/8ebd9b883889780a407e4a378c7d9bd9bbd34a06/docs/UPGRADING.md) for a complete list of scenarios.

## Setup

```
export PATH="${PWD}/bin:${PATH}"
make clean
make 🚲 🏍 🐀 🐿 🦫 🌱 🌿 🌲
```

## Start registries

Run "current" registry at `localhost:5001`:
```
🚲 serve config/registry/current.yaml
```

Run "complete" registry at `localhost:5002`:
```
🏍 serve config/registry/complete.yaml
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
TODO
```

### 14: 🌲 --> 🚲 --> 🐿

"Producer attempts to push new manifest, registry rejects as new manifest is unknown"

Steps:

```
TODO
```

### 15: 🌲 --> 🚲 --> 🦫

"Producer attempts to push new manifest, registry rejects as new manifest is unknown"

Steps:

```
TODO
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
TODO
```
