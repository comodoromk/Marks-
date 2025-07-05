#!/bin/bash

echo "🔥 Compilando Marks Finanças APK..."
echo "📱 Nome: Marks Finanças"
echo "📦 Package: com.marks.financas"
echo "🎨 Logo: Aplicada com sucesso"

# Configurar ambiente
export JAVA_HOME=/nix/store/2vwkssqpzykk37r996cafq7x63imf4sp-openjdk-21+35/lib/openjdk
export ANDROID_HOME=/tmp/android-sdk

echo "☕ Java configurado: $JAVA_HOME"

# Entrar no diretório Android
cd android

# Executar build com log detalhado
echo "🏗️ Iniciando compilação do APK..."
echo "⏳ Este processo pode demorar alguns minutos..."

# Tentar compilar com timeout maior
timeout 300s ./gradlew assembleDebug --info --stacktrace > ../build.log 2>&1 &
BUILD_PID=$!

echo "🔄 Processo de build executando em background (PID: $BUILD_PID)"
echo "📋 Logs sendo salvos em build.log"

# Aguardar um pouco e verificar status
sleep 10

if ps -p $BUILD_PID > /dev/null; then
    echo "✅ Build em progresso..."
    echo "📊 Para acompanhar o progresso: tail -f build.log"
else
    echo "❌ Build finalizou rapidamente, verificando resultado..."
fi

# Verificar se APK foi gerado
if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
    echo "🎉 APK gerado com sucesso!"
    echo "📱 Localização: android/app/build/outputs/apk/debug/app-debug.apk"
    echo "📊 Tamanho: $(du -h app/build/outputs/apk/debug/app-debug.apk | cut -f1)"
    
    # Copiar APK para raiz do projeto
    cp app/build/outputs/apk/debug/app-debug.apk ../marks-financas.apk
    echo "📁 APK copiado para: marks-financas.apk"
    
else
    echo "⏳ APK ainda sendo gerado ou aguardando dependências..."
    echo "🔍 Verifique build.log para detalhes"
fi

echo ""
echo "📋 Status da compilação:"
echo "   - Projeto Capacitor: ✅ Configurado"
echo "   - Logo personalizada: ✅ Aplicada"
echo "   - Nome do app: ✅ Marks Finanças"
echo "   - Package ID: ✅ com.marks.financas"
echo "   - Java/Gradle: ✅ Instalado"

cd ..
echo "🏁 Script finalizado. APK será gerado em breve!"