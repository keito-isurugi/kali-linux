# Kali Linux Docker for TryHackMe

TryHackMe用のKali Linux Docker環境です。

## セットアップ

### 1. 必要なディレクトリを作成
```bash
mkdir -p workspace tools
```

### 2. VPNファイルを配置
TryHackMeからダウンロードした.ovpnファイルを`tryhackme.ovpn`という名前でこのディレクトリに配置

### 3. Docker環境をビルド
```bash
docker compose build
```

### 4. コンテナを起動
```bash
docker compose up -d
```

### 5. コンテナに接続
```bash
docker exec -it kali-tryhackme /bin/bash
```

## VPN接続

コンテナ内で以下のいずれかを実行：

### 方法1: スクリプトを使用（推奨）
```bash
/root/connect-vpn.sh
```

### 方法2: 直接実行
```bash
openvpn ~/tryhackme.ovpn
```
※Dockerコンテナ内はrootユーザーなので`sudo`は不要です

## ディレクトリ構成

- `workspace/` - 作業ディレクトリ（コンテナの/root/workspaceにマウント）
- `tools/` - 追加ツール用（コンテナの/root/toolsにマウント）
- `tryhackme.ovpn` - VPN設定ファイル（コンテナの/root/tryhackme.ovpnにマウント）

## インストール済みツール

### スキャニング
- nmap
- gobuster
- dirb
- nikto
- enum4linux

### エクスプロイト
- metasploit-framework
- sqlmap
- exploitdb

### パスワードクラッキング
- john
- hashcat
- hydra

### Web関連
- burpsuite
- wfuzz
- ffuf

### ネットワーク
- netcat
- socat
- proxychains4
- tcpdump
- wireshark

### その他
- seclists（wordlists）
- impacket
- pwntools

## コンテナの停止・削除

```bash
# 停止
docker compose stop

# 削除
docker compose down

# イメージも含めて削除
docker compose down --rmi all
```