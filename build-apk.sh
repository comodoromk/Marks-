#!/bin/bash

echo "🔨 Construindo Marks Finanças APK..."

# Verificar se Capacitor está instalado
if ! command -v npx &> /dev/null; then
    echo "❌ NPX não está instalado. Por favor instale Node.js primeiro."
    exit 1
fi

# Fazer build da aplicação web
echo "📦 Fazendo build da aplicação web..."
npm run build

# Verificar se o build foi bem-sucedido
if [ ! -d "dist/public" ]; then
    echo "❌ Falha no build da aplicação web. Verifique os erros acima."
    exit 1
fi

# Inicializar projeto Capacitor se não existir
if [ ! -f "capacitor.config.ts" ]; then
    echo "⚙️ Inicializando projeto Capacitor..."
    npx cap init "Marks Finanças" com.marks.financas
fi

# Adicionar plataforma Android se não existir
if [ ! -d "android" ]; then
    echo "🤖 Adicionando plataforma Android..."
    npx cap add android
fi

# Sincronizar arquivos
echo "🔄 Sincronizando arquivos..."
npx cap sync android

# Copiar ícone personalizado
echo "🎨 Configurando ícone personalizado..."
if [ -f "resources/icon.png" ]; then
    mkdir -p android/app/src/main/res/drawable
    cp resources/icon.png android/app/src/main/res/drawable/icon.png
    
    # Copiar para diferentes densidades se necessário
    mkdir -p android/app/src/main/res/mipmap-{hdpi,mdpi,xhdpi,xxhdpi,xxxhdpi}
    cp resources/icon.png android/app/src/main/res/mipmap-hdpi/ic_launcher.png
    cp resources/icon.png android/app/src/main/res/mipmap-mdpi/ic_launcher.png
    cp resources/icon.png android/app/src/main/res/mipmap-xhdpi/ic_launcher.png
    cp resources/icon.png android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png
    cp resources/icon.png android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png
fi

# Abrir Android Studio ou construir APK
echo "🏗️ Preparando para construir APK..."
echo "📱 Para finalizar a construção do APK:"
echo "   1. Certifique-se que o Android Studio está instalado"
echo "   2. Execute: npx cap open android"
echo "   3. No Android Studio, vá em Build > Build Bundle(s) / APK(s) > Build APK(s)"
echo "   4. O APK será gerado em android/app/build/outputs/apk/debug/"

echo "✅ Projeto preparado com sucesso!"
echo "🎯 Nome do App: Marks Finanças"
echo "📱 Package ID: com.marks.financas"
echo "🎨 Ícone: Configurado com a logo fornecida"