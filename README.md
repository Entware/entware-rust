# entware-rust
Rust packages feed

1. Читаем и выполняем [Compile packages from sources](https://github.com/Entware/Entware/wiki/Compile-packages-from-sources)

2. Добавляем фид в конфиг:
```
echo 'src-git-full rust https://github.com/The-BB/entware-rust.git' >> feeds.conf
```

3. Обновляем:
```
./scripts/feeds update rust

./scripts/feeds install -a -p rust
```

4. Патчим tools/Makefile (при желании, создаём его копию (backup)):
```
patch -p1 -d . < ./feeds/rust/entware-rust.patch
```
```
cp tools/Makefile tools/Makefile.orig
```
5. Удаляем (или патчим python-cryptography):
```
rm -rf ./feeds/packages/lang/python/python-cryptography
```
```
patch -p1 -d ./feeds/packages < ./feeds/rust/py-cryptography.patch
```
