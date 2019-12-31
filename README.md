# RxJava3 migration tool

This tool replaces all the RxJava2 imports in your code to Rxjava3 imports. This way you can focus your efforts [to check which other changes][rxjava-changelog] affect your code and fix them.

## Usage

Clone this repo and then execute this command:

```shell
./migrate.sh <path/to/your/project/>
```

If you want to migrate just a module or a package instead of all the project write the folder path.

## More info

This project supports the migration of these libraries to RxJava3:

- [RxJava](https://github.com/ReactiveX/RxJava)
- [RxAndroid](https://github.com/ReactiveX/RxAndroid)
- [RxBindings](https://github.com/JakeWharton/RxBinding)
- [RxRelay](https://github.com/JakeWharton/RxRelay)

If you want to add support to another library, please create an issue or a PR.

## How does it work

This script reads from `rxjava3-class-mapping.csv` to know which replaces it should make. If you find an import that is not migrated, please fill an issue. Or even better: add it to `rxjava3-class-mapping.csv` and summit a PR!

## Contributing

If you edit `rxjava3-class-mapping.csv`, please run this script to rearrange the lines again:

```shell
sort -u -t , -k2 -o rxjava3-class-mapping.csv rxjava3-class-mapping.csv
```

## Credits

- [Dan Lew][danlew]: He created the [original script][androidx-migration-script] to migrate to AndroidX and I adapted it.

 [androidx-migration-script]: https://gist.github.com/dlew/5db1b780896bbc6f542e7c00a11db6a0
 [danlew]: https://twitter.com/danlew42
 [rxjava-changelog]: https://github.com/ReactiveX/RxJava/releases/tag/v3.0.0
