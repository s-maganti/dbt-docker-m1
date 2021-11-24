## dbt-docker-m1

Running [`dbt`](https://github.com/dbt-labs/dbt-core) in a docker container on an M1 chip.

1. Build our container.

```sh
git clone https://github.com/jeremyyeo/dbt-docker-m1.git
cd dbt-docker-m1
docker build -t dbt-app . --platform linux/amd64
```

2. Run dbt commands.

   > Initialize our test project, copy packages.yml file, test downloading dbt packages.

```sh
docker run --rm -it -v $PWD:/dbt dbt-app dbt init .my_new_project &&
    cp packages.yml .my_new_project/ &&
    docker run --rm -it -v $PWD/.my_new_project:/dbt dbt-app dbt deps
```

```sh
...
Running with dbt=0.21.0
No profile "default" found, continuing with no target
Installing dbt-labs/dbt_utils@0.7.4
  Installed from version 0.7.4
  Up to date!
```

### Tested on

```sh
$ sw_vers
ProductName: macOS
ProductVersion: 12.0.1
BuildVersion: 21A559

$ system_profiler SPHardwareDataType
Hardware:

    Hardware Overview:

      Model Name: MacBook Pro
      Model Identifier: MacBookPro17,1
      Chip: Apple M1
      Total Number of Cores: 8 (4 performance and 4 efficiency)
      Memory: 16 GB

$ docker --version
Docker version 20.10.10, build b485636
```
