# entware-rust
Rust packages feed

0. Читаем и выполняем [Compile packages from sources](https://github.com/Entware/Entware/wiki/Compile-packages-from-sources). 

1. Добавляем фид в конфиг:
```
echo 'src-git-full rust https://github.com/The-BB/entware-rust.git' >> feeds.conf
```
2. Обновляем фид:
```
./scripts/feeds update rust
```
3. Подготавливаем к работе (создаём копии и патчим):
```
sh ./feeds/rust/backup-recover.sh backup
```
4. Добавляем пакеты из фида:
```
./scripts/feeds install -a -p rust
```
5. Собираем пакеты...

6. Перед обновлением фидов восстанавливаем:
```
sh ./feeds/rust/backup-recover.sh recovery
```
