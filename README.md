<div align="center">

# TrueHate

**Plataforma de relatos internos — denúncias anônimas ou identificadas com avaliações, comentários e painel administrativo.**

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

</div>

## Sobre

O **TrueHate** nasceu da ideia de dar voz a quem presencia um problema dentro de uma empresa ou instituição de ensino e não tem um canal seguro para relatar. A plataforma permite publicar denúncias **de forma anônima ou identificada**, avaliar empresas com nota de 1 a 5, comentar e responder a outros relatos.

Quem modera tem um painel próprio: acompanha tudo que foi publicado, gerencia usuários e permissões, lê os problemas relatados sobre o próprio sistema e consulta o histórico de ações.

## Funcionalidades

- **Cadastro e login** com três perfis de acesso
- **Relatos anônimos ou identificados**, com empresa, texto e nota
- **Comentários e respostas** em cada relato (thread de um nível)
- **Edição e exclusão** dos próprios relatos e comentários
- **Busca** por empresa, autor, texto ou nota
- **Painel administrativo**: gerenciar usuários, permissões, relatos e problemas reportados
- **Histórico de ações** por usuário e visão global para administradores
- **Relatar problema** com formulário público (nome, e-mail, telefone e descrição)
- **Perfil** com dados da conta e tipo de usuário

## Perfis de acesso

| `inadmin` | Perfil | Pode |
|---|---|---|
| `0` | Usuário | Avaliar, comentar, editar e excluir o próprio conteúdo |
| `1` | Administrador | Tudo do usuário + painel admin, usuários e histórico global |
| `2` | Empresa | Acompanhar relatos, **sem** publicar avaliações |

## Estrutura

```
TrueHate/
├─ app.py              rotas, regras de negócio e acesso ao MySQL
├─ database.sql        criação do banco e das tabelas
├─ requirements.txt    dependências
├─ .env.example        modelo das variáveis de ambiente
├─ static/             CSS, imagens e arquivos do front-end
└─ templates/          telas (Jinja)
   ├─ index.html, login.html, cadastro.html
   ├─ listar_avaliacoes.html, comentarios.html, nova_avaliacao.html
   ├─ perfil.html, editar.html, meu_historico.html
   ├─ administrador.html, listarusuario.html, admin_problemas.html
   └─ ...
```

## Como rodar

```bash
git clone https://github.com/CarlosDuhring/TrueHate.git
cd TrueHate

python -m venv venv
# Windows
venv\Scripts\activate
# Linux/macOS
source venv/bin/activate

pip install -r requirements.txt
```

Crie o banco e as tabelas:

```bash
mysql -u root -p < database.sql
```

Crie o arquivo `.env` a partir do modelo e preencha com os dados do seu MySQL:

```bash
cp .env.example .env
```

```env
SECRET_KEY=uma-chave-aleatoria
DB_HOST=localhost
DB_USER=root
DB_PASS=senha-do-mysql
DB_NAME=true_hate_app
```

Por fim:

```bash
python app.py
```

A aplicação sobe em `http://127.0.0.1:5000`. O primeiro usuário criado com perfil **Administrador** já pode acessar o painel em `/admin`.

## Configuração

Nenhuma credencial fica no código: host, usuário, senha e nome do banco vêm de variáveis de ambiente (ou do `.env`, carregado automaticamente em desenvolvimento). O `.env` está no `.gitignore`.

## Roadmap

- [ ] Hash de senha com `werkzeug.security`
- [ ] Proteção CSRF nos formulários
- [ ] Paginação no feed e no painel
- [ ] Filtros por empresa, nota e período
- [ ] Testes automatizados das rotas

---

<sub>Desenvolvido por **Carlos Eduardo Duhring** · [github.com/CarlosDuhring](https://github.com/CarlosDuhring)</sub>
