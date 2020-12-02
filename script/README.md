# helpers scripts

## upsteam chart sync

There are 2 scripts to help sync this chart with its upstream counterpart.

`sync_chart.sh`: naively tries to sync this chart with upstream.
	It does so by pulling upstream chart (latest version if no arguments given)
	and apply patches from the `patch` folder to it.
	Patches contains all changes made against the upstream chart.

`generate_patch.sh`: generate a patch against the given upstream version (latest if no argument given).

## example

1. Upgrade to `v2.0.0`

```
$ ./script/sync_chart.sh v2.0.0
=====> fetching upstream chart
Cloning into '/tmp/tmp.QflyupZkro'...
remote: Enumerating objects: 620, done.
remote: Counting objects: 100% (620/620), done.
remote: Compressing objects: 100% (456/456), done.
remote: Total 620 (delta 289), reused 258 (delta 144), pack-reused 0
Receiving objects: 100% (620/620), 373.55 KiB | 584.00 KiB/s, done.
Resolving deltas: 100% (289/289), done.
=====> syncing chart
sending incremental file list
deleting values.schema.json
./
CONTRIBUTING.md
README.md
requirements.yaml
values.yaml
... skipping lines ...
=====> patching chart
patching file templates/_helpers.tpl
patching file templates/alertmanager/alertmanager.yaml
Hunk #1 FAILED at 9.
1 out of 1 hunk FAILED -- saving rejects to file templates/alertmanager/alertmanager.yaml.rej
patching file templates/prometheus-operator/admission-webhooks/job-patch/job-createSecret.yaml
patching file templates/prometheus-operator/deployment.yaml
Hunk #2 FAILED at 67.
Hunk #3 FAILED at 101.
2 out of 3 hunks FAILED -- saving rejects to file templates/prometheus-operator/deployment.yaml.rej
patching file templates/prometheus/prometheus.yaml
Hunk #1 FAILED at 32.
1 out of 1 hunk FAILED -- saving rejects to file templates/prometheus/prometheus.yaml.rej
patching file values.schema.json
patching file values.yaml
Hunk #1 succeeded at 87 (offset 3 lines).
Hunk #2 succeeded at 369 (offset 12 lines).
Hunk #3 succeeded at 568 (offset 48 lines).
Hunk #4 FAILED at 1168.
Hunk #5 FAILED at 1186.
Hunk #6 succeeded at 1353 (offset 32 lines).
Hunk #7 FAILED at 1377.
Hunk #8 FAILED at 1385.
Hunk #9 FAILED at 1411.
Hunk #10 FAILED at 1656.
6 out of 10 hunks FAILED -- saving rejects to file values.yaml.rej
```

Sync failed because there are too many differences with the upstream version.
The script basically applied as many changes as possible against the upstream version and left the one that could not be updated to you.

2. Go ahead and edit your chart to make it right.

There is a bunch of .ref files that can safely be removed, they contain informations about why patching failed.

3. Commit your changes

4. Generate the patch

```
$ ./script/generate_patch.sh v2.0.0 > patch/00.initial.patch
=====> fetching upstream chart
Cloning into '/tmp/tmp.Exf7tfGgmM'...
remote: Enumerating objects: 620, done.
remote: Counting objects: 100% (620/620), done.
remote: Compressing objects: 100% (457/457), done.
remote: Total 620 (delta 287), reused 257 (delta 143), pack-reused 0
Receiving objects: 100% (620/620), 374.66 KiB | 1.14 MiB/s, done.
Resolving deltas: 100% (287/287), done.
=====> syncing chart
=====> generating patch
Updated 6 paths from the index
=====> done
```

5. Commit the new or changed patch file.
6. You are done
