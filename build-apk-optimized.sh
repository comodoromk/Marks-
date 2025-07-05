#!/bin/bash

echo "🚀 Compilando APK Marks Finanças..."

# Configurar Java
export JAVA_HOME=/nix/store/2vwkssqpzykk37r996cafq7x63imf4sp-openjdk-21+35/lib/openjdk
export PATH="$JAVA_HOME/bin:$PATH"

# Sync para Android
echo "📱 Sincronizando projeto..."
npx cap sync android

# Entrar no diretório Android
cd android

# Limpar cache
echo "🧹 Limpando cache..."
./gradlew clean --quiet

# Build APK com configurações otimizadas
echo "🔨 Compilando APK (isso pode levar alguns minutos)..."
./gradlew assembleDebug \
  --no-daemon \
  --parallel \
  --offline \
  --build-cache \
  --configuration-cache \
  2>&1 | tee ../build-progress.log

# Verificar se APK foi criado
APK_PATH="app/build/outputs/apk/debug/app-debug.apk"

if [ -f "$APK_PATH" ]; then
    echo "✅ APK criado com sucesso!"
    echo "📱 Localização: android/$APK_PATH"
    
    # Copiar para raiz do projeto
    cp "$APK_PATH" "../marks-financas.apk"
    echo "📱 Copiado para: marks-financas.apk"
    
    # Mostrar informações do APK
    ls -lh "$APK_PATH"
    
    echo ""
    echo "🎉 PRONTO! APK disponível para download:"
    echo "   marks-financas.apk"
    
else
    echo "❌ Erro na compilação. Verificando logs..."
    tail -20 ../build-progress.log
fi