## Develop

### Upgrade the upstream Chart.

- First check the changelog in upstream and take notes

- Then, find a suitable version.

- Add values diff changelog into `changelog` folder.

- Update `Chart.yaml`:
  - dependencies
  - version
  - appVersion

- Run `helm dependency update`

- Adjust values (If applicable)
  - Adjust Root Values
  - Adjust Values in [config repo](https://github.com/giantswarm/config)

- Update docs with `helm-docs`

- Test the Upgrade.

- Release a new app version

- Annonce the change to our customers.


### Update documentation

Chart documentation is generated with [helm-docs](https://github.com/norwoodj/helm-docs) from `values.yaml` file.
After file modification, regenerate README.md with command:

```bash
./script/update-docs.sh
```



