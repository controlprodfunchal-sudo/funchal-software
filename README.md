# FUNCHAL · Software (escritório)

Sistema de acompanhamento de execução de serviços da FUNCHAL Construtora — com interface estilo macOS (mesa, janelas e dock).

- `sistema.html` — o sistema inteiro, em um arquivo só. Publicado em GitHub Pages: `https://controlprodfunchal-sudo.github.io/funchal-software/sistema.html`
- `index.html` — só redireciona para `sistema.html`.
- `versao-sistema.json` — versão publicada; o sistema aberto compara com a sua e avisa quando há uma nova. Mude `systemVersion` junto com `SYSTEM_VERSION` dentro de `sistema.html` a cada publicação.
- `supabase_funchal.sql` — cria a tabela `funchal_registros` e o bucket `funchal-fotos` no projeto Supabase da FUNCHAL.

Primeiro acesso: usuário `funchal`, senha `Funchal` (perfil Gestor). Troque a senha em Equipes e Funcionários → Usuários.

Nuvem: URL e chave publishable do projeto FUNCHAL ficam em `const SYNC_PADRAO` dentro de `sistema.html` (e podem ser trocadas em Configurações → Sincronização).
