# 1. Recebe os argumentos escritos depois do nome do script.
# Exemplo: -N validate. As opções são repassadas ao Maven.
$argumentosMaven = @($args)

# 2. Se nenhum argumento foi informado, usa clean verify.
# clean limpa arquivos gerados; verify percorre o build e suas verificações.
if ($argumentosMaven.Count -eq 0) { $argumentosMaven = @('clean','verify') }

# 3. Interrompe o script se um comando do PowerShell gerar erro.
# O código de saída do Maven será conferido separadamente no passo 7.
$ErrorActionPreference = 'Stop'

# 4. Localiza a raiz do laboratório.
# PSScriptRoot é a pasta scripts; Split-Path -Parent obtém a pasta acima.
$raiz = Split-Path -Parent $PSScriptRoot

# 5. Guarda a pasta atual do terminal e entra na raiz do laboratório.
Push-Location -LiteralPath $raiz
try {
    # 6. Executa o Maven a partir da raiz.
    # & chama o comando mvn.
    # -Dmaven.repo.local escolhe onde guardar bibliotecas e plugins baixados.
    # @argumentosMaven repassa cada argumento como uma opção separada.
    & mvn "-Dmaven.repo.local=$raiz\.m2\repository" @argumentosMaven

    # 7. Confere se o Maven terminou com sucesso: código zero.
    # Um código diferente de zero gera um erro no script.
    if ($LASTEXITCODE -ne 0) { throw "Maven terminou com código $LASTEXITCODE" }
} finally {
    # 8. Ao sair do bloco try, retorna à pasta anterior, mesmo em caso de erro.
    Pop-Location
}
