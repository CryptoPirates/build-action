# Build Action
Build a container image from a Dockerfile. Use to test your develop branch for a passing build.

## Inputs

### `gitUsername`

**Required** The git username to use when cloning dependencies.

### `gitAccessToken`

**Required** The access token associated with the user passed to gitUsername.

## Example usage

```yaml
uses: cryptopirates/gke-build-deploy-action@master
with:
    gitUsername: ${{ secrets.GIT_USERNAME }}
    gitAccessToken: ${{ secrets.GIT_ACCESS_TOKEN }}
```