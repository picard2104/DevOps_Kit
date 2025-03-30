#!/bin/bash

# Определяем ОС
OS="unknown"
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    OS="$ID"
elif [[ "$(uname)" == "Darwin" ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
fi

# Установка AWS CLI
case "$OS" in
    ubuntu|debian)
        echo "Установка для Ubuntu/Debian..."
        sudo apt-get update && sudo sudo snap install aws-cli --classic
        ;;
    centos|rhel|fedora)
        echo "Установка для CentOS/RHEL..."
        if command -v dnf >/dev/null; then
            sudo dnf install -y awscli
        else
            sudo yum install -y awscli
        fi
        ;;
    macos)
        echo "Установка для MacOS..."
        if ! command -v brew >/dev/null; then
            echo "Установка Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install awscli
        ;;
    windows)
        echo "Установка для Windows..."
        curl -O https://awscli.amazonaws.com/AWSCLIV2.msi
        msiexec.exe /i AWSCLIV2.msi /quiet
        ;;
    *)
        echo "ОС не поддерживается. Установите AWS CLI вручную."
        exit 1
        ;;
esac

# Проверка установки
if aws --version >/dev/null 2>&1; then
    echo "AWS CLI установлен."
else
    echo "AWS не установлн"
    exit 1
fi

# Настройка профиля
echo "Настройка профиля AWS..."
aws configure
