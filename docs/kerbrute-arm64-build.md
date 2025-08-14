# Kerbrute ARM64 ビルドガイド

## 問題
M1/M2 MacのDockerコンテナ（ARM64アーキテクチャ）でkerbruteを使用する際、公式リリースにはx86_64バイナリしか存在しないため、以下のエラーが発生する：

```
rosetta error: failed to open elf at /lib64/ld-linux-x86-64.so.2
Trace/breakpoint trap
```

## 解決方法
ソースコードから直接ARM64ネイティブバイナリをビルドする。

## 手順

### 1. アーキテクチャの確認
```bash
docker exec kali-tryhackme uname -m
# 出力: aarch64 (ARM64の場合)
```

### 2. 必要なツールのインストール
```bash
docker exec kali-tryhackme bash -c "apt update && apt install -y golang-go git"
```

### 3. ソースコードのクローンとビルド
```bash
docker exec kali-tryhackme bash -c "git clone https://github.com/ropnop/kerbrute.git && cd kerbrute && go build -o kerbrute"
```

### 4. 使用方法
コンテナに入って実行：
```bash
docker exec -it kali-tryhackme bash
cd kerbrute
./kerbrute userenum -d <domain> --dc <dc-ip> <userlist>
```

または直接実行：
```bash
docker exec kali-tryhackme bash -c "cd kerbrute && ./kerbrute userenum -d spookysec.local --dc <target-ip> /path/to/userlist.txt"
```

## なぜこの方法が有効か

1. **Go言語の特性**: Goはクロスプラットフォーム対応で、ソースコードから任意のアーキテクチャ向けにビルド可能
2. **ネイティブバイナリ**: ARM64環境で直接コンパイルすることで、エミュレーション不要の高速実行が可能
3. **依存関係の解決**: `go build`が必要なライブラリを自動的にダウンロード・リンク

## 注意事項
- 初回ビルド時は依存関係のダウンロードで時間がかかる場合がある
- ビルド済みバイナリは`kerbrute/kerbrute`に生成される
- 他のGoツールも同様の方法でARM64向けにビルド可能

## 参考情報
- [Kerbrute GitHub](https://github.com/ropnop/kerbrute)
- Goバージョン: 1.24.4（執筆時点）