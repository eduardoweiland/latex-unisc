# Modelo LaTeX UNISC
[![Versão v1.1.2](https://img.shields.io/badge/Vers%C3%A3o-v1.1.2-brightgreen.svg)](CHANGELOG.md)
[![Licença LPPL 1.3c](https://img.shields.io/badge/Licen%C3%A7a-LPPL_1.3c-blue.svg)](LICENSE)
[![Documentação WIP](https://img.shields.io/badge/Docs-WIP-red.svg)](https://github.com/eduardoweiland/latex-unisc/wiki)
[![Issues](https://img.shields.io/github/issues/eduardoweiland/latex-unisc.svg)](https://github.com/eduardoweiland/latex-unisc/issues)

Este projeto contém o modelo LaTeX para escrita de trabalhos seguindo as normas da Universidade de Santa Cruz do Sul (UNISC).

O modelo segue as [normas para apresentação de trabalhos da UNISC][Normas UNISC] (AGNES; HELFER, 2013). Se encontrar algum caso onde o modelo não está de acordo com as normas, crie um [issue](https://github.com/eduardoweiland/latex-unisc/issues/new) para que esse problema seja corrigido.

## Utilização do modelo

A documentação para utilizar esse modelo ainda está sendo escrita e está bem incompleta. O que já existe hoje está disponível na [Wiki](https://github.com/eduardoweiland/latex-unisc/wiki). Em caso de dúvidas específicas sobre a utilização do modelo, crie um [issue](https://github.com/eduardoweiland/latex-unisc/issues/new) descrevendo a dúvida e, assim que possível, essas dúvidas serão resolvidas e documentadas.

Para obter ajuda, também existe uma lista de e-mails para discussão do LaTeX UNISC, que pode ser utilizada para resolver dúvidas específicas sobre o modelo ou sobre escrita de documentos com LaTeX em geral. A lista também é utilizada para informar de atualizações realizadas no modelo. Para participar da lista de discussão, cadastre-se na página <http://www.freelists.org/list/latex-unisc>.

## Dependências

Os seguintes pacotes LaTeX são necessários para utilizar esse modelo:

* xargs
* indentfirst
* chngcntr
* setspace
* ccaption
* times
* mathptmx
* glossaries
* titlesec
* tocstyle
* geometry
* hyperref
* abntex2cite
* listings

O editor online [ShareLaTeX][] já possui todos esses pacotes, então funciona sem problemas.

Para instalação desses pacotes no Fedora 22+, o comando é:

    sudo dnf install texlive-xargs texlive-tools texlive-chngcntr texlive-setspace texlive-ccaption \
                     texlive-times texlive-psnfss texlive-glossaries texlive-titlesec texlive-geometry \
                     texlive-hyperref texlive-abntex2 texlive-listings

Para instalação no Ubuntu/Mint/Debian e derivados, o comando é:

    sudo apt-get install texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-publishers

Para outros sistemas o nome dos pacotes e a forma de instalação pode ser diferente.

## Compilação com o modelo

Para utilizar apenas os estilos de formatação do modelo, os passos de compilação são os mesmos utilizados para outros documentos.

Se for utilizado o pacote `glossaries` (já incluído na classe) para criar a lista de abreviaturas, é necessário seguir os passos descritos no [manual do pacote][manual-glossaries].

> Se estiver utilizando o [ShareLaTeX][], a compilação já irá gerar os arquivos necessários pelo `glossaries`. Porém, ao adicionar novas entradas no glossário, é necessário remover os arquivos em cache para atualizá-los. Isso é feito clicando em Logs e arquivos de saída (ao lado do botão Recompilar) e no final clicar em Limpar arquivos em cache (botão com ícone de lixeira).

## Usando citações

Para citar alguma entrada das referências durante o texto, é utilizado o pacote `abntex2cite-alf`. A documentação dos comandos utilizados para criar os vários estilos de referências existentes pode ser encontrada na [documentação do pacote][abnTeX2cite].

## Desenvolvimento

### Processo de release

* Garantir que todas as modificações que serão publicadas estão no branch master
* Alterar o número da versão na declaração da classe unisc em `src/unisc.cls`
* Listar as modificações da versão em `CHANGELOG.md`
* Alterar a versão exibida no badge no `README.md`
* Criar um commit com as alterações nos três arquivos com a mensagem "Lançada versão x.y.z" (`git commit -m "Lançada versão x.y.z"`)
* Criar uma tag com "v" seguido do número da versão e a mensagem "Versão x.y.z" (`git tag -am "Versão x.y.z" vx.y.z`)
* Enviar tudo para o GitHub (`git push origin master --tags`)

## Referências

AGNES, C.; HELFER, I. _Normas para apresentação de trabalhos acadêmicos_. 1. ed. atual. Santa Cruz do Sul, RS: EDUNISC, 2013. ISBN 9788575782033.


[ShareLaTeX]: https://pt.sharelatex.com "ShareLaTeX - Online LaTeX Editor"
[Normas UNISC]: http://www.unisc.br/editora/e_books_normas.pdf "Normas para apresentação de trabalhos acadêmicos"
[manual-glossaries]: http://mirrors.ctan.org/macros/latex/contrib/glossaries/glossaries-user.pdf "User Manual for glossaries"
[abnTeX2cite]: http://repositorios.cpai.unb.br/ctan/macros/latex/contrib/abntex2/doc/abntex2cite-alf.pdf
