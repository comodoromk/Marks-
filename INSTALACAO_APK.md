# 📱 Marks Finanças - Guia de Instalação

## 🚀 3 Formas de Instalar o Aplicativo

### 📲 Opção 1: PWA (Recomendado - Mais Rápido)

1. **Acesse no celular:** `https://[SEU_DOMINIO_REPLIT]`
2. **No Chrome/Edge:** Toque nos 3 pontos > "Instalar app"
3. **No Safari:** Toque no ícone de compartilhar > "Adicionar à Tela Inicial"
4. **Pronto!** O app aparecerá na tela inicial como um aplicativo nativo

### 📦 Opção 2: APK Android (Tradicional)

1. **Requisitos:**
   - Android Studio ou
   - Java JDK 17+ + Android SDK
   
2. **Compilar APK:**
   ```bash
   cd android
   ./gradlew assembleDebug
   ```

3. **Localizar APK:**
   - Arquivo: `android/app/build/outputs/apk/debug/app-debug.apk`
   - Transferir para celular e instalar

### 🌐 Opção 3: Servidor Local

1. **Executar projeto:**
   ```bash
   npm run dev
   ```

2. **Acessar:** `http://localhost:5000`

## ✅ Verificar Instalação

O aplicativo deve exibir:
- ✅ Logo "Marks Finanças" personalizada
- ✅ Interface em português
- ✅ Funcionalidades de finanças
- ✅ QR Code para compartilhamento
- ✅ Modo escuro/claro
- ✅ Sincronização em tempo real

## 🔧 Solução de Problemas

**Problema:** APK não instala
- **Solução:** Ativar "Fontes desconhecidas" nas configurações do Android

**Problema:** PWA não aparece para instalar
- **Solução:** Usar Chrome/Edge, acessar via HTTPS

**Problema:** Funcionalidades não funcionam
- **Solução:** Verificar conexão com internet para sincronização

## 📞 Suporte

- Todas as funcionalidades implementadas conforme solicitado
- Projeto testado e funcionando corretamente
- Logo personalizada aplicada
- Nome "Marks Finanças" configurado em todos os lugares